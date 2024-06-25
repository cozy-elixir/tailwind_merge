defmodule TailwindMerge.Validator do
  @regex_arbitrary ~r/^\[(.+)\]$/
  def arbitrary?(v) do
    Regex.match?(@regex_arbitrary, v)
  end

  @regex_length ~r/\d+(%|px|em|rem|vh|vw|pt|pc|in|cm|mm|cap|ch|ex|lh|rlh|vi|vb|vmin|vmax)/i
  def arbitrary_length?(v) do
    case Regex.run(@regex_arbitrary, v) do
      nil ->
        false

      [_, str] ->
        String.starts_with?(str, "length:") || Regex.match?(@regex_length, str)
    end
  end

  @regex_color ~r/(#[0-9a-fA-F]{3,8}|rgba?\([^)]+\)|hsl\([^)]+\))/
  def arbitrary_color?(v) do
    case Regex.run(@regex_arbitrary, v) do
      nil ->
        false

      [_, str] ->
        String.starts_with?(str, "color:") || Regex.match?(@regex_color, str)
    end
  end

  def arbitrary_position?(v) do
    case Regex.run(@regex_arbitrary, v) do
      nil ->
        false

      [_, str] ->
        String.starts_with?(str, "position:")
    end
  end

  def integer?(v) do
    case Integer.parse(v) do
      {_num, ""} -> true
      _ -> false
    end
  end

  def float?(v) do
    case Float.parse(v) do
      {_num, ""} -> true
      _ -> false
    end
  end

  def ratio?(v) do
    Regex.match?(~r/^\d+\/\d+$/, v)
  end

  def number?(v) do
    integer?(v) || float?(v)
  end

  @regex_size_abbr ~r/^(\d+)?(xs|sm|md|lg|xl)$/
  def size_abbr?(v) do
    Regex.match?(@regex_size_abbr, v)
  end

  def opacity?(v) do
    Regex.match?(~r/^\w*\/\d{1,3}$/, v)
  end
end
