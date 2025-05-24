local ls = require("luasnip")
local s = ls.s

local fmt = require("luasnip.extras.fmt").fmt

local snippets, autosnippets = {}, {}

local boiler = fmt(
	[[
	package main

	import (
		"fmt"
	)

	func main() {{
		fmt.Println("Hello World")
	}}
	]],
	{}
)

local error_handle = fmt(
	[[
  if err != nil {{
    
  }}
  ]],
	{}
)

local boiler_snippet = s("!main", boiler)
local error_handle_snippet = s("!err", error_handle)
table.insert(snippets, boiler_snippet)
table.insert(snippets, error_handle_snippet)

return snippets, autosnippets
