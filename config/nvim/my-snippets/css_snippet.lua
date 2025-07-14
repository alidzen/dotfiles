local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local sn = ls.snippet_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt
local p = require("luasnip.extras").partial

local css_snippets = {
  s("bgp", {
    t("."),
    i(1, "class-name"),
    t(" {"),
    t({ "", "  background-color: " }),
    i(2, "#ffffff"),
    t(";"),
    t({ "", "  padding: " }),
    i(3, "10px"),
    t(";"),
    t({ "", "}" }),
  }),

  -- Snippet for CSS gutter variable
  s("gt", {
    t("var(--gutter-"),
    i(1),
    t(")"),
  }),

  -- Snippet for CSS font-size
  s("fs", {
    t("var(--fs-"),
    i(1),
    t("00)"),
  }),

  -- Snippet for CSS font-size
  s("lh", {
    t("var(--lh-"),
    i(1),
    t("00)"),
  }),

  -- Snippet for min-width 600px media query
  s("msm", {
    t("@media screen and (min-width: 600px) {"),
    t({ "", "  " }),
    i(0),
    t({ "", "}" }),
  }),

  -- Snippet for min-width 768px media query
  s("mst", {
    t("@media screen and (min-width: 768px) {"),
    t({ "", "  " }),
    i(0),
    t({ "", "}" }),
  }),

  -- Snippet for min-width 1100px media query
  s("msd", {
    t("@media screen and (min-width: 1100px) {"),
    t({ "", "  " }),
    i(0),
    t({ "", "}" }),
  }),
}

ls.add_snippets("css", css_snippets)
ls.add_snippets("scss", css_snippets)
ls.add_snippets("sass", css_snippets)
