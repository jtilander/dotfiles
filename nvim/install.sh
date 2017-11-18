#!/bin/bash
#
# Installs a full NeoVim config and installation
#

# Because we assume you installed it with Brew.
if [ "$(uname -s)" = "Darwin" ]; then
	if [ ! -f /usr/local/bin/vim ]; then
		ln -s /usr/local/bin/nvim /usr/local/bin/vim
	fi
fi

if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
	curl -SsfLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

#pip --no-cache-dir --disable-pip-version-check install neovim
#pip3 --no-cache-dir --disable-pip-version-check install neovim

if [ ! -d ~/.config/nvim ]; then
	mkdir -p ~/.config/nvim
fi


if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
	curl -SsfLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# if [ ! -d ~/.config/nvim/bundles ]; then
#     curl -SsL https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/installer.sh
#     chmod a+x /tmp/installer.sh
#     mkdir -p ~/.config/nvim/bundles
#     /tmp/installer.sh ~/.config/nvim/bundles
# fi

# Run installation
nvim --headless -c "PlugInstall" -c "UpdateRemotePlugins" -c "qa!" > /dev/null 2>&1


# if [ ! -f ~/.config/nvim/init.vim ]; then
# 	ln -s ~/.dotfiles/nvim/init.vim ~/.config/nvim/init.vim 
# fi

cat ~/.config/nvim/init.vim  <<EOF

"
"
"
"
"
"


" ----------------------------------------------------------------------------
"
" Install plugins
"
" ----------------------------------------------------------------------------

	call plug#begin('~/.config/nvim/plugged')
		" Colors
		Plug 'tomasr/molokai'

		" File browser
		Plug 'scrooloose/nerdtree'

		" Airline (nicer status bar)
		Plug 'vim-airline/vim-airline'
		Plug 'vim-airline/vim-airline-themes'
		
		" Puppet
		Plug 'rodjek/vim-puppet'
		Plug 'puppetlabs/puppet-syntax-vim'
		
		" Python
		" Plug 'zchee/deoplete-jedi'
		
		" Git helpers
		Plug 'tpope/vim-fugitive'
		Plug 'airblade/vim-gitgutter'

		" Searching 
		Plug 'ervandew/ag'
		Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

		" Code completeion
		" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
		" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

		" Code formatting
		" Plug 'rhysd/vim-clang-format'

		" Rainbow parantheses
		Plug 'luochen1990/rainbow'

	call plug#end()


" ----------------------------------------------------------------------------
"
" Some sane defaults
"
" ----------------------------------------------------------------------------
	syntax on

	set autoindent
	set autoread
	set backspace=indent,eol,start
	set visualbell
	set backup
	set clipboard=unnamed
	set directory-=.
	set encoding=utf-8
	set expandtab
	set ignorecase
	set incsearch
	set laststatus=2
	set list
	set listchars=tab:▸\ ,trail:▫
	" set relativenumber
	set number
	set ruler
	set scrolloff=3
	set shiftwidth=4
	set splitbelow splitright
	set showcmd
	set smartcase
	set undofile
	set softtabstop=4
	set tabstop=4
	set wildignore=log/**,node_modules/**,target/**,tmp/**
	set wildmenu
	set wildmode=longest,list,full
	set whichwrap+=<,>,h,l,[,]
	"set inccommand=nosplit
	"set lazyredraw



" ----------------------------------------------------------------------------
"
" Formatting bindings
"
" ----------------------------------------------------------------------------

	" Indent same level as previous line
	set smartindent
	set autoindent
	set sw=4

	" Text wrap options (disable text-wrap) {
		set textwidth=0 
		set wrapmargin=0
		set formatoptions-=t
		set nowrap
	"}

	" Format overrides based on file type
	au FileType javascript setl sw=2 sts=2 et
	au FileType python set tabstop=4|set shiftwidth=4|set expandtab
	au FileType ruby set tabstop=2|set shiftwidth=2|set expandtab
	au Filetype typescript setlocal ts=2 sw=2 expandtab

	" md files are markdown
	au BufRead,BufNewFile *.md set filetype=markdown
	au BufRead,BufNewFile *.md set spell
	au BufRead,BufNewFile *.tex set spell

	" Automatically trim EOL whitespace when editing ruby/erlang code 
	au FileType ruby autocmd BufWritePre * :%s/\s\+$//e
	au FileType erlang autocmd BufWritePre * :%s/\s\+$//e


" ----------------------------------------------------------------------------
"
" Plugin configuration
"
" ----------------------------------------------------------------------------

	" NERDTree {
		" Automatically show NERDTree if no files are specified when
		" launching vim 
		autocmd StdinReadPre * let s:std_in=1
		autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
		set splitright

		map <F2> :NERDTreeToggle<CR>

		" Case-sensitive sorting
		let g:NERDTreeCaseSensitiveSort = 1
	" }

	" puppet {
		" Enable syntax highlighting for puppet modules.
		autocmd BufNewFile,BufRead *.pp set syntax=puppet
		autocmd BufNewFile,BufRead *.pp set autoread
		autocmd BufNewFile,BufRead *.pp setfiletype puppet
	" }
	
	" python {
		let g:deoplete#sources#jedi#show_docstring = 1
		let g:neomake_python_enabled_makers = ['flake8']
		au FileType python au! BufWritePost * Neomake
	" }


	" Solarized color scheme {
		let g:solarized_termcolors=256
		let g:solarized_termtrans=1
		set background=dark
		colorscheme molokai
	" }

	" Molokai color scheme {
		let g:rehash256 = 1

	" }

	" Airline {
		let g:airline_theme='molokai'
		let g:airline_powerline_fonts = 1
		let g:airline#extensions#tabline#enabled = 1
	" }

	" Vim gutter {
		set signcolumn=yes
		" color the gutter with solarized-dark
		highlight SignColumn ctermbg=8
	"}

	" Rainbox {
		let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
	" }

" ----------------------------------------------------------------------------
"
" Keyboard bindings
"
" ----------------------------------------------------------------------------

	nnoremap <C-p> :FZF<CR>
	nnoremap <C-f> :Ag 
	nnoremap <F7> :make<CR>
	nnoremap <F8> :cnext<CR>
	nnoremap <F12> :copen<CR>
	nnoremap <M-ESC> :q<CR>


" Special handling for CTRL-s
	map <C-s> :w <CR> :echo "Saved" <CR>
	imap <C-s> <Esc> :w <CR> :echo "Saved" <CR> i

	" Allow us to use Ctrl-s and Ctrl-q as keybinds
	silent !stty -ixon

	" Restore default behaviour when leaving Vim.
	autocmd VimLeave * silent !stty ixon

EOF

