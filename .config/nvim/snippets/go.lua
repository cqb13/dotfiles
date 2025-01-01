local ls = require("luasnip")
local s = ls.s
local i = ls.i
local t = ls.t

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
local boiler_snippet = s("!main", boiler)
table.insert(snippets, boiler_snippet)

return snippets, autosnippets
