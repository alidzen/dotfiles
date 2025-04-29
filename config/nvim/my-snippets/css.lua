local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

-- Define common CSS snippets
local snippets = {
  -- CSS Comment block
  s("cmm", {
    t({ "/* ", "   " }),
    i(1, "comment"),
    t({ "", " */" }),
  }),

  -- Flexbox setup
  s(
    "flex",
    fmt(
      [[
{} {{
  display: flex;
  flex-direction: {};
  justify-content: {};
  align-items: {};
  {}
}}
]],
      {
        i(1, "selector"),
        c(2, { t("row"), t("column"), t("row-reverse"), t("column-reverse") }),
        c(3, { t("flex-start"), t("flex-end"), t("center"), t("space-between"), t("space-around") }),
        c(4, { t("center"), t("flex-start"), t("flex-end"), t("stretch"), t("baseline") }),
        i(5, ""),
      }
    )
  ),

  -- Flexbox child properties
  s(
    "flexchild",
    fmt(
      [[
{} {{
  flex: {} {} {};
  order: {};
}}
]],
      {
        i(1, "selector"),
        i(2, "0"),
        i(3, "1"),
        i(4, "auto"),
        i(5, "0"),
      }
    )
  ),

  -- Grid setup
  s(
    "grid",
    fmt(
      [[
{} {{
  display: grid;
  grid-template-columns: {};
  grid-template-rows: {};
  gap: {};
  {}
}}
]],
      {
        i(1, "selector"),
        i(2, "repeat(3, 1fr)"),
        i(3, "auto"),
        i(4, "10px"),
        i(5, ""),
      }
    )
  ),
  -- Media query
  s(
    "mq",
    fmt(
      [[
@media ({}: {}) {{
  {}
}}
]],
      {
        c(1, { t("max-width"), t("min-width"), t("max-height"), t("min-height") }),
        c(2, { t("768px"), t("992px"), t("1200px"), t("480px") }),
        i(3, "/* styles here */"),
      }
    )
  ),

  -- Animation
  s(
    "anim",
    fmt(
      [[
@keyframes {} {{
  0% {{
    {}
  }}
  100% {{
    {}
  }}
}}

{} {{
  animation: {} {}s {} infinite;
}}
]],
      {
        i(1, "animationName"),
        i(2, "opacity: 0;"),
        i(3, "opacity: 1;"),
        i(4, "selector"),
        rep(1),
        i(5, "1"),
        c(6, { t("ease"), t("linear"), t("ease-in"), t("ease-out"), t("ease-in-out") }),
      }
    )
  ),

  -- Position absolute with centering
  s(
    "abs",
    fmt(
      [[
{} {{
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  {}
}}
]],
      {
        i(1, "selector"),
        i(2, ""),
      }
    )
  ),

  -- Box shadow
  s(
    "bshd",
    fmt(
      [[
{} {{
  box-shadow: {}px {}px {}px {}px {};
  {}
}}
]],
      {
        i(1, "selector"),
        i(2, "0"),
        i(3, "3"),
        i(4, "5"),
        i(5, "0"),
        i(6, "rgba(0, 0, 0, 0.2)"),
        i(7, ""),
      }
    )
  ),

  -- Transform with vendor prefixes
  s(
    "transform",
    fmt(
      [[
{} {{
  -webkit-transform: {};
  -moz-transform: {};
  -ms-transform: {};
  transform: {};
}}
]],
      {
        i(1, "selector"),
        i(2, "translateX(10px)"),
        rep(2),
        rep(2),
        rep(2),
      }
    )
  ),

  -- Transition with vendor prefixes
  s(
    "transition",
    fmt(
      [[
{} {{
  -webkit-transition: {} {}s {};
  -moz-transition: {} {}s {};
  -o-transition: {} {}s {};
  transition: {} {}s {};
}}
]],
      {
        i(1, "selector"),
        i(2, "all"),
        i(3, "0.3"),
        c(4, { t("ease"), t("linear"), t("ease-in"), t("ease-out") }),
        rep(2),
        rep(3),
        rep(4),
        rep(2),
        rep(3),
        rep(4),
        rep(2),
        rep(3),
        rep(4),
      }
    )
  ),

  -- Border radius with vendor prefixes
  s(
    "radius",
    fmt(
      [[
{} {{
  -webkit-border-radius: {}px;
  -moz-border-radius: {}px;
  border-radius: {}px;
}}
]],
      {
        i(1, "selector"),
        i(2, "5"),
        rep(2),
        rep(2),
      }
    )
  ),

  -- CSS variable declaration
  s(
    "var",
    fmt(
      [[
:root {{
  --{}: {};
}}
]],
      {
        i(1, "variable-name"),
        i(2, "value"),
      }
    )
  ),

  -- CSS variable usage
  s(
    "varuse",
    fmt(
      [[
{} {{
  {}: var(--{});
}}
]],
      {
        i(1, "selector"),
        i(2, "property"),
        i(3, "variable-name"),
      }
    )
  ),

  -- Import statement (for SCSS/SASS)
  s(
    "import",
    fmt(
      [[
@import '{}';
]],
      {
        i(1, "path/to/file"),
      }
    )
  ),

  -- SCSS mixin definition
  s(
    "mixin",
    fmt(
      [[
@mixin {}({}) {{
  {}
}}
]],
      {
        i(1, "mixin-name"),
        i(2, "parameters"),
        i(3, "// mixin content"),
      }
    )
  ),

  -- SCSS mixin usage
  s(
    "include",
    fmt(
      [[
@include {}({});
]],
      {
        i(1, "mixin-name"),
        i(2, "arguments"),
      }
    )
  ),

  -- CSS Grid item placement
  s(
    "griditem",
    fmt(
      [[
{} {{
  grid-column: {} / {};
  grid-row: {} / {};
}}
]],
      {
        i(1, "selector"),
        i(2, "1"),
        i(3, "2"),
        i(4, "1"),
        i(5, "2"),
      }
    )
  ),
}

-- Create autosnippets table
local autosnippets = {}

-- Return the snippets for multiple file types
return {
  -- Regular snippets available in CSS, SCSS, and SASS
  css = snippets,
  scss = snippets,
  sass = snippets,
  -- Autosnippets available in CSS, SCSS, and SASS
  css_autosnippets = autosnippets,
  scss_autosnippets = autosnippets,
  sass_autosnippets = autosnippets,
}
