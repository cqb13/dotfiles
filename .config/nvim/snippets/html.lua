local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {}

local boiler = fmt(
	[[
  <!doctype html>
  <html lang="en">
    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      <meta name="keywords" content="" />
      <meta name="description" content="" />
      <meta name="author" content="Maksim Straus" />
      <link rel="icon" type="image/png" href="icon.png" />
      <title>{}</title>
      <link href="style.css" rel="stylesheet" />
    </head>
    <body>
      <footer>
        <a href="" target="_blank">{} | © 2024</a>
        <a href="https://github.com/cqb13" target="_blank"
          >Created by Maksim Straus</a
        >
      </footer>
      <script src="index.js"></script>
    </body>
  </html>  
  ]],
	{ i(1), rep(1) }
)
local boiler_snippet = s("!main", boiler)
table.insert(snippets, boiler_snippet)

return snippets, autosnippets
