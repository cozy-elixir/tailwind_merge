defmodule TailwindMerge do
  @moduledoc """
  Provides utility function to efficiently merge Tailwind CSS classes in Elixir
  without style conflicts.

  ## Usage

  To use this package, define a helper module in your project:

      defmodule DemoWeb.ClassHelper do
        use TailwindMerge
      end

  Then, `DemoWeb.ClassHelper.tw/1` will be available to use.

  ## Customization

  To customize the default behaviour, passing options to the `use` call:

     * `:config` - specify the config to use.
     * `:as` - specify the name of generated function.

  Let's customize colors to use:

      defmodule DemoWeb.ClassHelper do
        existing_colors = TailwindMerge.Config.colors()
        new_colors = existing_colors ++ ["primary", "secondary"]
        new_class_groups = TailwindMerge.Config.class_groups(colors: new_colors)

        use TailwindMerge,
          config: TailwindMerge.Config.new(class_groups: new_class_groups),
          as: :merge_class
      end

  Then, call it:

      DemoWeb.ClassHelper.merge_class("text-red-300 text-primary")
      # "text-primary"

  """

  alias TailwindMerge.Config
  alias TailwindMerge.Class
  alias TailwindMerge.ClassGroup

  defmacro __using__(opts) do
    config = Keyword.get_lazy(opts, :config, fn -> Macro.escape(Config.new()) end)
    as = Keyword.get(opts, :as, :tw)

    class_group_module = Module.concat(__CALLER__.module, "TailwindMerge.ClassGroup")

    quote do
      defmodule unquote(class_group_module) do
        @config unquote(config)
        @before_compile ClassGroup
      end

      @doc """
      Merges Tailwind CSS classes.
      """
      @spec unquote(as)(binary() | list()) :: binary()
      def unquote(as)(classes), do: TailwindMerge.merge(classes, unquote(class_group_module))
    end
  end

  @doc false
  def merge(classes, class_group_module) when is_list(classes) do
    classes = Enum.join(classes, " ")
    merge(classes, class_group_module)
  end

  def merge(classes, class_group_module) when is_binary(classes) do
    classes
    |> String.trim()
    |> split_classes()
    |> Enum.map(&Class.new(&1, class_group_module))
    |> clean_classes(class_group_module)
    |> Enum.map_join(" ", &to_string/1)
  end

  defp split_classes(classes) when is_binary(classes) do
    Regex.split(~r/\s+/, classes)
  end

  defp clean_classes(classes, class_group_module) do
    classes
    |> Enum.reverse()
    |> handle_related_classes()
    |> handle_conflicting_classes(class_group_module)
    |> Enum.reverse()
  end

  defp handle_related_classes(classes) do
    Enum.uniq_by(classes, fn %Class{} = class ->
      {class.group, class.modifiers}
    end)
  end

  defp handle_conflicting_classes(classes, class_group_module) do
    classes
    |> Enum.reduce({[], []}, fn %Class{} = class, {classes, conflicts} ->
      conflict = {class.group, class.modifiers}

      if Enum.member?(conflicts, conflict) do
        {classes, conflicts}
      else
        conflicting_groups = apply(class_group_module, :get_conflicting_groups, [class.group])
        new_conflicts = Enum.map(conflicting_groups, &{&1, class.modifiers})
        {[class | classes], conflicts ++ new_conflicts}
      end
    end)
    |> elem(0)
    |> Enum.reverse()
  end
end
