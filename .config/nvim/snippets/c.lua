local ls = require("luasnip")
local s = ls.s
local i = ls.i

local fmt = require("luasnip.extras.fmt").fmt

local snippets, autosnippets = {}, {}

local boiler = fmt(
	[[
	#include <stdio.h>

  int main() {{
    printf("{}\n");
    return 0;
  }}
  ]],
	{ i(1) }
)

local print = fmt(
	[[
  printf("{}\n");
  ]],
	{ i(1) }
)

local boiler_snippet = s("!main", boiler)
local print_snippet = s("print", print)
table.insert(snippets, boiler_snippet)
table.insert(snippets, print_snippet)

return snippets, autosnippets
