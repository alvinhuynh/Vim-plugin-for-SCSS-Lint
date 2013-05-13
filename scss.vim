"============================================================================== 
" File:          scss.vim
" Author:        Alvin Huynh (ahuynh@linkedin.com)
" Version:       0.1
" Description:   SCSS Lint plugin for vim. 
" Last Modified: May 8, 2013
"==============================================================================
 

" Check that this plugin only gets loaded once.
if exists("g:scss_lint_vim")
  finish
endif

" Set global variable to ensure plugin is only loaded once.
let g:scss_lint_vim = "true"

" Call init function when when reading a file with an scss extension.
autocmd BufRead *.scss call s:init()

" Init function that handles calling the scss lint function
" when a file is either saved or written to.
function! s:init()
	augroup scssLint
		autocmd BufWritePost,FileWritePost <buffer> call SCSSLint()
	augroup END
endfunction

" Run scsslint command on the current file opened.
function! SCSSLint()
  let current_file = shellescape(expand('%s:p'))
  let cmd = "scsslint " . current_file
  let output = system(cmd)
  echo output
endfunction
