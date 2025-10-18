" OPTIONS
set autoread
set backspace=indent,eol,start
set number
set relativenumber
set cursorline
set colorcolumn=80
set background=dark
set termguicolors
set noswapfile
set nobackup
set nowritebackup
set noundofile

" KEYBINDINGS
imap jk <Esc>

" AUTOCMD
augroup restore_last_position
	autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
				\| execute "normal! g`\""
				\| endif
				\| autocmd! restore_last_position
augroup END


" PLUGINS
if empty(glob('~/.vim/autoload/plug.vim'))
	silent execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync
				\| source $MYVIMRC
endif
augroup install_missing_pkgs
	autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
				\| PlugInstall --sync
				\| source $MYVIMRC
				\| endif
				\| autocmd! install_missing_pkgs
augroup END

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-commentary', { 'on': [] }
augroup tool_commentary
	autocmd!
	autocmd BufReadPost * call plug#load('vim-commentary')
				\| autocmd! tool_commentary
augroup END

Plug 'LunarWatcher/auto-pairs', { 'on': [] }
augroup tool_autopairs
	autocmd!
	autocmd InsertEnter * call plug#load('auto-pairs')
				\| autocmd! tool_autopairs
augroup END

call plug#end()
