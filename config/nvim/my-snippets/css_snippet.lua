local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local snippets = {
  s("gt", {
    t("var(--gutter-"),
    i(1),
    t(")"),
  }),
}

-- ls.add_snippets("css", {
--   -- Snippet for a CSS class with background color and padding
--   s("bgp", {
--     t("."),
--     i(1, "class-name"),
--     t(" {"),
--     t({ "", "  background-color: " }),
--     i(2, "#ffffff"),
--     t(";"),
--     t({ "", "  padding: " }),
--     i(3, "10px"),
--     t(";"),
--     t({ "", "}" }),
--   }),
--
--   -- Snippet for CSS gutter variable
--   s("gt", {
--     t("var(--gutter-"),
--     i(1),
--     t(")"),
--   }),
-- })

return {
  css = snippets,
  scss = snippets,
  sass = snippets,
}
