defmodule TailwindMerge.ConfigUtils do
  alias TailwindMerge.Validate

  def breaks(), do: ~w(auto avoid all avoid-page page left right column)

  def positions(),
    do: ~w(bottom center left left-bottom left-top right right-bottom right-top top)

  def overflow(), do: ~w(auto hidden clip visible scroll)
  def overscroll(), do: ~w(auto contain none)
  def align(), do: ~w(start end center between around evenly)
  def line_styles(), do: ~w(solid dashed dotted double none)

  def blend_modes(),
    do:
      ~w(normal multiply screen overlay darken lighten color-dodge color-burn hard-light soft-light difference exclusion hue saturation color luminosity plus-lighter)

  def zero_and_empty(), do: ["", "0", {Validate, :is_arbitrary_value}]

  def colors() do
    [
      "inherit",
      "current",
      "transparent",
      "black",
      "white",
      %{
        slate: [{Validate, :is_integer?}, {Validate, :is_opacity?}],
        gray: [{Validate, :is_integer?}, {Validate, :is_opacity?}],
        zinc: [{Validate, :is_integer?}, {Validate, :is_opacity?}],
        neutral: [{Validate, :is_integer?}, {Validate, :is_opacity?}],
        stone: [{Validate, :is_integer?}, {Validate, :is_opacity?}],
        red: [{Validate, :is_integer?}, {Validate, :is_opacity?}],
        orange: [{Validate, :is_integer?}, {Validate, :is_opacity?}],
        amber: [{Validate, :is_integer?}, {Validate, :is_opacity?}],
        yellow: [{Validate, :is_integer?}, {Validate, :is_opacity?}],
        lime: [{Validate, :is_integer?}, {Validate, :is_opacity?}],
        green: [{Validate, :is_integer?}, {Validate, :is_opacity?}],
        emerald: [{Validate, :is_integer?}, {Validate, :is_opacity?}],
        teal: [{Validate, :is_integer?}, {Validate, :is_opacity?}],
        cyan: [{Validate, :is_integer?}, {Validate, :is_opacity?}],
        sky: [{Validate, :is_integer?}, {Validate, :is_opacity?}],
        blue: [{Validate, :is_integer?}, {Validate, :is_opacity?}],
        indigo: [{Validate, :is_integer?}, {Validate, :is_opacity?}],
        violet: [{Validate, :is_integer?}, {Validate, :is_opacity?}],
        purple: [{Validate, :is_integer?}, {Validate, :is_opacity?}],
        fuchsia: [{Validate, :is_integer?}, {Validate, :is_opacity?}],
        pink: [{Validate, :is_integer?}, {Validate, :is_opacity?}],
        rose: [{Validate, :is_integer?}, {Validate, :is_opacity?}]
      }
    ]
  end
end
