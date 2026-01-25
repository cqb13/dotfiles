return {
    "OXY2DEV/markview.nvim",
    lazy = false,
    config = function()
        local keymap = vim.keymap

        keymap.set("n", "<leader>ms", "<cmd>Markview splitToggle<cr>", {desc = "Toggle markdown split preview"} )
    end
};
