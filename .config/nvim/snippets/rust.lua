local ls = require("luasnip")
local s = ls.snippet
local fmt = require("luasnip.extras.fmt").fmt

local snippets, autosnippets = {}, {}

local err = fmt(
	[[
  #[derive(Debug)]
  pub enum Error {{
      Error,
  }}
  
  impl core::fmt::Display for Error {{
      fn fmt(&self, fmt: &mut core::fmt::Formatter) -> core::result::Result<(), core::fmt::Error> {{
          write!(fmt, "{{self:?}}")
      }}
  }}
  
  impl std::error::Error for Error {{}}  ]],
	{}
)
local err_snippet = s("!err-enum", err)
table.insert(snippets, err_snippet)

return snippets, autosnippets
