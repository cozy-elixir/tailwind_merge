defmodule TailwindMerge.DefaultConfig do
  alias TailwindMerge.ConfigUtils
  alias TailwindMerge.Validate

  def class_groups() do
    [
      # https://tailwindcss.com/docs/aspect-ratio
      aspect: %{
        aspect: ["auto", "square", "video", {Validate, :is_arbitrary_value}]
      },

      # https://tailwindcss.com/docs/container
      container: ["container"],

      # https://tailwindcss.com/docs/columns
      columns: %{columns: [{Validate, :is_tshirt_value}]},

      # https://tailwindcss.com/docs/break-after
      "break-after": %{"break-after": ConfigUtils.breaks()},

      # https://tailwindcss.com/docs/break-before
      "break-before": %{"break-before": ConfigUtils.breaks()},

      # https://tailwindcss.com/docs/break-inside
      "break-inside": %{"break-inside": ~w(auto avoid avoid-page avoid-column)},

      # https://tailwindcss.com/docs/box-decoration-break
      "box-decoration": %{"box-decoration": ~w(slice clone)},

      # https://tailwindcss.com/docs/box-sizing
      box: %{box: ~w(border content)},

      # https://tailwindcss.com/docs/display
      display: [
        "block",
        "inline-block",
        "inline",
        "flex",
        "inline-flex",
        "table",
        "inline-table",
        "table-caption",
        "table-cell",
        "table-column",
        "table-column-group",
        "table-footer-group",
        "table-header-group",
        "table-row-group",
        "table-row",
        "flow-root",
        "grid",
        "inline-grid",
        "contents",
        "list-item",
        "hidden"
      ],

      # https://tailwindcss.com/docs/float
      float: %{float: ~w(right left none)},

      # https://tailwindcss.com/docs/clear
      clear: %{clear: ~w(left right both none)},

      # https://tailwindcss.com/docs/isolation
      isolation: ~w(isolate isolation-auto),

      # https://tailwindcss.com/docs/object-fit
      "object-fit": %{object: ~w(container cover fill none scale-down)},

      # https://tailwindcss.com/docs/object-position
      "object-position": %{
        object: ConfigUtils.positions() ++ [{Validate, :is_arbitrary_value}]
      },

      # https://tailwindcss.com/docs/overflow
      overflow: %{overflow: ConfigUtils.overflow()},

      # https://tailwindcss.com/docs/overflow
      "overflow-x": %{"overflow-x": ConfigUtils.overflow()},

      # https://tailwindcss.com/docs/overflow
      "overflow-y": %{"overflow-y": ConfigUtils.overflow()},

      # https://tailwindcss.com/docs/overscroll-behavior
      overscroll: %{overscroll: ConfigUtils.overscroll()},

      # https://tailwindcss.com/docs/overscroll-behavior
      "overscroll-x": %{"overscroll-x": ConfigUtils.overscroll()},

      # https://tailwindcss.com/docs/overscroll-behavior
      "overscroll-y": %{"overscroll-y": ConfigUtils.overscroll()},

      # https://tailwindcss.com/docs/position
      position: ~w(static fixed absolute relative sticky),

      # https://tailwindcss.com/docs/top-right-bottom-left
      inset: %{inset: ["auto", {Validate, :is_length}]},

      # https://tailwindcss.com/docs/top-right-bottom-left
      "inset-x": %{"inset-x": ["auto", {Validate, :is_length}]},

      # https://tailwindcss.com/docs/top-right-bottom-left
      "inset-y": %{"inset-y": ["auto", {Validate, :is_length}]},

      # https://tailwindcss.com/docs/top-right-bottom-left
      top: %{top: ["auto", {Validate, :is_length}]},

      # https://tailwindcss.com/docs/top-right-bottom-left
      right: %{right: ["auto", {Validate, :is_length}]},

      # https://tailwindcss.com/docs/top-right-bottom-left
      bottom: %{bottom: ["auto", {Validate, :is_length}]},

      # https://tailwindcss.com/docs/top-right-bottom-left
      left: %{left: ["auto", {Validate, :is_length}]},

      # https://tailwindcss.com/docs/visibility
      visibility: ~w(visible invisible collapse),

      # https://tailwindcss.com/docs/z-index
      z: %{z: [{Validate, :is_integer?}]},

      # https://tailwindcss.com/docs/flex-basis
      basis: %{basis: [{Validate, :is_length}]},

      # https://tailwindcss.com/docs/flex-direction
      "flex-direction": %{flex: ~w(row row-reverse col col-reverse)},

      # https://tailwindcss.com/docs/flex-wrap
      "flex-wrap": %{flex: ~w(wrap wrap-reverse nowrap)},

      # https://tailwindcss.com/docs/flex
      flex: %{
        flex: ["1", "auto", "initial", "none", {Validate, :is_arbitrary_value}]
      },

      # https://tailwindcss.com/docs/flex-grow
      grow: %{grow: ConfigUtils.zero_and_empty()},

      # https://tailwindcss.com/docs/flex-shrink
      shrink: %{shrink: ConfigUtils.zero_and_empty()},

      # https://tailwindcss.com/docs/order
      order: %{order: ["first", "last", "none", {Validate, :is_integer?}]},

      # https://tailwindcss.com/docs/grid-template-columns
      "grid-cols": %{
        "grid-cols": ["none", {Validate, :is_integer_or_arbitrary_value}]
      },

      # https://tailwindcss.com/docs/grid-column
      "col-start-end": %{col: ["auto", %{span: ["full", {Validate, :is_integer?}]}]},

      # https://tailwindcss.com/docs/grid-column
      "col-start": %{"col-start": ["auto", {Validate, :is_integer?}]},

      # https://tailwindcss.com/docs/grid-column
      "col-end": %{"col-end": ["auto", {Validate, :is_integer?}]},

      # https://tailwindcss.com/docs/grid-template-rows
      "grid-rows": %{
        "grid-rows": ["none", {Validate, :is_integer_or_arbitrary_value}]
      },

      # https://tailwindcss.com/docs/grid-row
      "row-start-end": %{row: ["auto", %{span: ["full", {Validate, :is_integer?}]}]},

      # https://tailwindcss.com/docs/grid-row
      "row-start": %{"row-start": ["auto", {Validate, :is_integer?}]},

      # https://tailwindcss.com/docs/grid-row
      "row-end": %{"row-end": ["auto", {Validate, :is_integer?}]},

      # https://tailwindcss.com/docs/grid-auto-flow
      "grid-flow": %{"grid-flow": ~w(row col dense row-dense col-dense)},

      # https://tailwindcss.com/docs/grid-auto-columns
      "auto-cols": %{
        "auto-cols": ["auto", "min", "max", "fr", {Validate, :is_arbitrary_value}]
      },

      # https://tailwindcss.com/docs/grid-auto-rows
      "auto-rows": %{
        "auto-rows": ["auto", "min", "max", "fr", {Validate, :is_arbitrary_value}]
      },

      # https://tailwindcss.com/docs/gap
      gap: %{gap: ["px", {Validate, :is_length}]},

      # https://tailwindcss.com/docs/gap
      "gap-x": %{"gap-x": ["px", {Validate, :is_length}]},

      # https://tailwindcss.com/docs/gap
      "gap-y": %{"gap-y": ["px", {Validate, :is_length}]},

      # https://tailwindcss.com/docs/justify-content
      "justify-content": %{justify: ConfigUtils.align()},

      # https://tailwindcss.com/docs/justify-items
      "justify-items": %{"justify-items": ~w(start end center stretch)},

      # https://tailwindcss.com/docs/justify-self
      "justify-self": %{"justify-self": ~w(auto start end center stretch)},

      # https://tailwindcss.com/docs/align-content
      "align-content": %{"align-content": ConfigUtils.align() ++ ["baseline"]},

      # https://tailwindcss.com/docs/align-items
      "align-items": %{items: ~w(start end center baseline stretch)},

      # https://tailwindcss.com/docs/align-self
      "align-self": %{self: ~w(auto start end center stretch baseline)},

      # https://tailwindcss.com/docs/place-content
      "place-content": %{"place-content": ConfigUtils.align() ++ ~w(baseline stretch)},

      # https://tailwindcss.com/docs/place-items
      "place-items": %{"place-items": ~w(start end center baseline stretch)},

      # https://tailwindcss.com/docs/place-self
      "place-self": %{"place-self": ~w(auto start end center stretch)},

      # https://tailwindcss.com/docs/padding
      p: %{p: ["px", {Validate, :is_length}]},

      # https://tailwindcss.com/docs/padding
      px: %{px: ["px", {Validate, :is_length}]},

      # https://tailwindcss.com/docs/padding
      py: %{py: ["px", {Validate, :is_length}]},

      # https://tailwindcss.com/docs/padding
      pt: %{pt: ["px", {Validate, :is_length}]},

      # https://tailwindcss.com/docs/padding
      pr: %{pr: ["px", {Validate, :is_length}]},

      # https://tailwindcss.com/docs/padding
      pb: %{pb: ["px", {Validate, :is_length}]},

      # https://tailwindcss.com/docs/padding
      pl: %{pl: ["px", {Validate, :is_length}]},

      # https://tailwindcss.com/docs/margin
      m: %{m: ["auto", "px", {Validate, :is_length}]},

      # https://tailwindcss.com/docs/margin
      mx: %{mx: ["auto", "px", {Validate, :is_length}]},

      # https://tailwindcss.com/docs/margin
      my: %{my: ["auto", "px", {Validate, :is_length}]},

      # https://tailwindcss.com/docs/margin
      mt: %{mt: ["auto", "px", {Validate, :is_length}]},

      # https://tailwindcss.com/docs/margin
      mr: %{mr: ["auto", "px", {Validate, :is_length}]},

      # https://tailwindcss.com/docs/margin
      mb: %{mb: ["auto", "px", {Validate, :is_length}]},

      # https://tailwindcss.com/docs/margin
      ml: %{ml: ["auto", "px", {Validate, :is_length}]},

      # https://tailwindcss.com/docs/space
      "space-x": %{"space-x": [{Validate, :is_length}]},

      # https://tailwindcss.com/docs/space
      "space-x-reverse": ["space-x-reverse"],

      # https://tailwindcss.com/docs/space
      "space-y": %{"space-y": [{Validate, :is_length}]},

      # https://tailwindcss.com/docs/space
      "space-y-reverse": ["space-y-reverse"],

      # https://tailwindcss.com/docs/width
      w: %{w: ["auto", "min", "max", "fit", {Validate, :is_length}]},

      # https://tailwindcss.com/docs/min-width
      "min-w": %{"min-w": ["min", "max", "fit", {Validate, :is_length}]},

      # https://tailwindcss.com/docs/max-width
      "max-w": %{
        "max-w": [
          "0",
          "none",
          "full",
          "min",
          "max",
          "fit",
          "prose",
          %{screen: [{Validate, :is_tshirt_value}]},
          {Validate, :is_arbitrary_length},
          {Validate, :is_tshirt_value}
        ]
      },

      # https://tailwindcss.com/docs/height
      h: %{h: ["auto", "min", "max", "fit", {Validate, :is_length}]},

      # https://tailwindcss.com/docs/min-height
      "min-h": %{"min-h": ["min", "max", "fit", {Validate, :is_length}]},

      # https://tailwindcss.com/docs/max-height
      "max-h": %{"max-h": ["min", "max", "fit", {Validate, :is_length}]},

      # https://tailwindcss.com/docs/font-size
      "font-size": %{
        text: [
          "base",
          {Validate, :is_tshirt_value},
          {Validate, :is_arbitrary_length}
        ]
      },

      # https://tailwindcss.com/docs/font-smoothing
      "font-smoothing": ~w(antialiased subpixel-antialiased),

      # https://tailwindcss.com/docs/font-style
      "font-style": ~w(italic not-italic),

      # https://tailwindcss.com/docs/font-weight
      "font-weight": %{
        font: [
          "thin",
          "extralight",
          "light",
          "normal",
          "medium",
          "semibold",
          "bold",
          "extrabold",
          "black",
          {Validate, :is_arbitrary_number}
        ]
      },

      # https://tailwindcss.com/docs/font-family
      "font-family": %{font: ~w(sans serif mono)},

      # https://tailwindcss.com/docs/font-variant-numeric
      "fvn-normal": ~w(normal-nums),

      # https://tailwindcss.com/docs/font-variant-numeric
      "fvn-ordinal": ~w(ordinal),

      # https://tailwindcss.com/docs/font-variant-numeric
      "fvn-slashed-zero": ~w(slashed-zero),

      # https://tailwindcss.com/docs/font-variant-numeric
      "fvn-figure": ~w(lining-nums oldstyle-nums),

      # https://tailwindcss.com/docs/font-variant-numeric
      "fvn-spacing": ~w(proportional-nums tabular-nums),

      # https://tailwindcss.com/docs/font-variant-numeric
      "fvn-fraction": ~w(diagonal-fractions stacked-fractions),

      # https://tailwindcss.com/docs/letter-spacing
      tracking: %{
        tracking: [
          "tighter",
          "tight",
          "normal",
          "wide",
          "wider",
          "widest",
          {Validate, :is_arbitrary_length}
        ]
      },

      # https://tailwindcss.com/docs/line-height
      leading: %{
        leading: [
          "none",
          "tight",
          "snug",
          "normal",
          "relaxed",
          "loose",
          {Validate, :is_length}
        ]
      },

      # https://tailwindcss.com/docs/list-style-type
      "list-style-type": %{
        list: ["none", "disc", "decimal", {Validate, :is_arbitrary_value}]
      },

      # https://tailwindcss.com/docs/list-style-position
      "list-style-position": %{list: ~w(inside outside)},

      # https://tailwindcss.com/docs/placeholder-opacity
      "placeholder-opacity": %{"placeholder-opacity": [{Validate, :is_integer?}]},

      # https://tailwindcss.com/docs/text-align
      "text-alignment": %{text: ~w(left center right justify start end)},

      # https://tailwindcss.com/docs/text-color
      "text-color": %{text: ConfigUtils.colors()},

      # https://tailwindcss.com/docs/text-opacity
      "text-opacity": %{"text-opacity": [{Validate, :is_integer?}]},

      # https://tailwindcss.com/docs/text-decoration
      "text-decoration": ~w(underline overline line-through no-underline),

      # https://tailwindcss.com/docs/text-decoration-style
      "text-decoration-style": %{decoration: ConfigUtils.line_styles()},

      # https://tailwindcss.com/docs/text-decoration-thickness
      "text-decoration-thickness": %{
        decoration: ["auto", "from-font", {Validate, :is_length}]
      },

      # https://tailwindcss.com/docs/text-underline-offset
      "underline-offset": %{"underline-offset": ["auto", {Validate, :is_length}]},

      # https://tailwindcss.com/docs/text-decoration-color
      "text-decoration-color": %{decoration: ConfigUtils.colors()},

      # https://tailwindcss.com/docs/text-transform
      "text-transform": ~w(uppercase lowercase capitalize normal-case),

      # https://tailwindcss.com/docs/text-overflow
      "text-overflow": ~w(truncate text-ellipsis text-clip),

      # https://tailwindcss.com/docs/text-indent
      indent: %{indent: ["px", {Validate, :is_length}]},

      # https://tailwindcss.com/docs/vertical-align
      "vertical-align": %{
        align: [
          "baseline",
          "top",
          "middle",
          "bottom",
          "text-top",
          "text-bottom",
          "sub",
          "super",
          {Validate, :is_arbitrary_length}
        ]
      },

      # https://tailwindcss.com/docs/whitespace
      whitespace: %{whitespace: ~w(normal nowrap pre pre-line pre-wrap)},

      # https://tailwindcss.com/docs/word-break
      break: %{break: ~w(normal words all keep)},

      # https://tailwindcss.com/docs/content
      content: %{content: ["none", {Validate, :is_arbitrary_value}]},

      # https://tailwindcss.com/docs/background-attachment
      "bg-attachment": %{bg: ~w(fixed local scroll)},

      # https://tailwindcss.com/docs/background-clip
      "bg-clip": %{"bg-clip": ~w(border padding content text)},

      # https://tailwindcss.com/docs/background-opacity
      "bg-opacity": %{"bg-opacity": [{Validate, :is_integer?}]},

      # https://tailwindcss.com/docs/background-origin
      "bg-origin": %{"bg-origin": ~w(border padding content)},

      # https://tailwindcss.com/docs/background-position
      "bg-position": %{
        bg: ConfigUtils.positions() ++ [{Validate, :is_arbitrary_position}]
      },

      # https://tailwindcss.com/docs/background-repeat
      "bg-repeat": %{bg: ["no-repeat", %{repeat: ["", "x", "y", "round", "space"]}]},

      # https://tailwindcss.com/docs/background-size
      "bg-size": %{
        bg: ["auto", "cover", "contain", {Validate, :is_arbitrary_length}]
      },

      # https://tailwindcss.com/docs/background-image
      "bg-image": %{bg: ["none", %{"gradient-to": ~w(t tr r br b bl l tl)}]},

      # https://tailwindcss.com/docs/background-color
      "bg-color": %{bg: ConfigUtils.colors()},

      # https://tailwindcss.com/docs/gradient-color-stops
      "gradient-from": %{from: ConfigUtils.colors()},

      # https://tailwindcss.com/docs/gradient-color-stops
      "gradient-via": %{via: ConfigUtils.colors()},

      # https://tailwindcss.com/docs/gradient-color-stops
      "gradient-to": %{to: ConfigUtils.colors()},

      # https://tailwindcss.com/docs/border-radius
      rounded: %{
        rounded: [
          "none",
          "",
          "full",
          {Validate, :is_tshirt_value},
          {Validate, :is_arbitrary_length}
        ]
      },

      # https://tailwindcss.com/docs/border-radius
      "rounded-t": %{
        "rounded-t": [
          "none",
          "",
          "full",
          {Validate, :is_tshirt_value},
          {Validate, :is_arbitrary_length}
        ]
      },

      # https://tailwindcss.com/docs/border-radius
      "rounded-r": %{
        "rounded-r": [
          "none",
          "",
          "full",
          {Validate, :is_tshirt_value},
          {Validate, :is_arbitrary_length}
        ]
      },

      # https://tailwindcss.com/docs/border-radius
      "rounded-b": %{
        "rounded-b": [
          "none",
          "",
          "full",
          {Validate, :is_tshirt_value},
          {Validate, :is_arbitrary_length}
        ]
      },

      # https://tailwindcss.com/docs/border-radius
      "rounded-l": %{
        "rounded-l": [
          "none",
          "",
          "full",
          {Validate, :is_tshirt_value},
          {Validate, :is_arbitrary_length}
        ]
      },

      # https://tailwindcss.com/docs/border-radius
      "rounded-tl": %{
        "rounded-tl": [
          "none",
          "",
          "full",
          {Validate, :is_tshirt_value},
          {Validate, :is_arbitrary_length}
        ]
      },

      # https://tailwindcss.com/docs/border-radius
      "rounded-tr": %{
        "rounded-tr": [
          "none",
          "",
          "full",
          {Validate, :is_tshirt_value},
          {Validate, :is_arbitrary_length}
        ]
      },

      # https://tailwindcss.com/docs/border-radius
      "rounded-br": %{
        "rounded-br": [
          "none",
          "",
          "full",
          {Validate, :is_tshirt_value},
          {Validate, :is_arbitrary_length}
        ]
      },

      # https://tailwindcss.com/docs/border-radius
      "rounded-bl": %{
        "rounded-bl": [
          "none",
          "",
          "full",
          {Validate, :is_tshirt_value},
          {Validate, :is_arbitrary_length}
        ]
      },

      # https://tailwindcss.com/docs/border-width
      "border-w": %{border: ["", {Validate, :is_length}]},

      # https://tailwindcss.com/docs/border-width
      "border-w-x": %{"border-x": ["", {Validate, :is_length}]},

      # https://tailwindcss.com/docs/border-width
      "border-w-y": %{"border-y": ["", {Validate, :is_length}]},

      # https://tailwindcss.com/docs/border-width
      "border-w-t": %{"border-t": ["", {Validate, :is_length}]},

      # https://tailwindcss.com/docs/border-width
      "border-w-r": %{"border-r": ["", {Validate, :is_length}]},

      # https://tailwindcss.com/docs/border-width
      "border-w-b": %{"border-b": ["", {Validate, :is_length}]},

      # https://tailwindcss.com/docs/border-width
      "border-w-l": %{"border-l": ["", {Validate, :is_length}]},

      # https://tailwindcss.com/docs/border-opacity
      "border-opacity": %{"border-opacity": [{Validate, :is_integer?}]},

      # https://tailwindcss.com/docs/border-style
      "border-style": %{border: ConfigUtils.line_styles() ++ ["hidden"]},

      # https://tailwindcss.com/docs/divide-width
      "divide-x": %{"divide-x": ["", {Validate, :is_length}]},

      # https://tailwindcss.com/docs/divide-width
      "divide-x-reverse": ["divide-x-reverse"],

      # https://tailwindcss.com/docs/divide-width
      "divide-y": %{"divide-y": ["", {Validate, :is_length}]},

      # https://tailwindcss.com/docs/divide-width
      "divide-y-reverse": ["divide-y-reverse"],

      # https://tailwindcss.com/docs/divide-opacity
      "divide-opacity": %{"divide-opacity": [{Validate, :is_integer?}]},

      # https://tailwindcss.com/docs/divide-style
      "divide-style": %{divide: ConfigUtils.line_styles()},

      # https://tailwindcss.com/docs/border-color
      "border-color": %{border: ConfigUtils.colors()},

      # https://tailwindcss.com/docs/border-color
      "border-color-x": %{"border-x": ConfigUtils.colors()},

      # https://tailwindcss.com/docs/border-color
      "border-color-y": %{"border-y": ConfigUtils.colors()},

      # https://tailwindcss.com/docs/border-color
      "border-color-t": %{"border-t": ConfigUtils.colors()},

      # https://tailwindcss.com/docs/border-color
      "border-color-r": %{"border-r": ConfigUtils.colors()},

      # https://tailwindcss.com/docs/border-color
      "border-color-b": %{"border-b": ConfigUtils.colors()},

      # https://tailwindcss.com/docs/border-color
      "border-color-l": %{"border-l": ConfigUtils.colors()},

      # https://tailwindcss.com/docs/divide-color
      "divide-color": %{divide: ConfigUtils.colors()},

      # https://tailwindcss.com/docs/outline-style
      "outline-style": %{outline: ConfigUtils.line_styles() ++ [""]},

      # https://tailwindcss.com/docs/outline-offset
      "outline-offset": %{"outline-offset": [{Validate, :is_length}]},

      # https://tailwindcss.com/docs/outline-width
      "outline-w": %{outline: [{Validate, :is_length}]},

      # https://tailwindcss.com/docs/outline-color
      "outline-color": %{outline: ConfigUtils.colors()},

      # https://tailwindcss.com/docs/ring-width
      "ring-w": %{ring: ["", {Validate, :is_length}]},

      # https://tailwindcss.com/docs/ring-width
      "ring-w-inset": ["ring-inset"],

      # https://tailwindcss.com/docs/ring-color
      "ring-color": %{ring: ConfigUtils.colors()},

      # https://tailwindcss.com/docs/ring-opacity
      "ring-opacity": %{"ring-opacity": [{Validate, :is_integer?}]},

      # https://tailwindcss.com/docs/ring-offset-width
      "ring-offset-w": %{"ring-offset": [{Validate, :is_length}]},

      # https://tailwindcss.com/docs/ring-offset-color
      "ring-offset-color": %{"ring-offset": ConfigUtils.colors()},

      # https://tailwindcss.com/docs/box-shadow
      shadow: %{
        shadow: [
          "",
          "inner",
          "none",
          {Validate, :is_tshirt_value},
          {Validate, :is_arbitrary_shadow}
        ]
      },

      # https://tailwindcss.com/docs/box-shadow-color
      "shadow-color": %{shadow: ConfigUtils.colors()},

      # https://tailwindcss.com/docs/opacity
      opacity: %{opacity: [{Validate, :is_integer?}]},

      # https://tailwindcss.com/docs/mix-blend-mode
      "mix-blend": %{"mix-blend": ConfigUtils.blend_modes()},

      # https://tailwindcss.com/docs/background-blend-mode
      "bg-blend": %{"bg-blend": ConfigUtils.blend_modes()},

      # https://tailwindcss.com/docs/filter
      filter: %{filter: ["", "none"]},

      # https://tailwindcss.com/docs/blur
      blur: %{
        blur: [
          "",
          "none",
          {Validate, :is_tshirt_value},
          {Validate, :is_arbitrary_length}
        ]
      },

      # https://tailwindcss.com/docs/brightness
      brightness: %{brightness: [{Validate, :is_integer?}]},

      # https://tailwindcss.com/docs/contrast
      contrast: %{contrast: [{Validate, :is_integer?}]},

      # https://tailwindcss.com/docs/drop-shadow
      "drop-shadow": %{
        "drop-shadow": [
          "",
          "none",
          {Validate, :is_tshirt_value},
          {Validate, :is_arbitrary_value}
        ]
      },

      # https://tailwindcss.com/docs/grayscale
      grayscale: %{grayscale: ConfigUtils.zero_and_empty()},

      # https://tailwindcss.com/docs/hue-rotate
      "hue-rotate": %{"hue-rotate": [{Validate, :is_integer?}]},

      # https://tailwindcss.com/docs/invert
      invert: %{invert: ConfigUtils.zero_and_empty()},

      # https://tailwindcss.com/docs/saturate
      saturate: %{saturate: [{Validate, :is_integer?}]},

      # https://tailwindcss.com/docs/sepia
      sepia: %{sepia: ConfigUtils.zero_and_empty()},

      # https://tailwindcss.com/docs/backdrop-filter
      "backdrop-filter": %{"backdrop-filter": ["", "none"]},

      # https://tailwindcss.com/docs/backdrop-blur
      "backdrop-blur": %{
        "backdrop-blur": [
          "",
          "none",
          {Validate, :is_tshirt_value},
          {Validate, :is_arbitrary_value}
        ]
      },

      # https://tailwindcss.com/docs/backdrop-brightness
      "backdrop-brightness": %{"backdrop-brightness": [{Validate, :is_integer?}]},

      # https://tailwindcss.com/docs/backdrop-contrast
      "backdrop-contrast": %{"backdrop-contrast": [{Validate, :is_integer?}]},

      # https://tailwindcss.com/docs/backdrop-grayscale
      "backdrop-grayscale": %{"backdrop-grayscale": ConfigUtils.zero_and_empty()},

      # https://tailwindcss.com/docs/backdrop-hue-rotate
      "backdrop-hue-rotate": %{"backdrop-hue-rotate": [{Validate, :is_integer?}]},

      # https://tailwindcss.com/docs/backdrop-invert
      "backdrop-invert": %{"backdrop-invert": ConfigUtils.zero_and_empty()},

      # https://tailwindcss.com/docs/backdrop-opacity
      "backdrop-opacity": %{"backdrop-opacity": [{Validate, :is_integer?}]},

      # https://tailwindcss.com/docs/backdrop-saturate
      "backdrop-saturate": %{"backdrop-saturate": [{Validate, :is_integer?}]},

      # https://tailwindcss.com/docs/backdrop-sepia
      "backdrop-sepia": %{"backdrop-sepia": ConfigUtils.zero_and_empty()},

      # https://tailwindcss.com/docs/border-collapse
      "border-collapse": %{border: ["collapse", "separate"]},

      # https://tailwindcss.com/docs/border-spacing
      "border-spacing": %{"border-spacing": [{Validate, :is_length}]},

      # https://tailwindcss.com/docs/border-spacing
      "border-spacing-x": %{"border-spacing-x": [{Validate, :is_length}]},

      # https://tailwindcss.com/docs/border-spacing
      "border-spacing-y": %{"border-spacing-y": [{Validate, :is_length}]},

      # https://tailwindcss.com/docs/table-layout
      "table-layout": %{table: ["auto", "fixed"]},

      # https://tailwindcss.com/docs/transition-property
      transition: %{
        transition: [
          "none",
          "all",
          "",
          "colors",
          "opacity",
          "shadow",
          "transform",
          {Validate, :is_arbitrary_value}
        ]
      },

      # https://tailwindcss.com/docs/transition-duration
      duration: %{duration: [{Validate, :is_integer?}]},

      # https://tailwindcss.com/docs/transition-timing-function
      ease: %{
        ease: ["linear", "in", "out", "in-out", {Validate, :is_arbitrary_value}]
      },

      # https://tailwindcss.com/docs/transition-delay
      delay: %{delay: [{Validate, :is_integer?}]},

      # https://tailwindcss.com/docs/animation
      animate: %{
        animate: [
          "none",
          "spin",
          "ping",
          "pulse",
          "bounce",
          {Validate, :is_arbitrary_value}
        ]
      },

      # https://tailwindcss.com/docs/transform
      transform: %{transform: ["", "gpu", "none"]},

      # https://tailwindcss.com/docs/scale
      scale: %{scale: [{Validate, :is_integer?}]},

      # https://tailwindcss.com/docs/scale
      "scale-x": %{"scale-x": [{Validate, :is_integer?}]},

      # https://tailwindcss.com/docs/scale
      "scale-y": %{"scale-y": [{Validate, :is_integer?}]},

      # https://tailwindcss.com/docs/rotate
      rotate: %{
        rotate: [
          {Validate, :is_integer?},
          {Validate, :is_arbitrary_value}
        ]
      },

      # https://tailwindcss.com/docs/translate
      "translate-x": %{"translate-x": [{Validate, :is_length}]},

      # https://tailwindcss.com/docs/translate
      "translate-y": %{"translate-y": [{Validate, :is_length}]},

      # https://tailwindcss.com/docs/skew
      "skew-x": %{
        "skew-x": [
          {Validate, :is_integer?},
          {Validate, :is_arbitrary_value}
        ]
      },

      # https://tailwindcss.com/docs/skew
      "skew-y": %{
        "skew-y": [
          {Validate, :is_integer?},
          {Validate, :is_arbitrary_value}
        ]
      },

      # https://tailwindcss.com/docs/transform-origin
      "transform-origin": %{
        origin: [
          "center",
          "top",
          "top-right",
          "right",
          "bottom-right",
          "bottom",
          "bottom-left",
          "left",
          "top-left",
          {Validate, :is_arbitrary_value}
        ]
      },

      # https://tailwindcss.com/docs/accent-color
      accent: %{accent: ["auto"] ++ ConfigUtils.colors()},

      # https://tailwindcss.com/docs/appearance
      appearance: ["appearance-none"],

      # https://tailwindcss.com/docs/cursor
      cursor: %{
        cursor: [
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
          {Validate, :is_arbitrary_value}
        ]
      },

      # https://tailwindcss.com/docs/caret-color
      "caret-color": %{caret: ConfigUtils.colors()},

      # https://tailwindcss.com/docs/pointer-events
      "pointer-events": %{"pointer-events": ["none", "auto"]},

      # https://tailwindcss.com/docs/resize
      resize: %{resize: ["none", "y", "x", ""]},

      # https://tailwindcss.com/docs/scroll-behavior
      "scroll-behavior": %{scroll: ["auto", "smooth"]},

      # https://tailwindcss.com/docs/scroll-margin
      "scroll-m": %{"scroll-m": [{Validate, :is_length}]},

      # https://tailwindcss.com/docs/scroll-margin
      "scroll-mx": %{"scroll-mx": [{Validate, :is_length}]},

      # https://tailwindcss.com/docs/scroll-margin
      "scroll-my": %{"scroll-my": [{Validate, :is_length}]},

      # https://tailwindcss.com/docs/scroll-margin
      "scroll-mt": %{"scroll-mt": [{Validate, :is_length}]},

      # https://tailwindcss.com/docs/scroll-margin
      "scroll-mr": %{"scroll-mr": [{Validate, :is_length}]},

      # https://tailwindcss.com/docs/scroll-margin
      "scroll-mb": %{"scroll-mb": [{Validate, :is_length}]},

      # https://tailwindcss.com/docs/scroll-margin
      "scroll-ml": %{"scroll-ml": [{Validate, :is_length}]},

      # https://tailwindcss.com/docs/scroll-padding
      "scroll-p": %{"scroll-p": [{Validate, :is_length}]},

      # https://tailwindcss.com/docs/scroll-padding
      "scroll-px": %{"scroll-px": [{Validate, :is_length}]},

      # https://tailwindcss.com/docs/scroll-padding
      "scroll-py": %{"scroll-py": [{Validate, :is_length}]},

      # https://tailwindcss.com/docs/scroll-padding
      "scroll-pt": %{"scroll-pt": [{Validate, :is_length}]},

      # https://tailwindcss.com/docs/scroll-padding
      "scroll-pr": %{"scroll-pr": [{Validate, :is_length}]},

      # https://tailwindcss.com/docs/scroll-padding
      "scroll-pb": %{"scroll-pb": [{Validate, :is_length}]},

      # https://tailwindcss.com/docs/scroll-padding
      "scroll-pl": %{"scroll-pl": [{Validate, :is_length}]},

      # https://tailwindcss.com/docs/scroll-snap-align
      "snap-align": %{snap: ~w(start end center align-none)},

      # https://tailwindcss.com/docs/scroll-snap-stop
      "snap-stop": %{snap: ~w(normal always)},

      # https://tailwindcss.com/docs/scroll-snap-type
      "snap-type": %{snap: ~w(none x y both)},

      # https://tailwindcss.com/docs/scroll-snap-type
      "snap-strictness": %{snap: ~w(mandatory proximity)},

      # https://tailwindcss.com/docs/touch-action
      touch: %{
        touch: [
          "auto",
          "none",
          "pinch-zoom",
          "manipulation",
          %{pan: ~w(x left right y up down)}
        ]
      },

      # https://tailwindcss.com/docs/user-select
      select: %{select: ~w(none text all auto)},

      # https://tailwindcss.com/docs/will-change
      "will-change": %{
        "will-change": [
          "auto",
          "scroll",
          "contents",
          "transform",
          {Validate, :is_arbitrary_value}
        ]
      },

      # https://tailwindcss.com/docs/fill
      fill: %{fill: ConfigUtils.colors() ++ ["none"]},

      # https://tailwindcss.com/docs/stroke-width
      "stroke-w": %{
        stroke: [
          {Validate, :is_length},
          {Validate, :is_arbitrary_number}
        ]
      },

      # https://tailwindcss.com/docs/stroke
      stroke: %{stroke: ConfigUtils.colors() ++ ["none"]},

      # https://tailwindcss.com/docs/screen-readers
      sr: ~w(sr-only not-sr-only)
    ]
  end

  def conflicting_class_groups() do
    [
      overflow: ~w(overflow-x overflow-y),
      overscroll: ~w(overscroll-x overscroll-y),
      inset: ~w(inset-x inset-y top right bottom left),
      "inset-x": ~w(right left),
      "inset-y": ~w(top bottom),
      flex: ~w(basis grow shrink),
      "col-start-end": ~w(col-start col-end),
      "row-start-end": ~w(row-start row-end),
      gap: ~w(gap-x gap-y),
      p: ~w(px py pt pr pb pl),
      px: ~w(pr pl),
      py: ~w(pt pb),
      m: ~w(mx my mt mr mb ml),
      mx: ~w(mr ml),
      my: ~w(mt mb),
      "font-size": ~w(leading),
      "fvn-normal": ~w(fvn-ordinal fvn-slashed-zero fvn-figure fvn-spacing fvn-fraction),
      "fvn-ordinal": ~w(fvn-normal),
      "fvn-slashed-zero": ~w(fvn-normal),
      "fvn-figure": ~w(fvn-normal),
      "fvn-spacing": ~w(fvn-normal),
      "fvn-fraction": ~w(fvn-normal),
      rounded:
        ~w(rounded-t rounded-r rounded-b rounded-l rounded-tl rounded-tr rounded-br rounded-bl),
      "rounded-t": ~w(rounded-tl rounded-tr),
      "rounded-r": ~w(rounded-tr rounded-br),
      "rounded-b": ~w(rounded-br rounded-bl),
      "rounded-l": ~w(rounded-tl rounded-bl),
      "border-spacing": ~w(border-spacing-x border-spacing-y),
      "border-w": ~w(border-w-t border-w-r border-w-b border-w-l),
      "border-w-x": ~w(border-w-r border-w-l),
      "border-w-y": ~w(border-w-t border-w-b),
      "border-color": ~w(border-color-t border-color-r border-color-b border-color-l),
      "border-color-x": ~w(border-color-r border-color-l"),
      "border-color-y": ~w(border-color-t border-color-b),
      "scroll-m": ~w(scroll-mx scroll-my scroll-mt scroll-mr scroll-mb scroll-ml),
      "scroll-mx": ~w(scroll-mr scroll-ml),
      "scroll-my": ~w(scroll-mt scroll-mb),
      "scroll-p": ~w(scroll-px scroll-py scroll-pt scroll-pr scroll-pb scroll-pl),
      "scroll-px": ~w(scroll-pr scroll-pl),
      "scroll-py": ~w(scroll-pt scroll-pb)
    ]
  end
end
