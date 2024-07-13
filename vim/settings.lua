-- gp.nvim
local config = {
  -- openai = {
  --   endpoint = "https://api.openai.com/v1/chat/completions",
  --   secret = os.getenv("OPENAI_API_KEY"),
  -- },
  azure = {
    endpoint = "https://$resource_name.openai.azure.com/openai/deployments/$deployment_name/chat/completions?api-version=2024-03-01-preview",
    secret = os.getenv("AZURE_OPENAI_API_KEY"),
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
}

require('gp').setup(config)

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
