local ls = require("luasnip")
local s = ls.s

local fmt = require("luasnip.extras.fmt").fmt

local snippets, autosnippets = {}, {}

local editorconfig = fmt(
	[[
[*]
charset = utf-8
indent_style = space
indent_size = 4
insert_final_newline = false
trim_trailing_whitespace = true

[*.{{json,yml,yaml}}]
indent_size = 2

[*.md]
trim_trailing_whitespace = false  ]],
	{}
)

local editorconfig_snippet = s("!editorconfig", editorconfig)
table.insert(snippets, editorconfig_snippet)

return snippets, autosnippets
