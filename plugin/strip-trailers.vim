" Strip Trailing Whitespaces
" Maintainer:	Alex Johnson
" License:	GPL(to be licensed)          

noremap \sw :call <SID>HighlightAndStripWhitespaces()<cr>

function! s:HighlightAndStripWhitespaces()
  if search('\s\+$', 'n')
    normal! mq
    highlight TrailingWhitespaces ctermbg=2
    match TrailingWhitespaces /\s\+$/
    redraw
    sleep 1
    %s/\s\+$//
    match TrailingWhitespaces //
    normal! `q
    echo 'Trailing whitespaces removed'
  else
    echo 'No trailing whitespaces found' 
  endif
endfunction

if exists('g:strip_whitespaces_on_save') && g:strip_whitespaces_on_save
  autocmd! BufWritePre * :call <SID>HighlightAndStripWhitespaces()
endif
