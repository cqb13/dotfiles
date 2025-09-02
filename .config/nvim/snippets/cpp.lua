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

local boiler = fmt(
	[[
  #include <iostream>
  
  int main() {{
    std::cout << "" << '\n';
    return 0;
  }}
  ]],
	{}
)

local print = fmt(
	[[
  std::cout << {} << '\n';
  ]],
	{ i(1) }
)

local boiler_snippet = s("!main", boiler)
local header_snippet = s("!header", header)
local print_snippet = s("print", print)
table.insert(snippets, boiler_snippet)
table.insert(snippets, header_snippet)
table.insert(snippets, print_snippet)

return snippets, autosnippets
