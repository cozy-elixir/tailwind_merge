defmodule TailwindMerge.Mapping do
  defstruct [:base_class, :group, :modifiers, :important]

  @before_compile TailwindMerge.Generator

  def new(class) do
    {base_class, modifiers} = pop_modifiers(class)
    {base_class, important} = pop_important(base_class)
    group = lookup_group(base_class)

    %__MODULE__{
      base_class: base_class,
      group: group,
      modifiers: modifiers,
      important: important
    }
  end

  defp pop_modifiers(class) do
    Regex.split(~r/:(?![^[]*?\])/, class)
    |> List.pop_at(-1)
  end

  defp pop_important("!" <> base_class), do: {base_class, true}
  defp pop_important(base_class), do: {base_class, false}
end

defimpl String.Chars, for: TailwindMerge.Mapping do
  def to_string(%TailwindMerge.Mapping{base_class: base_class, modifiers: modifiers}) do
    List.flatten(modifiers, [base_class])
    |> Enum.join(":")
  end
end
