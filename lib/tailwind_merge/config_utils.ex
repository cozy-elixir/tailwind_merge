defmodule TailwindMerge.ConfigUtils do
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

  def zero_and_empty(), do: ["", "0", {TailwindMerge.Validate, :is_arbitrary_value}]

  def colors() do
    [
      "inherit",
      "current",
      "transparent",
      "black",
      "white",
      %{
        slate: [{TailwindMerge.Validate, :is_integer?}, {TailwindMerge.Validate, :is_opacity?}],
        gray: [{TailwindMerge.Validate, :is_integer?}, {TailwindMerge.Validate, :is_opacity?}],
        zinc: [{TailwindMerge.Validate, :is_integer?}, {TailwindMerge.Validate, :is_opacity?}],
        neutral: [{TailwindMerge.Validate, :is_integer?}, {TailwindMerge.Validate, :is_opacity?}],
        stone: [{TailwindMerge.Validate, :is_integer?}, {TailwindMerge.Validate, :is_opacity?}],
        red: [{TailwindMerge.Validate, :is_integer?}, {TailwindMerge.Validate, :is_opacity?}],
        orange: [{TailwindMerge.Validate, :is_integer?}, {TailwindMerge.Validate, :is_opacity?}],
        amber: [{TailwindMerge.Validate, :is_integer?}, {TailwindMerge.Validate, :is_opacity?}],
        yellow: [{TailwindMerge.Validate, :is_integer?}, {TailwindMerge.Validate, :is_opacity?}],
        lime: [{TailwindMerge.Validate, :is_integer?}, {TailwindMerge.Validate, :is_opacity?}],
        green: [{TailwindMerge.Validate, :is_integer?}, {TailwindMerge.Validate, :is_opacity?}],
        emerald: [{TailwindMerge.Validate, :is_integer?}, {TailwindMerge.Validate, :is_opacity?}],
        teal: [{TailwindMerge.Validate, :is_integer?}, {TailwindMerge.Validate, :is_opacity?}],
        cyan: [{TailwindMerge.Validate, :is_integer?}, {TailwindMerge.Validate, :is_opacity?}],
        sky: [{TailwindMerge.Validate, :is_integer?}, {TailwindMerge.Validate, :is_opacity?}],
        blue: [{TailwindMerge.Validate, :is_integer?}, {TailwindMerge.Validate, :is_opacity?}],
        indigo: [{TailwindMerge.Validate, :is_integer?}, {TailwindMerge.Validate, :is_opacity?}],
        violet: [{TailwindMerge.Validate, :is_integer?}, {TailwindMerge.Validate, :is_opacity?}],
        purple: [{TailwindMerge.Validate, :is_integer?}, {TailwindMerge.Validate, :is_opacity?}],
        fuchsia: [{TailwindMerge.Validate, :is_integer?}, {TailwindMerge.Validate, :is_opacity?}],
        pink: [{TailwindMerge.Validate, :is_integer?}, {TailwindMerge.Validate, :is_opacity?}],
        rose: [{TailwindMerge.Validate, :is_integer?}, {TailwindMerge.Validate, :is_opacity?}]
      }
    ]
  end
end
