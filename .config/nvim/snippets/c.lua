local ls = require("luasnip")
local s = ls.s

local fmt = require("luasnip.extras.fmt").fmt

local snippets, autosnippets = {}, {}

local boiler = fmt(
	[[
	#include <stdio.h>

  int main(int argc, char *argv[]) {{
    return 0;
  }}
  ]],
	{}
)

local boiler_snippet = s("!main", boiler)
table.insert(snippets, boiler_snippet)

return snippets, autosnippets
