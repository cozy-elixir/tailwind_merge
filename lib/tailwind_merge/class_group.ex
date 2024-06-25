defmodule TailwindMerge.ClassGroup do
  @moduledoc false
  alias TailwindMerge.Config

  @unknown nil

  @doc """
  It generates two functions into target module according to `@config`:

    * `lookup_group/1`
    * `get_conflicting_groups/1`

  """
  defmacro __before_compile__(_env) do
    caller_module = __CALLER__.module
    config = Module.get_attribute(__CALLER__.module, :config)

    unless match?(%Config{}, config) do
      raise ArgumentError,
            "the `@config` module attribute should be set for `#{inspect(caller_module)}`"
    end

    {static_specs, dynamic_specs} =
      config.class_groups
      |> Enum.reduce([], fn {name, specs}, acc ->
        s = Enum.map(Config.expand(specs), &{&1, name})
        [s | acc]
      end)
      |> Enum.reverse()
      |> List.flatten()
      |> Enum.split_with(fn {class_segs, _name} ->
        case Enum.at(class_segs, -1) do
          {module, _fun} when is_atom(module) -> false
          _ -> true
        end
      end)

    static_lookup_funs = generate_static_lookup_funs(static_specs)
    dynamic_lookup_funs = generate_dynamic_lookup_funs(dynamic_specs)
    fallback_lookup_fun = generate_fallback_lookup_fun()

    conflicting_fun =
      quote do
        @conflicting_class_groups Map.new(unquote(config.conflicting_class_groups))
        def get_conflicting_groups(class) do
          Map.get(@conflicting_class_groups, class, [])
        end
      end

    [
      static_lookup_funs,
      dynamic_lookup_funs,
      fallback_lookup_fun,
      conflicting_fun
    ]
  end

  defp generate_static_lookup_funs(static_specs) do
    Enum.map(static_specs, fn {class_segs, name} ->
      class = Enum.join(class_segs, "-")

      quote do
        def lookup_group(unquote(class)), do: unquote(name)
      end
    end)
  end

  def generate_dynamic_lookup_funs(specs) do
    specs
    |> Enum.map(fn {class_segs, name} ->
      {class_prefix_segs, [validator]} = Enum.split(class_segs, -1)
      {class_prefix_segs, validator, name}
    end)
    |> Enum.group_by(
      fn {class_prefix_segs, _validator, _name} -> class_prefix_segs end,
      fn {_class_prefix_segs, validator, name} -> {validator, name} end
    )
    # sort the specs according to the level of detail provided by the class_prefix_segs
    |> Enum.sort_by(
      fn {class_prefix_segs, _validator_and_names} ->
        class_prefix_segs
        |> Enum.map(fn seg -> String.split(seg, "-") end)
        |> List.flatten()
        |> length()
      end,
      :desc
    )
    |> Enum.map(fn {class_prefix_segs, validator_and_names} ->
      class_prefix = class_prefix_segs |> Enum.join("-") |> Kernel.<>("-")

      fallback_clause =
        quote do
          true -> unquote(@unknown)
        end

      clauses =
        Enum.map(validator_and_names, fn {{module, fun}, name} ->
          quote do
            unquote(module).unquote(fun)(seg) -> unquote(name)
          end
        end)
        |> Kernel.++([fallback_clause])
        |> List.flatten()

      quote do
        def lookup_group(unquote(class_prefix) <> seg) do
          cond do
            unquote(clauses)
          end
        end
      end
    end)
  end

  defp generate_fallback_lookup_fun do
    quote do
      def lookup_group(_class), do: unquote(@unknown)
    end
  end
end
