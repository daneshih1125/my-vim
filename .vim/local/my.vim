set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.Vim
set rtp+=~/.vim/bundle/vundle
"let path='~/.vim/bundle'
 call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

Plugin 'Command-T'
Plugin 'vim-scripts/AnsiEsc.vim'
Plugin 'vim-scripts/python.vim'
Plugin 'cscope_macros.vim'
Plugin 'taglist.vim'
Plugin 'ivanov/vim-ipython'



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" reference 
" http://vim.wikia.com/wiki/Converting_tabs_to_spaces
" http://vim.wikia.com/wiki/Write_your_own_Vim_function
" http://learnvimscriptthehardway.stevelosh.com/chapters/23.html
" insert numbers of space characters whenever the tab key is pressed.
function TabExpand(space)
  let snumber=a:space 
  echom "set tab is "snumber
  let &shiftwidth=a:space
  let &softtabstop=a:space
  let &tabstop=a:space
  set expandtab
  set autoindent
  set shiftwidth?
  set softtabstop?
  set tabstop?
endfunction

set nu
" auto comment
set formatoptions=cro
set comments=sl:/*,mb:\ *,elx:\ */
" line
set cursorline

" my mapping key that search result of cscope search will display in currrent
" window
if has("cscope")
  nmap cs :cs find s <C-R>=expand("<cword>")<CR><CR>
  nmap cg :cs find g <C-R>=expand("<cword>")<CR><CR>
  nmap cc :cs find c <C-R>=expand("<cword>")<CR><CR>
  nmap ct :cs find t <C-R>=expand("<cword>")<CR><CR>
  nmap ce :cs find e <C-R>=expand("<cword>")<CR><CR>
  nmap cf :cs find f <C-R>=expand("<cfile>")<CR><CR>
  nmap ci :cs find i <C-R>=expand("<cfile>")<CR><CR>
  nmap cd :cs find d <C-R>=expand("<cword>")<CR><CR>
endif
