defmodule TailwindMerge do
  alias TailwindMerge.DefaultConfig
  alias TailwindMerge.Mapping

  @doc """
  Merges Tailwind CSS classes.

  ## The mechanism

  When merge two clasess, this function will first get the group of the two
  classes. If they are in the same group, the last one will be retained, the
  previous one will be dropped. It will also consider the variants (like `hover`)
  and, once again, the last one will be retained, the previous one will be
  dropped.

  """
  def merge(classes) when is_list(classes) do
    Enum.join(classes, " ")
    |> merge()
  end

  def merge(classes) when is_binary(classes) do
    classes
    |> String.trim()
    |> split_classes()
    |> Enum.map(&Mapping.new(&1))
    |> Enum.reverse()
    |> Enum.uniq_by(fn %Mapping{mods: mods, group: group} -> {mods, group} end)
    |> handle_conflicts()
    |> Enum.reverse()
    |> Enum.map(fn %Mapping{base_class: class, mods: mods} ->
      (mods ++ [class]) |> Enum.join(":")
    end)
    |> Enum.join(" ")
  end

  defp split_classes(classes) when is_binary(classes) do
    Regex.split(~r/\s+/, classes)
  end

  defp handle_conflicts(mappings) do
    mappings
    |> Enum.reduce(%{classes: [], conflicts: []}, fn %Mapping{mods: mods, group: group} = data,
                                                     acc ->
      class = Enum.join(mods ++ [group], ":")

      case Enum.member?(acc.conflicts, class) do
        true ->
          acc

        false ->
          conflicts =
            group
            |> get_conflicting_class_group_ids()

          %{acc | conflicts: conflicts, classes: acc.classes ++ [data]}
      end
    end)
    |> Map.get(:classes)
  end

  defp get_conflicting_class_group_ids(class) when is_binary(class) do
    String.to_existing_atom(class)
    |> get_conflicting_class_group_ids()
  rescue
    ArgumentError -> [class]
  end

  defp get_conflicting_class_group_ids(class) do
    DefaultConfig.conflicting_class_groups()[class] || []
  end
end
