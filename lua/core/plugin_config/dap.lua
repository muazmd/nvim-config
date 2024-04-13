--require("dapui").setup()
--require("dap-go").setup()
local dap = require("dap")


dap.configurations.go = {
	{
		type = "go",
		name = "Debug",
		request = "launch",
		program = "${file}"
	},
}


vim.keymap.set('n', '<F5>', dap.continue() )
vim.keymap.set('n', '<F10>', dap.step_over())
vim.keymap.set('n', '<F11>',dap.step_into())
vim.keymap.set('n', '<F12>', dap.step_out())
vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint() )
vim.keymap.set('n', '<Leader>B', dap.set_breakpoint() )

