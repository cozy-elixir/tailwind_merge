defmodule TailwindMerge.Class do
  @moduledoc false

  defstruct [:base, :group, :modifiers, :important]

  def new(class, class_group_module) do
    {base, modifiers} = pop_modifiers(class)
    {base, important} = pop_important(base)
    group = apply(class_group_module, :lookup_group, [base]) || class

    %__MODULE__{
      base: base,
      group: group,
      modifiers: modifiers,
      important: important
    }
  end

  defp pop_modifiers(class) do
    Regex.split(~r/:(?![^[]*?\])/, class)
    |> List.pop_at(-1)
  end

  defp pop_important("!" <> base), do: {base, true}
  defp pop_important(base), do: {base, false}
end

defimpl String.Chars, for: TailwindMerge.Class do
  def to_string(%TailwindMerge.Class{base: base, modifiers: modifiers}) do
    List.flatten(modifiers, [base])
    |> Enum.join(":")
  end
end
