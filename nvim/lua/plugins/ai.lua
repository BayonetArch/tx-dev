return {
	-- Code Companion with Groq AI
	{
		"olimorris/codecompanion.nvim",
		version = "^17.33.0",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("codecompanion").setup({
				adapters = {
					http = {
						groq = function()
							return require("codecompanion.adapters").extend("openai", {
								env = {
									api_key = "GROQ_API_KEY",
								},
								name = "Groq",
								url = "https://api.groq.com/openai/v1/chat/completions",
								schema = {
									model = {
										default = "openai/gpt-oss-120b",
									},
									max_tokens = {
										default = 8192,
									},
									temperature = {
										default = 0.1,
									},
								},
								handlers = {
									form_messages = function(self, messages)
										for i, msg in ipairs(messages) do
											if type(msg.content) == "table" then
												local content_text = ""
												for _, part in ipairs(msg.content) do
													if type(part) == "table" and part.text then
														content_text = content_text .. part.text
													elseif type(part) == "string" then
														content_text = content_text .. part
													end
												end
												msg.content = content_text
											end

											msg.id = nil
											msg.opts = nil

											if msg.name then
												msg.name = tostring(msg.name)
											else
												msg.name = nil
											end

											local supported_props = { role = true, content = true, name = true }
											for prop in pairs(msg) do
												if not supported_props[prop] then
													msg[prop] = nil
												end
											end
										end
										return { messages = messages }
									end,
								},
							})
						end,
					},
				},
				strategies = {
					chat = { adapter = "groq" },
					inline = { adapter = "groq" },
					agent = { adapter = "groq" },
				},
			})
		end,
	},

	-- Copilot
	{
		"zbirenbaum/copilot.lua",
		event = "InsertEnter",
		opts = {
			suggestion = {
				enabled = true,
				auto_trigger = true,
				keymap = {
					accept = "<M-a>",
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<M-d>",
				},
			},
			panel = { enabled = false },
		},
	},
}
