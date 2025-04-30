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
}

ls.add_snippets("css", css_snippets)
ls.add_snippets("scss", css_snippets)
ls.add_snippets("sass", css_snippets)

