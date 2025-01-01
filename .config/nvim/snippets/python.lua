local ls = require("luasnip")
local s = ls.snippet
local fmt = require("luasnip.extras.fmt").fmt

local snippets, autosnippets = {}, {}

local boiler = fmt(
	[[
  def main():
    print("Hello World")


  if __name__ == "__main__":
    main()
  ]],
	{}
)
local boiler_snippet = s("!main", boiler)
table.insert(snippets, boiler_snippet)

return snippets, autosnippets
