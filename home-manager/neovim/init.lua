-- OPTIONS
vim.opt.autoread = true
vim.opt.autowrite = false
vim.opt.colorcolumn = "80"

-- KEYBINGINDS
vim.keymap.set("i", "jk", "<Esc>", { desc = "Back to normal mode" })

-- AUTOCMD
vim.api.nvim_create_autocmd("BufReadPost", {
	group = vim.api.nvim_create_augroup("restore_last_position", { clear = true }),
	pattern = "*",
	callback = function()
		local last_line = vim.fn.line("'\"")
		local total_lines = vim.fn.line("$")
		if last_line > 1 and last_line <= total_lines then
			vim.api.nvim_command('normal! g`"')
		end
	end,
})

-- PLUGINS
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	spec = {
		-- LazyVim
		{
			"LazyVim/LazyVim",
			import = "lazyvim.plugins",
			opts = {
				colorscheme = "tokyonight-night",
			},
		},
		{ import = "lazyvim.plugins.extras.coding.luasnip" },
		{ import = "lazyvim.plugins.extras.dap.core" },
		{ import = "lazyvim.plugins.extras.editor.aerial" },
		{ import = "lazyvim.plugins.extras.editor.illuminate" },
		{ import = "lazyvim.plugins.extras.editor.navic" },
		{ import = "lazyvim.plugins.extras.editor.neo-tree" },
		{ import = "lazyvim.plugins.extras.editor.overseer" },
		{ import = "lazyvim.plugins.extras.editor.refactoring" },
		{ import = "lazyvim.plugins.extras.editor.refactoring" },
		{ import = "lazyvim.plugins.extras.editor.snacks_explorer" },
		{ import = "lazyvim.plugins.extras.editor.snacks_picker" },
		{ import = "lazyvim.plugins.extras.formatting.black" },
		{ import = "lazyvim.plugins.extras.formatting.prettier" },
		{ import = "lazyvim.plugins.extras.lang.clangd" },
		-- { import = "lazyvim.plugins.extras.lang.cmake" },
		-- { import = "lazyvim.plugins.extras.lang.json" },
		-- { import = "lazyvim.plugins.extras.lang.makrdown" },
		-- { import = "lazyvim.plugins.extras.lang.nix" },
		-- { import = "lazyvim.plugins.extras.lang.python" },
		-- { import = "lazyvim.plugins.extras.lang.r" },
		-- { import = "lazyvim.plugins.extras.lang.sql" },
		-- { import = "lazyvim.plugins.extras.lang.toml" },
		-- { import = "lazyvim.plugins.extras.lang.typescript" },
		-- { import = "lazyvim.plugins.extras.lang.yaml" },
		-- { import = "lazyvim.plugins.extras.linting.eslint" },
		{ import = "lazyvim.plugins.extras.lsp.none-ls" },
		{ import = "lazyvim.plugins.extras.test.core" },
		{ import = "lazyvim.plugins.extras.ui.treesitter-context" },

		-- AstroNvim
		-- {
		-- 	"AstroNvim/AstroNvim",
		-- 	version = "^5",
		-- 	import = "astronvim.plugins",
		-- },
		-- { "AstroNvim/astrocommunity" },
		-- { import = "astrocommunity.bars-and-lines.dropbar-nvim" },
		-- { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
		-- { import = "astrocommunity.bars-and-lines.statuscol-nvim" },
		-- { import = "astrocommunity.bars-and-lines.vim-illuminate" },
		-- { import = "astrocommunity.code-runner.overseer-nvim" },
		-- { import = "astrocommunity.comment.ts-comments-nvim" },
		-- { import = "astrocommunity.debugging.nvim-dap-repl-highlights" },
		-- { import = "astrocommunity.debugging.nvim-dap-view" },
		-- { import = "astrocommunity.debugging.nvim-dap-virtual-text" },
		-- { import = "astrocommunity.diagnostics.trouble-nvim" },
		-- { import = "astrocommunity.editing-support.bigfile-nvim" },
		-- { import = "astrocommunity.editing-support.nvim-treesitter-context" },
		-- { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
		-- { import = "astrocommunity.editing-support.refactoring-nvim" },
		-- { import = "astrocommunity.editing-support.todo-comments-nvim" },
		-- { import = "astrocommunity.file-explorer.oil-nvim" },
		-- { import = "astrocommunity.indent.snacks-indent-hlchunk" },
		-- { import = "astrocommunity.lsp.lsp-signature-nvim" },
		-- { import = "astrocommunity.lsp.lspsaga-nvim" },
		-- { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },
		-- { import = "astrocommunity.motion.vim-matchup" },
		-- { import = "astrocommunity.pack.cpp" },
		-- { import = "astrocommunity.pack.eslint" },
		-- { import = "astrocommunity.pack.html-css" },
		-- { import = "astrocommunity.pack.json" },
		-- { import = "astrocommunity.pack.lua" },
		-- { import = "astrocommunity.pack.markdown" },
		-- { import = "astrocommunity.pack.nix" },
		-- { import = "astrocommunity.pack.prettier" },
		-- { import = "astrocommunity.pack.python" },
		-- { import = "astrocommunity.pack.sql" },
		-- { import = "astrocommunity.pack.toml" },
		-- { import = "astrocommunity.pack.typescript-all-in-one" },
		-- { import = "astrocommunity.pack.xml" },
		-- { import = "astrocommunity.pack.yaml" },
		-- { import = "astrocommunity.programming-language-support.csv-vim" },
		-- { import = "astrocommunity.scrolling.neoscroll-nvim" },
		-- { import = "astrocommunity.scrolling.nvim-scrollbar" },
		-- { import = "astrocommunity.utility.neodim" },
	},
})
