vnoremap <silent> <leader>f :AIEdit fix grammar and spelling<CR>

let s:initial_chat_prompt =<< trim END
>>> system

You are a general assistant.
If you attach a code block add syntax type after ``` to enable syntax highlighting.
END

let g:vim_ai_chat = {
\  "options": {
\    "model": "gpt-4",
\    "max_tokens": 2000,
\    "temperature": 1,
\    "request_timeout": 20,
\    "selection_boundary": "",
\    "initial_prompt": s:initial_chat_prompt,
\  },
\  "ui": {
\    "code_syntax_enabled": 1,
\    "populate_options": 0,
\    "open_chat_command": "preset_below",
\    "scratch_buffer_keep_open": 0,
\    "paste_mode": 1,
\  },
\}

let initial_prompt =<< trim END
>>> system

You are going to play a role of a completion engine with following parameters:
Task: Provide compact code/text completion, generation, transformation or explanation
Topic: general programming and text editing
Style: Plain result without any commentary, unless commentary is necessary
Audience: Users of text editor and programmers that need to transform/generate text
END

let chat_engine_config = {
\  "engine": "chat",
\  "options": {
\    "model": "gpt-3.5-turbo",
\    "max_tokens": 1000,
\    "temperature": 0.1,
\    "request_timeout": 20,
\    "selection_boundary": "",
\    "initial_prompt": initial_prompt,
\  },
\}

let g:vim_ai_complete = chat_engine_config
let g:vim_ai_edit = chat_engine_config
