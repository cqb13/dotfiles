local ls = require("luasnip")
local s = ls.s
local i = ls.i

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {}

local header = fmt(
	[[
  #ifndef {}
  #define {}

  #endif
  ]],
	{ i(1), rep(1) }
)

local boiler_snippet = s("!header", header)
table.insert(snippets, boiler_snippet)

return snippets, autosnippets
