local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

local snippets, autosnippets = {}, {}

local equals = fmt(
	[[
  @Override
  public boolean equals(Object other) {{
    if (other instanceof {}) {{
      return ();
    }}

    return false;
  }}  
  ]],
	{ i(1) }
)
local equals_snippet = s("!equals", equals)
table.insert(snippets, equals_snippet)

return snippets, autosnippets
