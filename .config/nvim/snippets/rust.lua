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

local args = fmt(
	[[
  use std::env;
  
  fn main() {{
      let args: Vec<String> = env::args().collect();
  }}
  ]],
	{}
)

local err_snippet = s("!err-enum", err)
local args_snippet = s("!args-setup", args)
table.insert(snippets, err_snippet)
table.insert(snippets, args_snippet)

return snippets, autosnippets
