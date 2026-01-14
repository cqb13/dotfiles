local ls = require("luasnip")
local s = ls.s

local fmt = require("luasnip.extras.fmt").fmt

local snippets, autosnippets = {}, {}

local make = fmt(
	[[
SRC_DIR = src 
BUILD_DIR = build
OBJ_DIR = $(BUILD_DIR)/obj
CC = clang
CFLAGS = -Wall -O0 -g

SRCS = $(shell find $(SRC_DIR) -name "*.c")
OBJS = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRCS))

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: build-main
build-main: build-dir $(OBJS)
	$(CC) $(CFLAGS) -o $(BUILD_DIR)/main $(OBJS)

.PHONY: build-dir
build-dir:
	@mkdir -p $(BUILD_DIR)

.PHONY: check
check:
	@which $(CC) > /dev/null && echo "SUCCESS: $(CC) is installed" || echo "ERROR: $(CC) not found, please install clang"

.PHONY: run
run: build-main
	./$(BUILD_DIR)/main

.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)
  ]],
	{}
)

local make_snippet = s("!make", make)
table.insert(snippets, make_snippet)

return snippets, autosnippets
