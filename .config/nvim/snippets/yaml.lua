local ls = require("luasnip")
local s = ls.s

local fmt = require("luasnip.extras.fmt").fmt

local snippets, autosnippets = {}, {}

local clang_format = fmt(
	[[
BasedOnStyle: LLVM
IndentWidth: 4
TabWidth: 4
UseTab: Never
ColumnLimit: 120
AllowShortFunctionsOnASingleLine: None
  ]],
	{}
)

local clang_fmt_snippet = s("!clangfmt", clang_format)
table.insert(snippets, clang_fmt_snippet)

return snippets, autosnippets
