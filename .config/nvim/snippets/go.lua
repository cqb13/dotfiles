local ls = require("luasnip")
local s = ls.s
local i = ls.insert_node

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

local printf = fmt(
    [[
    fmt.Printf({})
    ]],
    {i(1)}
)

local println = fmt(
    [[
    fmt.Println({})
    ]],
    {i(1)}
)

local errorf = fmt(
    [[
    fmt.Errorf({})
    ]],
    {i(1)}
)

local boiler_snippet = s("!main", boiler)
local error_handle_snippet = s("!err", error_handle)
local printf_snippet = s("printf", printf)
local println_snippet = s("println", println)
local errorf_snippet = s("errorf", errorf)
table.insert(snippets, boiler_snippet)
table.insert(snippets, error_handle_snippet)
table.insert(snippets, printf_snippet)
table.insert(snippets, println_snippet)
table.insert(snippets, errorf_snippet)

return snippets, autosnippets
