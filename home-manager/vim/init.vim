" Options
set autoread
set autowrite
set nobackup
set noundofile

" Keymapping
imap jk <Esc>

" Autocmd
augroup RestoreLastCursorPosition
	autocmd!
	autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
augroup END

" vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
	silent execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	augroup AutoInstallVimPlug
		autocmd!
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	augroup END
endif
augroup AutoInstallMissingPlugins
	autocmd!
	autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)')) | PlugInstall --sync | source $MYVIMRC | endif
augroup END

call plug#begin()

Plug 'tpope/vim-sensible', { 'on': [] }
augroup LoadVimSensible
	autocmd!
	autocmd BufReadPost * call plug#load('vim-sensible') | autocmd! LoadVimSensible
augroup END

call plug#end()
