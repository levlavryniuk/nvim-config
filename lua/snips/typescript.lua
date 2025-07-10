local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
-- local f = ls.function_node
local i = ls.insert_node

return {
  s("clg", {
    t("console.log("),
    i(1, "text"),
    t(")"),
  }),
}
