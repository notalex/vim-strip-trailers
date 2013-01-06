" Strip Trailing Whitespaces
" Maintainer:	Alex Johnson
" License:	GPL(to be licensed)          

noremap \sw :call <SID>strip_whitespaces()<cr>

function! s:strip_whitespaces()
  if search('\s\+$', 'n')
    highlight TrailingWhitespaces ctermbg=2
    match TrailingWhitespaces /\s\+$/
    redraw
    sleep 1
    %s/\s\+$//
    match TrailingWhitespaces //
    echo 'Trailing whitespaces removed'
  else
    echo 'No trailing whitespaces found' 
  endif
endfunction
