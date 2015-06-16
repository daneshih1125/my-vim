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
