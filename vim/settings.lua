local home = os.getenv("HOME")

-- vim theme
require("catppuccin").setup({
  flavour = "mocha",
})

-- lsp
require('lspconfig').yamlls.setup {
  settings = {
    yaml = {
      validate = true,
      -- disable the schema store
      schemaStore = {
        enable = false,
        url = "",
      },
      -- manually select schemas
      schemas = {
        ['https://raw.githubusercontent.com/docker/compose/master/compose/config/compose_spec.json'] = 'docker-compose*.{yml,yaml}',
        ['https://json.schemastore.org/chart.json'] = 'Chart.yaml',
      }
    }
  }
}

-- gp.nvim
require('gp').setup({
  providers = {
    azure = {
      disable = false,
      endpoint = "https://$resource_name.openai.azure.com/openai/deployments/$deployment_name/chat/completions?api-version=2024-03-01-preview",
      secret = os.getenv("AZURE_OPENAI_API_KEY"),
    },
  },

	agents = {
		{
			provider = "azure",
			name = "AZ_ChatGPT4o",
			chat = true,
			command = false,
			model = { model = "gpt-4o", temperature = 1.1, top_p = 1 },
			system_prompt = require("gp.defaults").chat_system_prompt,
		},
		{
			provider = "azure",
			name = "AZ_CodeGPT4o",
			chat = false,
			command = true,
			model = { model = "gpt-4o", temperature = 0.8, top_p = 1 },
			system_prompt = require("gp.defaults").code_system_prompt,
		},
  },

	hooks = {
		Explain = function(gp, params)
			local template = "I have the following code from {{filename}}:\n\n"
				.. "```{{filetype}}\n{{selection}}\n```\n\n"
				.. "Please respond by explaining the code above."
			local agent = gp.get_chat_agent()
			gp.Prompt(params, gp.Target.popup, nil, agent.model, template, agent.system_prompt)
		end,
  }
})

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
-- zk
require("zk").setup()
require("zk.api").index(home.."/.local/share/instant-snippets")

local opts = { noremap=true, silent=false }
vim.api.nvim_set_keymap("n", "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>zf", "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>", opts)
