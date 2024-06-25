defmodule TailwindMergeJSTest do
  @moduledoc """
  These tests comes from tailwind-merge in JavaScript community.

    * https://github.com/dcastil/tailwind-merge/blob/b75666919682b49c8555159b3c7bce0e4e7fc319/docs/features.md

  """

  use ExUnit.Case
  import TailwindHelper

  test "Last conflicting class wins" do
    assert tw("p-5 p-2 p-4") == "p-4"
  end

  test "Allow refinements" do
    assert tw("p-3 px-5") == "p-3 px-5"
    assert tw("inset-x-4 right-4") == "inset-x-4 right-4"
  end

  # TODO: fix it
  # test "Supports modifiers and stacked modifiers" do
  #   assert tw("p-2 hover:p-4") == "p-2 hover:p-4"
  #   assert tw("hover:p-2 hover:p-4") == "hover:p-4"
  #   assert tw("focus:hover:p-2 focus:hover:p-4") == "focus:hover:p-4"

  #   assert tw("hover:focus:p-2 focus:hover:p-4") == "focus:hover:p-4"
  # end

  test "Supports arbitrary values" do
    assert tw("bg-black bg-[color:var(--mystery-var)]") == "bg-[color:var(--mystery-var)]"
    assert tw("grid-cols-[1fr,auto] grid-cols-2") == "grid-cols-2"
  end

  # TODO: fix it
  # test "Supports arbitrary properties" do
  #   assert tw("[mask-type:luminance] [mask-type:alpha]") == "[mask-type:alpha]"

  #   assert tw("[--scroll-offset:56px] lg:[--scroll-offset:44px]") ==
  #            "[--scroll-offset:56px] lg:[--scroll-offset:44px]"
  # end

  # TODO: fix it
  # test "Supports arbitrary variants" do
  #   assert tw("[&:nth-child(3)]:py-0 [&:nth-child(3)]:py-4") == "[&:nth-child(3)]:py-4"

  #   assert tw("dark:hover:[&:nth-child(3)]:py-0 hover:dark:[&:nth-child(3)]:py-4") ==
  #            "hover:dark:[&:nth-child(3)]:py-4"
  # end

  # TODO: fix it
  # test "Supports important modifier" do
  #   assert tw("!p-3 !p-4 p-5") == "!p-4 p-5"
  #   assert tw("!right-2 !-inset-x-1") == "!-inset-x-1"
  # end

  # TODO: fix it
  # test "Supports postfix modifiers" do
  #   assert tw("text-sm leading-6 text-lg/7") == "text-lg/7"
  # end

  test "Preserves non-Tailwind classes" do
    assert tw("p-5 p-2 my-non-tailwind-class p-4") == "my-non-tailwind-class p-4"
  end

  # TODO: fix it
  # test "Supports custom colors out of the box" do
  #   assert tw("text-red text-secret-sauce") == "text-secret-sauce"
  # end
end
