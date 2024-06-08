-- gp.nvim
local config = {
	openai_api_key = os.getenv("OPENAI_API_KEY"),
	openai_api_endpoint = "https://api.openai.com/v1/chat/completions",

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
