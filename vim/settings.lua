local home = os.getenv("HOME")

-- which-key
require("which-key").setup({
  preset = "helix",
  keys = {
    scroll_down = "<c-j>", -- binding to scroll down inside the popup
    scroll_up = "<c-k>", -- binding to scroll up inside the popup
  },
})

vim.keymap.set("n", "<C-g>", function()
  require("which-key").show({ global = false })
end, { desc = "Buffer Local Keymaps (which-key)" })

-- vim theme
require("catppuccin").setup({
  flavour = "mocha",
})

-- telescope
require('telescope').setup({
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
})
require('telescope').load_extension('fzf')

-- lsp
require('lspconfig').pyright.setup{}

-- github/copilot
vim.cmd [[
  augroup copilot_disable
    autocmd!
    autocmd VimEnter * lua DisableCopilot()
  augroup END
]]

function DisableCopilot()
    if vim.fn.exists(':Copilot') == 2 then
        vim.cmd('Copilot disable')
    end
end
