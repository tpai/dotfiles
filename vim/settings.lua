local home = os.getenv("HOME")

-- vim theme
require("catppuccin").setup({
  flavour = "mocha",
})

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
