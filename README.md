# TailwindMerge

[![CI](https://github.com/cozy-elixir/tailwind_merge/actions/workflows/ci.yml/badge.svg)](https://github.com/cozy-elixir/tailwind_merge/actions/workflows/ci.yml)
[![Hex.pm](https://img.shields.io/hexpm/v/tailwind_merge.svg)](https://hex.pm/packages/tailwind_merge)

Utility function to efficiently merge Tailwind CSS classes in Elixir without style conflicts.

> Inspired by [tailwind-merge](https://github.com/dcastil/tailwind-merge).

## Why?

Overriding Tailwind CSS classes is unintuitive.

Due to the way the [CSS Cascade](https://developer.mozilla.org/en-US/docs/Web/CSS/Cascade) works, the order of CSS styles applied on an element isn't based on the order of given classes, but the order in which CSS styles appear in CSS stylesheets. Because of that, when using Tailwind CSS classes which involve the same styles (we call them _conflicting classes_), the final styles are indeterminate.

```heex
<% # Is it red or green? It's hard to say. %>
<div class={["h-12 bg-red-500", "bg-green-500"]}></div>
```

`TailwindMerge` solves this problem by overriding _conflicting classes_ and keeps everything else untouched.

```heex
<div class={TailwindMerge.merge(["h-12 bg-red-500", "bg-green-500"])}></div>
<% # equals to %>
<div class="h-12 bg-green-500"></div>
```

## Installation

Add `:tailwind_merge` to the list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:tailwind_merge, <requirement>}
  ]
end
```

## Usage

For more information, see the [documentation](https://hexdocs.pm/tailwind_merge).

## Similar projects

- [bratsche/twix](https://github.com/bratsche/twix)
- [zachdaniel/tails](https://github.com/zachdaniel/tails)

## License

[Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0) / [MIT](./License)
