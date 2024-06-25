defmodule TailwindMerge.Config do
  alias TailwindMerge.Validator

  defstruct [:class_groups, :conflicting_class_groups]

  def default do
    %__MODULE__{
      class_groups: class_groups([]),
      conflicting_class_groups: conflicting_class_groups()
    }
  end

  @positions ~w(bottom center left left-bottom left-top right right-bottom right-top top)
  @overflow ~w(auto hidden clip visible scroll)
  @overscroll ~w(auto contain none)

  def class_groups(opts) do
    colors = Keyword.get_lazy(opts, :colors, fn -> colors() end)

    [
      # Layout
      {"aspect-ratio",
       [
         {"aspect", ["auto", "square", "video", {Validator, :arbitrary?}]}
       ]},
      {"container",
       [
         "container"
       ]},
      {"columns",
       [
         {"columns",
          [
            "auto",
            {Validator, :integer?},
            {Validator, :size_abbr?},
            {Validator, :arbitrary?}
          ]}
       ]},
      {"break-after",
       [
         {"break-after", ~w(auto avoid all avoid-page page left right column)}
       ]},
      {"break-before",
       [
         {"break-before", ~w(auto avoid all avoid-page page left right column)}
       ]},
      {"break-inside",
       [
         {"break-inside", ~w(auto avoid avoid-page avoid-column)}
       ]},
      {"box-decoration-break",
       [
         {"box-decoration", ~w(slice clone)}
       ]},
      {"box-sizing",
       [
         {"box", ~w(border content)}
       ]},
      {"display",
       ~w(block inline-block inline flex inline-flex table inline-table table-caption table-cell table-column table-column-group table-footer-group table-header-group table-row-group table-row flow-root grid inline-grid contents list-item hidden)},
      {"floats",
       [
         {"float", ~w(right left none)}
       ]},
      {"clear",
       [
         {"clear", ~w(left right both none)}
       ]},
      {"isolation", ~w(isolate isolation-auto)},
      {"object-fit",
       [
         {"object", ~w(container cover fill none scale-down)}
       ]},
      {"object-position",
       [
         {"object", @positions ++ [{Validator, :arbitrary?}]}
       ]},
      {"overflow",
       [
         {"overflow", @overflow}
       ]},
      {"overflow-x",
       [
         {"overflow-x", @overflow}
       ]},
      {"overflow-y",
       [
         {"overflow-y", @overflow}
       ]},
      {"overscroll-behaviour",
       [
         {"overscroll", @overscroll}
       ]},
      {"overscroll-behaviour-x",
       [
         {"overscroll-x", @overscroll}
       ]},
      {"overscroll-behaviour-y",
       [
         {"overscroll-y", @overscroll}
       ]},
      {"position",
       [
         "static",
         "fixed",
         "absolute",
         "relative",
         "sticky"
       ]},
      {"inset",
       [
         {"inset",
          [
            "px",
            "auto",
            "full",
            {Validator, :number?},
            {Validator, :ratio?},
            {Validator, :arbitrary?}
          ]}
       ]},
      {"inset-x",
       [
         {"inset-x",
          [
            "px",
            "auto",
            "full",
            {Validator, :number?},
            {Validator, :ratio?},
            {Validator, :arbitrary?}
          ]}
       ]},
      {"inset-y",
       [
         {"inset-y",
          [
            "px",
            "auto",
            "full",
            {Validator, :number?},
            {Validator, :ratio?},
            {Validator, :arbitrary?}
          ]}
       ]},
      {"inset-inline-start",
       [
         {"start",
          [
            "px",
            "auto",
            "full",
            {Validator, :number?},
            {Validator, :ratio?},
            {Validator, :arbitrary?}
          ]}
       ]},
      {"inset-inline-end",
       [
         {"end",
          [
            "px",
            "auto",
            "full",
            {Validator, :number?},
            {Validator, :ratio?},
            {Validator, :arbitrary?}
          ]}
       ]},
      {"top",
       [
         {"top",
          [
            "px",
            "auto",
            "full",
            {Validator, :number?},
            {Validator, :ratio?},
            {Validator, :arbitrary?}
          ]}
       ]},
      {"bottom",
       [
         {"bottom",
          [
            "px",
            "auto",
            "full",
            {Validator, :number?},
            {Validator, :ratio?},
            {Validator, :arbitrary?}
          ]}
       ]},
      {"left",
       [
         {"left",
          [
            "px",
            "auto",
            "full",
            {Validator, :number?},
            {Validator, :ratio?},
            {Validator, :arbitrary?}
          ]}
       ]},
      {"right",
       [
         {"right",
          [
            "px",
            "auto",
            "full",
            {Validator, :number?},
            {Validator, :ratio?},
            {Validator, :arbitrary?}
          ]}
       ]},
      {"visibility",
       [
         "visible",
         "invisible",
         "collapse"
       ]},
      {"z-index",
       [
         {"z", ["auto", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},

      # Flexbox & Grid
      {"flex-basis",
       [
         {"basis",
          [
            "px",
            "auto",
            "full",
            {Validator, :number?},
            {Validator, :ratio?},
            {Validator, :arbitrary?}
          ]}
       ]},
      {"flex-direction",
       [
         {"flex", ~w(row row-reverse col col-reverse)}
       ]},
      {"flex-wrap",
       [
         {"flex", ~w(wrap wrap-reverse nowrap)}
       ]},
      {"flex",
       [
         {"flex", ["1", "auto", "initial", "none", {Validator, :arbitrary?}]}
       ]},
      {"flex-grow",
       [
         "grow",
         {"grow", ["0", {Validator, :arbitrary?}]}
       ]},
      {"flex-shrink",
       [
         "shrink",
         {"shrink", ["0", {Validator, :arbitrary?}]}
       ]},
      {"order",
       [
         {"order", ["first", "last", "none", {Validator, :integer?}, {Validator, :arbitrary?}]}
       ]},
      {"grid-template-columns",
       [
         {"grid-cols", ["none", "subgrid", {Validator, :integer?}, {Validator, :arbitrary?}]}
       ]},
      {"grid-column",
       [
         "col-auto",
         {"col-span", ["full", {Validator, :integer?}, {Validator, :arbitrary?}]}
       ]},
      {"grid-column-start",
       [
         {"col-start", ["auto", {Validator, :integer?}, {Validator, :arbitrary?}]}
       ]},
      {"grid-column-end",
       [
         {"col-end", ["auto", {Validator, :integer?}, {Validator, :arbitrary?}]}
       ]},
      {"grid-template-rows",
       [
         {"grid-rows", ["none", "subgrid", {Validator, :integer?}, {Validator, :arbitrary?}]}
       ]},
      {"grid-row",
       [
         "row-auto",
         {"row-span", ["full", {Validator, :integer?}, {Validator, :arbitrary?}]}
       ]},
      {"grid-row-start",
       [
         {"row-start", ["auto", {Validator, :integer?}, {Validator, :arbitrary?}]}
       ]},
      {"grid-row-end",
       [
         {"row-end", ["auto", {Validator, :integer?}, {Validator, :arbitrary?}]}
       ]},
      {"grid-auto-flow",
       [
         {"grid-flow", ~w(row col dense row-dense col-dense)}
       ]},
      {"grid-auto-columns",
       [
         {"auto-cols", ["auto", "min", "max", "fr", {Validator, :arbitrary?}]}
       ]},
      {"grid-auto-rows",
       [
         {"auto-rows", ["auto", "min", "max", "fr", {Validator, :arbitrary?}]}
       ]},
      {"gap",
       [
         {"gap", ["px", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},
      {"gap-x",
       [
         {"gap-x", ["px", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},
      {"gap-y",
       [
         {"gap-y", ["px", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},
      {"justify-content",
       [
         {"justify", ~w(normal start end center between around evenly stretch)}
       ]},
      {"justify-items",
       [
         {"justify-items", ~w(start end center stretch)}
       ]},
      {"justify-self",
       [
         {"justify-self", ~w(auto start end center stretch)}
       ]},
      {"align-content",
       [
         {"align-content", ~w(normal center start end between around evenly baseline stretch)}
       ]},
      {"align-items",
       [
         {"items", ~w(start end center baseline stretch)}
       ]},
      {"align-self",
       [
         {"self", ~w(auto start end center stretch baseline)}
       ]},
      {"place-content",
       [
         {"place-content", ~w(center start end between around evenly baseline stretch)}
       ]},
      {"place-items",
       [
         {"place-items", ~w(start end center baseline stretch)}
       ]},
      {"place-self",
       [
         {"place-self", ~w(auto start end center stretch)}
       ]},

      # Spacing
      {"padding",
       [
         {"p", ["px", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},
      {"padding-x",
       [
         {"px", ["px", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},
      {"padding-y",
       [
         {"py", ["px", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},
      {"padding-inline-start",
       [
         {"ps", ["px", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},
      {"padding-inline-end",
       [
         {"pe", ["px", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},
      {"padding-top",
       [
         {"pt", ["px", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},
      {"padding-bottom",
       [
         {"pb", ["px", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},
      {"padding-left",
       [
         {"pl", ["px", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},
      {"padding-right",
       [
         {"pr", ["px", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},
      {"margin",
       [
         {"m", ["px", "auto", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},
      {"margin-x",
       [
         {"mx", ["px", "auto", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},
      {"margin-y",
       [
         {"my", ["px", "auto", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},
      {"margin-inline-start",
       [
         {"ms", ["px", "auto", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},
      {"margin-inline-end",
       [
         {"me", ["px", "auto", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},
      {"margin-top",
       [
         {"mt", ["px", "auto", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},
      {"margin-bottom",
       [
         {"mb", ["px", "auto", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},
      {"margin-left",
       [
         {"ml", ["px", "auto", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},
      {"margin-right",
       [
         {"mr", ["px", "auto", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},
      {"space-between-x",
       [
         {"space-x", ["px", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},
      {"space-between-y",
       [
         {"space-y", ["px", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},
      {"space-between-x-reverse",
       [
         "space-x-reverse"
       ]},
      {"space-between-y-reverse",
       [
         "space-y-reverse"
       ]},

      # Sizing
      {"width",
       [
         {"w",
          [
            "px",
            "auto",
            "full",
            "screen",
            "svw",
            "lvw",
            "dvw",
            "min",
            "max",
            "fit",
            {Validator, :number?},
            {Validator, :ratio?},
            {Validator, :arbitrary?}
          ]}
       ]},
      {"min-width",
       [
         {"min-w",
          [
            "px",
            "full",
            "min",
            "max",
            "fit",
            {Validator, :number?},
            {Validator, :arbitrary?}
          ]}
       ]},
      {"max-width",
       [
         {"max-w",
          [
            "px",
            "none",
            "full",
            "min",
            "max",
            "fit",
            "prose",
            {"screen", [{Validator, :size_abbr?}]},
            {Validator, :number?},
            {Validator, :size_abbr?},
            {Validator, :arbitrary?}
          ]}
       ]},
      {"height",
       [
         {"h",
          [
            "px",
            "auto",
            "full",
            "screen",
            "svh",
            "lvh",
            "dvh",
            "min",
            "max",
            "fit",
            {Validator, :number?},
            {Validator, :ratio?},
            {Validator, :arbitrary?}
          ]}
       ]},
      {"min-height",
       [
         {"min-h",
          [
            "px",
            "full",
            "screen",
            "svh",
            "lvh",
            "dvh",
            "min",
            "max",
            "fit",
            {Validator, :number?},
            {Validator, :arbitrary?}
          ]}
       ]},
      {"max-height",
       [
         {"max-h",
          [
            "px",
            "none",
            "full",
            "screen",
            "svh",
            "lvh",
            "dvh",
            "min",
            "max",
            "fit",
            {Validator, :number?},
            {Validator, :arbitrary?}
          ]}
       ]},
      {"size",
       [
         {"size",
          [
            "px",
            "auto",
            "full",
            "min",
            "max",
            "fit",
            {Validator, :number?},
            {Validator, :arbitrary?}
          ]}
       ]},

      # Typography
      {"font-family",
       [
         {"font", ~w(sans serif mono)}
       ]},
      {"font-size",
       [
         {"text", ["base", {Validator, :size_abbr?}, {Validator, :arbitrary_length?}]}
       ]},
      {"font-smoothing", ~w(antialiased subpixel-antialiased)},
      {"font-style", ~w(italic not-italic)},
      {"font-weight",
       [
         {"font",
          [
            "thin",
            "extralight",
            "light",
            "normal",
            "medium",
            "semibold",
            "bold",
            "extrabold",
            "black",
            {Validator, :arbitrary?}
          ]}
       ]},
      {"fvn-normal", ~w(normal-nums)},
      {"fvn-ordinal", ~w(ordinal)},
      {"fvn-slashed-zero", ~w(slashed-zero)},
      {"fvn-figure", ~w(lining-nums oldstyle-nums)},
      {"fvn-spacing", ~w(proportional-nums tabular-nums)},
      {"fvn-fraction", ~w(diagonal-fractions stacked-fractions)},
      {"letter-spacing",
       [
         {"tracking",
          [
            "tighter",
            "tight",
            "normal",
            "wide",
            "wider",
            "widest",
            {Validator, :arbitrary?}
          ]}
       ]},
      {"line-clamp",
       [
         {"line-clamp",
          [
            "none",
            {Validator, :integer?},
            {Validator, :arbitrary?}
          ]}
       ]},
      {"line-height",
       [
         {"leading",
          [
            "none",
            "tight",
            "snug",
            "normal",
            "relaxed",
            "loose",
            {Validator, :integer?},
            {Validator, :arbitrary?}
          ]}
       ]},
      {"list-style-image",
       [
         {"list-image", ["none", {Validator, :arbitrary?}]}
       ]},
      {"list-style-position", ~w(list-inside list-outside)},
      {"list-style-type",
       [
         {"list",
          [
            "none",
            "disc",
            "decimal",
            {Validator, :arbitrary?}
          ]}
       ]},
      {"text-align",
       [
         {"text", ~w(left center right justify start end)}
       ]},
      {"text-color",
       [
         {"text", colors}
       ]},
      {"text-decoration", ~w(underline overline line-through no-underline)},
      {"text-decoration-color",
       [
         {"decoration", colors}
       ]},
      {"text-decoration-style",
       [
         {"decoration", ~w(none solid double dotted dashed wavy)}
       ]},
      {"text-decoration-thickness",
       [
         {"decoration",
          [
            "auto",
            "from-font",
            {Validator, :integer?},
            {Validator, :arbitrary_length?}
          ]}
       ]},
      {"text-underline-offset",
       [
         {"underline-offset",
          [
            "auto",
            {Validator, :integer?},
            {Validator, :arbitrary_length?}
          ]}
       ]},
      {"text-transform", ~w(uppercase lowercase capitalize normal-case)},
      {"text-overflow", ~w(truncate text-ellipsis text-clip)},
      {"text-wrap", ~w(wrap nowrap balance pretty)},
      {"text-indent",
       [
         {"indent",
          [
            "px",
            {Validator, :number?},
            {Validator, :arbitrary?}
          ]}
       ]},
      {"vertical-align",
       [
         {"align",
          [
            "baseline",
            "top",
            "middle",
            "bottom",
            "text-top",
            "text-bottom",
            "sub",
            "super",
            {Validator, :arbitrary_length?}
          ]}
       ]},
      {"whitespace",
       [
         {"whitespace", ~w(normal nowrap pre pre-line pre-wrap break-spaces)}
       ]},
      {"work-break",
       [
         {"break", ~w(normal words all keep)}
       ]},
      {"hyphens",
       [
         {"hyphens", ~w(none manual auto)}
       ]},
      {"content",
       [
         {"content", ["none", {Validator, :arbitrary?}]}
       ]},

      # Backgrounds
      {"background-attachment",
       [
         {"bg", ~w(fixed local scroll)}
       ]},
      {"background-clip",
       [
         {"bg-clip", ~w(border padding content text)}
       ]},
      {"background-color",
       [
         {"bg", colors}
       ]},
      {"background-origin",
       [
         {"bg-origin", ~w(border padding content)}
       ]},
      {"background-position",
       [
         {"bg", @positions ++ [{Validator, :arbitrary_position?}]}
       ]},
      {"background-repeat",
       [
         "bg-repeat",
         "bg-no-repeat",
         {"bg-repeat", ~w(x y round space)}
       ]},
      {"background-size",
       [
         {"bg", ["auto", "cover", "contain", {Validator, :arbitrary_length?}]}
       ]},
      {"background-image",
       [
         "bg-none",
         {"bg-gradient-to", ~w(t tr r br b bl l tl)}
       ]},
      {"gradient-from",
       [
         {"from", colors}
       ]},
      {"gradient-via",
       [
         {"via", colors}
       ]},
      {"gradient-to",
       [
         {"to", colors}
       ]},

      # Borders
      {"border-radius",
       [
         "rounded",
         {"rounded", ["none", "full", {Validator, :size_abbr?}, {Validator, :arbitrary_length?}]}
       ]},
      {"border-radius-s",
       [
         "rounded-s",
         {"rounded-s",
          ["none", "full", {Validator, :size_abbr?}, {Validator, :arbitrary_length?}]}
       ]},
      {"border-radius-e",
       [
         "rounded-e",
         {"rounded-e",
          ["none", "full", {Validator, :size_abbr?}, {Validator, :arbitrary_length?}]}
       ]},
      {"border-radius-t",
       [
         "rounded-t",
         {"rounded-t",
          ["none", "full", {Validator, :size_abbr?}, {Validator, :arbitrary_length?}]}
       ]},
      {"border-radius-b",
       [
         "rounded-b",
         {"rounded-b",
          ["none", "full", {Validator, :size_abbr?}, {Validator, :arbitrary_length?}]}
       ]},
      {"border-radius-l",
       [
         "rounded-l",
         {"rounded-l",
          ["none", "full", {Validator, :size_abbr?}, {Validator, :arbitrary_length?}]}
       ]},
      {"border-radius-r",
       [
         "rounded-r",
         {"rounded-r",
          ["none", "full", {Validator, :size_abbr?}, {Validator, :arbitrary_length?}]}
       ]},
      {"border-radius-ss",
       [
         "rounded-ss",
         {"rounded-ss",
          ["none", "full", {Validator, :size_abbr?}, {Validator, :arbitrary_length?}]}
       ]},
      {"border-radius-se",
       [
         "rounded-se",
         {"rounded-se",
          ["none", "full", {Validator, :size_abbr?}, {Validator, :arbitrary_length?}]}
       ]},
      {"border-radius-ee",
       [
         "rounded-ee",
         {"rounded-ee",
          ["none", "full", {Validator, :size_abbr?}, {Validator, :arbitrary_length?}]}
       ]},
      {"border-radius-es",
       [
         "rounded-es",
         {"rounded-es",
          ["none", "full", {Validator, :size_abbr?}, {Validator, :arbitrary_length?}]}
       ]},
      {"border-radius-tl",
       [
         "rounded-tl",
         {"rounded-tl",
          ["none", "full", {Validator, :size_abbr?}, {Validator, :arbitrary_length?}]}
       ]},
      {"border-radius-tr",
       [
         "rounded-tr",
         {"rounded-tr",
          ["none", "full", {Validator, :size_abbr?}, {Validator, :arbitrary_length?}]}
       ]},
      {"border-radius-bl",
       [
         "rounded-bl",
         {"rounded-bl",
          ["none", "full", {Validator, :size_abbr?}, {Validator, :arbitrary_length?}]}
       ]},
      {"border-radius-br",
       [
         "rounded-br",
         {"rounded-br",
          ["none", "full", {Validator, :size_abbr?}, {Validator, :arbitrary_length?}]}
       ]},
      {"border-width",
       [
         "border",
         {"border", [{Validator, :integer?}, {Validator, :arbitrary_length?}]}
       ]},
      {"border-width-x",
       [
         "border-x",
         {"border-x", [{Validator, :integer?}, {Validator, :arbitrary_length?}]}
       ]},
      {"border-width-y",
       [
         "border-y",
         {"border-y", [{Validator, :integer?}, {Validator, :arbitrary_length?}]}
       ]},
      {"border-width-s",
       [
         "border-s",
         {"border-s", [{Validator, :integer?}, {Validator, :arbitrary_length?}]}
       ]},
      {"border-width-e",
       [
         "border-e",
         {"border-e", [{Validator, :integer?}, {Validator, :arbitrary_length?}]}
       ]},
      {"border-width-t",
       [
         "border-t",
         {"border-t", [{Validator, :integer?}, {Validator, :arbitrary_length?}]}
       ]},
      {"border-width-b",
       [
         "border-b",
         {"border-b", [{Validator, :integer?}, {Validator, :arbitrary_length?}]}
       ]},
      {"border-width-l",
       [
         "border-l",
         {"border-l", [{Validator, :integer?}, {Validator, :arbitrary_length?}]}
       ]},
      {"border-width-r",
       [
         "border-r",
         {"border-r", [{Validator, :integer?}, {Validator, :arbitrary_length?}]}
       ]},
      {"border-color",
       [
         {"border", colors}
       ]},
      {"border-color-x",
       [
         {"border-x", colors}
       ]},
      {"border-color-y",
       [
         {"border-y", colors}
       ]},
      {"border-color-s",
       [
         {"border-s", colors}
       ]},
      {"border-color-e",
       [
         {"border-e", colors}
       ]},
      {"border-color-t",
       [
         {"border-t", colors}
       ]},
      {"border-color-b",
       [
         {"border-b", colors}
       ]},
      {"border-color-l",
       [
         {"border-l", colors}
       ]},
      {"border-color-r",
       [
         {"border-r", colors}
       ]},
      {"border-style",
       [
         {"border", ~w(solid dashed dotted double hidden none)}
       ]},
      {"divide-width-x",
       [
         "divide-x",
         {"divide-x", [{Validator, :integer?}, {Validator, :arbitrary_length?}]}
       ]},
      {"divide-width-y",
       [
         "divide-y",
         {"divide-y", [{Validator, :integer?}, {Validator, :arbitrary_length?}]}
       ]},
      {"divide-width-x-reverse",
       [
         "divide-x-reverse"
       ]},
      {"divide-width-y-reverse",
       [
         "divide-y-reverse"
       ]},
      {"divide-color",
       [
         {"divide", colors}
       ]},
      {"divide-style",
       [
         {"divide", ~w(solid dashed dotted double none)}
       ]},
      {"divide-style",
       [
         {"divide", ~w(solid dashed dotted double none)}
       ]},
      {"outline-width",
       [
         {"outline", [{Validator, :integer?}, {Validator, :arbitrary_length?}]}
       ]},
      {"outline-color",
       [
         {"outline", colors}
       ]},
      {"outline-style",
       [
         "outline",
         {"outline", ~w(dashed dotted double none)}
       ]},
      {"outline-offset",
       [
         {"outline-offset", [{Validator, :integer?}, {Validator, :arbitrary_length?}]}
       ]},
      {"ring-width",
       [
         "ring",
         {"ring", [{Validator, :integer?}, {Validator, :arbitrary_length?}]}
       ]},
      {"ring-width-inset",
       [
         "ring-inset"
       ]},
      {"ring-color",
       [
         {"ring", colors}
       ]},
      {"ring-offset-width",
       [
         {"ring-offset", [{Validator, :integer?}, {Validator, :arbitrary_length?}]}
       ]},
      {"ring-offset-color",
       [
         {"ring-offset", colors}
       ]},

      # Effects
      {"box-shadow-color",
       [
         {"shadow", colors}
       ]},
      {"box-shadow",
       [
         "shadow",
         {"shadow", ["none", "inner", {Validator, :size_abbr?}, {Validator, :arbitrary?}]}
       ]},
      {"opacity",
       [
         {"opacity", [{Validator, :integer?}, {Validator, :arbitrary?}]}
       ]},
      {"mix-blend-mode",
       [
         {"mix-blend",
          ~w(normal multiply screen overlay darken lighten color-dodge color-burn hard-light soft-light difference exclusion hue saturation color luminosity plus-darker plus-lighter)}
       ]},
      {"background-blend-mode",
       [
         {"bg-blend",
          ~w(normal multiply screen overlay darken lighten color-dodge color-burn hard-light soft-light difference exclusion hue saturation color luminosity)}
       ]},

      # Filters
      {"filter",
       [
         "filter-none"
       ]},
      {"blur",
       [
         "blur",
         {"blur", ["none", {Validator, :size_abbr?}, {Validator, :arbitrary_length?}]}
       ]},
      {"brightness",
       [
         {"brightness", [{Validator, :integer?}, {Validator, :arbitrary?}]}
       ]},
      {"contrast",
       [
         {"contrast", [{Validator, :integer?}, {Validator, :arbitrary?}]}
       ]},
      {"drop-shadow",
       [
         "drop-shadow",
         {"drop-shadow", ["none", {Validator, :size_abbr?}, {Validator, :arbitrary?}]}
       ]},
      {"grayscale",
       [
         "grayscale",
         {"grayscale", [{Validator, :integer?}, {Validator, :arbitrary?}]}
       ]},
      {"hue-rotate",
       [
         {"hue-rotate", [{Validator, :integer?}, {Validator, :arbitrary?}]}
       ]},
      {"invert",
       [
         "invert",
         {"invert", [{Validator, :integer?}, {Validator, :arbitrary?}]}
       ]},
      {"saturate",
       [
         {"saturate", [{Validator, :integer?}, {Validator, :arbitrary?}]}
       ]},
      {"sepia",
       [
         "sepia",
         {"sepia", [{Validator, :integer?}, {Validator, :arbitrary?}]}
       ]},
      {"backdrop-filter",
       [
         "backdrop-filter-none"
       ]},
      {"backdrop-blur",
       [
         "backdrop-blur",
         {"backdrop-blur", ["none", {Validator, :size_abbr?}, {Validator, :arbitrary?}]}
       ]},
      {"backdrop-brightness",
       [
         {"backdrop-brightness", [{Validator, :integer?}, {Validator, :arbitrary?}]}
       ]},
      {"backdrop-contrast",
       [
         {"backdrop-contrast", [{Validator, :integer?}, {Validator, :arbitrary?}]}
       ]},
      {"backdrop-grayscale",
       [
         "backdrop-grayscale",
         {"backdrop-grayscale", [{Validator, :integer?}, {Validator, :arbitrary?}]}
       ]},
      {"backdrop-hue-rotate",
       [
         {"backdrop-hue-rotate", [{Validator, :integer?}, {Validator, :arbitrary?}]}
       ]},
      {"backdrop-invert",
       [
         "backdrop-invert",
         {"backdrop-invert", [{Validator, :integer?}, {Validator, :arbitrary?}]}
       ]},
      {"backdrop-opacity",
       [
         {"backdrop-opacity", [{Validator, :integer?}, {Validator, :arbitrary?}]}
       ]},
      {"backdrop-saturate",
       [
         {"backdrop-saturate", [{Validator, :integer?}, {Validator, :arbitrary?}]}
       ]},
      {"backdrop-sepia",
       [
         "backdrop-sepia",
         {"backdrop-sepia", [{Validator, :integer?}, {Validator, :arbitrary?}]}
       ]},

      # Tables
      {"border-collapse",
       [
         {"border", ["collapse", "separate"]}
       ]},
      {"border-spacing",
       [
         {"border-spacing", [{Validator, :integer?}, {Validator, :arbitrary?}]}
       ]},
      {"border-spacing-x",
       [
         {"border-spacing-x", [{Validator, :integer?}, {Validator, :arbitrary?}]}
       ]},
      {"border-spacing-y",
       [
         {"border-spacing-y", [{Validator, :integer?}, {Validator, :arbitrary?}]}
       ]},
      {"table-layout",
       [
         {"table", ["auto", "fixed"]}
       ]},
      {"caption-side",
       [
         {"caption", ["top", "bottom"]}
       ]},

      # Transitions & Animation
      {"transition-property",
       [
         "transition",
         {"transition",
          ["none", "all", "colors", "opacity", "shadow", "transform", {Validator, :arbitrary?}]}
       ]},
      {"transition-duration",
       [
         {"duration", [{Validator, :integer?}, {Validator, :arbitrary?}]}
       ]},
      {"transition-timing-function",
       [
         {"ease", ["linear", "in", "out", "in-out", {Validator, :arbitrary?}]}
       ]},
      {"transition-delay",
       [
         {"delay", [{Validator, :integer?}, {Validator, :arbitrary?}]}
       ]},
      {"animation",
       [
         {"animate", ["none", "spin", "ping", "pulse", "bounce", {Validator, :arbitrary?}]}
       ]},

      ## Transforms
      {"transform",
       [
         "transform-none",
         "transform-cpu",
         "transform-gpu"
       ]},
      {"scale",
       [
         {"scale", [{Validator, :integer?}, {Validator, :arbitrary?}]}
       ]},
      {"scale-x",
       [
         {"scale-x", [{Validator, :integer?}, {Validator, :arbitrary?}]}
       ]},
      {"scale-y",
       [
         {"scale-y", [{Validator, :integer?}, {Validator, :arbitrary?}]}
       ]},
      {"rotate",
       [
         {"rotate", [{Validator, :integer?}, {Validator, :arbitrary?}]}
       ]},
      {"translate-x",
       [
         {"translate-x",
          [
            "px",
            "full",
            {Validator, :number?},
            {Validator, :ratio?},
            {Validator, :arbitrary_length?}
          ]}
       ]},
      {"translate-y",
       [
         {"translate-y",
          [
            "px",
            "full",
            {Validator, :number?},
            {Validator, :ratio?},
            {Validator, :arbitrary_length?}
          ]}
       ]},
      {"skew-x",
       [
         {"skew-x", [{Validator, :integer?}, {Validator, :arbitrary?}]}
       ]},
      {"skew-y",
       [
         {"skew-y", [{Validator, :integer?}, {Validator, :arbitrary?}]}
       ]},
      {"transform-origin",
       [
         {"origin",
          [
            "center",
            "top",
            "top-right",
            "right",
            "bottom-right",
            "bottom",
            "bottom-left",
            "left",
            "top-left",
            {Validator, :arbitrary?}
          ]}
       ]},

      # Interactivity
      {"accent-color",
       [
         {"accent", ["auto"] ++ colors}
       ]},
      {"appearance",
       [
         {"appearance", ["auto", "none"]}
       ]},
      {"cursor",
       [
         {"cursor",
          [
            "auto",
            "default",
            "pointer",
            "wait",
            "text",
            "move",
            "help",
            "not-allowed",
            "none",
            "context-menu",
            "progress",
            "cell",
            "crosshair",
            "vertical-text",
            "alias",
            "copy",
            "no-drop",
            "grab",
            "grabbing",
            "all-scroll",
            "col-resize",
            "row-resize",
            "n-resize",
            "e-resize",
            "s-resize",
            "w-resize",
            "ne-resize",
            "nw-resize",
            "se-resize",
            "sw-resize",
            "ew-resize",
            "ns-resize",
            "nesw-resize",
            "nwse-resize",
            "zoom-in",
            "zoom-out",
            {Validator, :arbitrary?}
          ]}
       ]},
      {"caret-color",
       [
         {"caret", colors}
       ]},
      {"pointer-events",
       [
         {"pointer-events", ["none", "auto"]}
       ]},
      {"resize",
       [
         "resize",
         {"resize", ["none", "x", "y"]}
       ]},
      {"scroll-behaviour",
       [
         {"scroll", ["auto", "smooth"]}
       ]},
      {"scroll-margin",
       [
         {"scroll-m", ["px", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},
      {"scroll-margin-x",
       [
         {"scroll-mx", ["px", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},
      {"scroll-margin-y",
       [
         {"scroll-my", ["px", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},
      {"scroll-margin-s",
       [
         {"scroll-ms", ["px", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},
      {"scroll-margin-e",
       [
         {"scroll-me", ["px", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},
      {"scroll-margin-t",
       [
         {"scroll-mt", ["px", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},
      {"scroll-margin-b",
       [
         {"scroll-mb", ["px", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},
      {"scroll-margin-l",
       [
         {"scroll-ml", ["px", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},
      {"scroll-margin-r",
       [
         {"scroll-mr", ["px", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},
      {"scroll-padding",
       [
         {"scroll-p", ["px", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},
      {"scroll-padding-x",
       [
         {"scroll-px", ["px", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},
      {"scroll-padding-y",
       [
         {"scroll-py", ["px", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},
      {"scroll-padding-s",
       [
         {"scroll-ps", ["px", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},
      {"scroll-padding-e",
       [
         {"scroll-pe", ["px", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},
      {"scroll-padding-t",
       [
         {"scroll-pt", ["px", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},
      {"scroll-padding-b",
       [
         {"scroll-pb", ["px", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},
      {"scroll-padding-l",
       [
         {"scroll-pl", ["px", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},
      {"scroll-padding-r",
       [
         {"scroll-pr", ["px", {Validator, :number?}, {Validator, :arbitrary?}]}
       ]},
      {"scroll-snap-align",
       [
         {"snap", ["start", "end", "center", "align-none"]}
       ]},
      {"scroll-snap-stop",
       [
         {"snap", ["normal", "always"]}
       ]},
      {"scroll-snap-type",
       [
         {"snap", ["none", "x", "y", "both"]}
       ]},
      {"scroll-snap-strictness",
       [
         {"snap", ["mandatory", "proximity"]}
       ]},
      {"touch-action",
       [
         {"touch",
          [
            "auto",
            "none",
            "pan-x",
            "pan-y",
            "pan-left",
            "pan-right",
            "pan-up",
            "pan-down",
            "pinch-zoom",
            "manipulation"
          ]}
       ]},
      {"user-select",
       [
         {"select", ["none", "text", "all", "auto"]}
       ]},
      {"will-change",
       [
         {"will-change", ["auto", "scroll", "contents", "transform", {Validator, :arbitrary?}]}
       ]},

      # SVG
      {"svg-fill",
       [
         {"fill", ["none"] ++ colors}
       ]},
      {"svg-stroke",
       [
         {"stroke", ["none"] ++ colors}
       ]},
      {"svg-stroke-width",
       [
         {"stroke", [{Validator, :integer?}, {Validator, :arbitrary_length?}]}
       ]},

      # Accessibility
      {"screen-readers", ["sr-only", "not-sr-only"]},
      {"forced-color-adjust",
       [
         {"forced-color-adjust", ["auto", "none"]}
       ]}
    ]
  end

  def conflicting_class_groups do
    [
      {"overflow", ~w(overflow-x overflow-y)},
      {"overscroll", ~w(overscroll-x overscroll-y)},
      {"inset", ~w(inset-x inset-y top right bottom left)},
      {"inset-x", ~w(right left)},
      {"inset-y", ~w(top bottom)},
      {"flex", ~w(flex-basis flex-grow flex-shrink)},
      {"grid-column", ~w(grid-column-start grid-column-end)},
      {"grid-row", ~w(grid-row-start grid-row-end)},
      {"gap", ~w(gap-x gap-y)},
      {"padding", ~w(padding-x padding-y padding-top padding-bottom padding-left padding-right)},
      {"padding-x", ~w(padding-left padding-right)},
      {"padding-y", ~w(padding-top padding-bottom)},
      {"margin", ~w(margin-x margin-y margin-top margin-bottom margin-left margin-right)},
      {"margin-x", ~w(margin-left margin-right)},
      {"margin-y", ~w(margin-top margin-bottom)},
      {"font-size", ~w(line-height)},
      {"fvn-normal", ~w(fvn-ordinal fvn-slashed-zero fvn-figure fvn-spacing fvn-fraction)},
      {"fvn-ordinal", ~w(fvn-normal)},
      {"fvn-slashed-zero", ~w(fvn-normal)},
      {"fvn-figure", ~w(fvn-normal)},
      {"fvn-spacing", ~w(fvn-normal)},
      {"fvn-fraction", ~w(fvn-normal)},
      {"border-radius",
       ~w(border-radius-t border-radius-r border-radius-b border-radius-l border-radius-tl border-radius-tr border-radius-br border-radius-bl)},
      {"border-radius-t", ~w(border-radius-tl border-radius-tr)},
      {"border-radius-r", ~w(border-radius-tr border-radius-br)},
      {"border-radius-b", ~w(border-radius-br border-radius-bl)},
      {"border-radius-l", ~w(border-radius-tl border-radius-bl)},
      {"border-width", ~w(border-width-t border-width-r border-width-b border-width-l)},
      {"border-width-x", ~w(border-width-r border-width-l)},
      {"border-width-y", ~w(border-width-t border-width-b)},
      {"border-color", ~w(border-color-t border-color-r border-color-b border-color-l)},
      {"border-color-x", ~w(border-color-r border-color-l")},
      {"border-color-y", ~w(border-color-t border-color-b)},
      {"border-spacing", ~w(border-spacing-x border-spacing-y)},
      {"scroll-m", ~w(scroll-mx scroll-my scroll-mt scroll-mr scroll-mb scroll-ml)},
      {"scroll-mx", ~w(scroll-mr scroll-ml)},
      {"scroll-my", ~w(scroll-mt scroll-mb)},
      {"scroll-p", ~w(scroll-px scroll-py scroll-pt scroll-pr scroll-pb scroll-pl)},
      {"scroll-px", ~w(scroll-pr scroll-pl)},
      {"scroll-py", ~w(scroll-pt scroll-pb)}
    ]
  end

  def colors() do
    [
      "inherit",
      "current",
      "transparent",
      "black",
      "white",
      {Validator, :arbitrary_color?}
    ] ++
      Enum.map(
        [
          "slate",
          "gray",
          "zinc",
          "neutral",
          "stone",
          "red",
          "orange",
          "amber",
          "yellow",
          "lime",
          "green",
          "emerald",
          "teal",
          "cyan",
          "sky",
          "blue",
          "indigo",
          "violet",
          "purple",
          "fuchsia",
          "pink",
          "rose"
        ],
        &{&1, [{Validator, :integer?}, {Validator, :opacity?}]}
      )
  end

  @doc """
  Expands specs as a flat list.
  """
  def expand(specs) when is_list(specs) do
    expand_specs([], specs, [])
  end

  defp expand_specs(prefix, [_ | _] = specs, acc) do
    Enum.reduce(specs, acc, fn spec, acc -> expand_spec(prefix, spec, acc) end)
  end

  defp expand_specs(_prefix, [], acc) do
    acc
  end

  defp expand_spec(prefix, {current, [_ | _] = rest} = _seg, acc) when is_binary(current) do
    new_prefix = prefix ++ [current]
    Enum.reduce(rest, acc, fn r, acc -> expand_spec(new_prefix, r, acc) end)
  end

  defp expand_spec(prefix, seg, acc) when is_binary(seg) do
    acc ++ [prefix ++ [seg]]
  end

  defp expand_spec(prefix, {module, _fun} = seg, acc) when is_atom(module) do
    acc ++ [prefix ++ [seg]]
  end
end
