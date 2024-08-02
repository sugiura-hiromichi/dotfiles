local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	}
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup 'plugins'
require 'user_defined'

function MyStl()
	return (require('hydra.statusline').get_name() or vim.api.nvim_get_mode()['mode'])
		.. ' %f'
		.. require('nvim-navic').get_location()
		.. '%=%Y %l:%c'
end

vim.o.statusline = '%{%v:lua.MyStl()%}'
vim.opt.fo = { j = true }
vim.opt.shiftwidth = 3
vim.opt.tabstop = 3
vim.opt.softtabstop = 3
vim.opt.fileencoding = 'utf-8'
vim.opt.list = true
vim.opt.listchars = { tab = '| ' }
vim.opt.pumblend = 22
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.autowriteall = true
vim.opt.clipboard:append { 'unnamedplus' }
vim.opt.autochdir = true
vim.opt.laststatus = 3
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

if vim.fn.expand '%:p' == '' then
	vim.cmd [[e $MYVIMRC]]
end

-- #fa0b1c #2048ab #48eb0c #f7f7f7 #3c4c55
