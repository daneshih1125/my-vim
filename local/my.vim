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
Plugin 'kergoth/vim-bitbake'
Plugin 'Valloric/YouCompleteMe'
Plugin 'IN3D/vim-raml'
Plugin 'Yggdroot/indentLine'
Plugin 'elzr/vim-json'
Plugin 'moll/vim-node'
Plugin 'kchmck/vim-coffee-script'
Plugin 'davidhalter/jedi-vim'
Plugin 'fatih/vim-go'


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

function TabExpandNot()
  set shiftwidth=8
  set softtabstop=8
  set tabstop=8
  set expandtab!
  set autoindent!
endfunction

command -nargs=1 TabExpand call TabExpand(<f-args>)
command TabExpandNot call TabExpandNot()

" git diff current file with another branch.
" open the diff in horizontal window.
function GitDiffBranch(branch)
  let tmp_diff_file = "/tmp/" . substitute(bufname("%"), "/", "-", "g") . "-" .a:branch . ".diff"
  let diff_cmd = "git diff " . a:branch . " " . bufname("%")
  let cmd_out = system(diff_cmd)
  let cmd_res = v:shell_error
  if cmd_res == "0"
    let diff_cmd = "git diff " . a:branch . " " . bufname("%") . " >". tmp_diff_file
    let cmd_out = system(diff_cmd)
    exec "sp ". tmp_diff_file
  else
    echo "No such branch or file"
  endif
endfunction

command -nargs=1 GitDiffBranch call GitDiffBranch(<f-args>)

set nu
" auto comment
set formatoptions=cro
set comments=sl:/*,mb:\ *,elx:\ */
" line
set cursorline

"
set pastetoggle=<F2>
set hlsearch

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

" cscope include all library headers
if filereadable("/usr/include/include.cs")
  cs add /usr/include/include.cs
endif

endif

" Tag list shortcut
let Tlist_WinWidth = 40
map <f9> :Tlist<CR>
map th :TlistHighlightTag<CR>
" ctags shortcut
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

if filereadable($HOME . "/.vim/local/tab.vim")
  exec "source " . $HOME . "/.vim/local/tab.vim"
endif

highlight ExtraWhitespace ctermbg=red guibg=red
map <F12> : match ExtraWhitespace /\s\+$/<CR>
map <C-F12> : %s/\s\+$//<CR>

set encoding=utf-8
let g:vim_json_syntax_conceal = 0
let g:go_def_mapping_enabled = 0
let g:jedi#completions_command = "<C-N>"

" add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
