-- vim theme
require("catppuccin").setup({
  flavour = "mocha",
})

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
