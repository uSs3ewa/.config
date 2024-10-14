return {
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		keys = {
			"<leader>Du",
			"<leader>DU",
		},
		config = function()
			print("dap")
			local dapui = require("dapui")

			dapui.setup()

			local dap, dapui = require("dap"), require("dapui")
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			vim.keymap.set("n", "<leader>Du", function()
				dapui.toggle({ layout = 2 })
			end, {
				desc = "Toggle Simple Debug ui, I mainly use it to run tests",
			})

			vim.keymap.set("n", "<leader>DU", function()
				dapui.toggle()
			end, {
				desc = "Toggle Full Debug ui",
			})
		end,
	},
}
