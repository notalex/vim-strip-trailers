" Learning Vim plugin
" Last Change: 18-06-2012
" Maintainer:	Alex Johnson
" License:	GPL(to be licensed)          

noremap \sw :call <SID>strip_whitespaces()<cr>

function! s:strip_whitespaces()
  try
    /\s\+$/
    set hlsearch
    redraw
    sleep 2
    set nohlsearch
    %s/\s\+$//
    echo 'Trailing whitespaces removed'
  catch
    echo 'No trailing whitespaces found' 
  endtry
endfunction
