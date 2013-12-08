" Strip Trailing Whitespaces
" Maintainer:	Alex Johnson
" License: GPL(to be licensed)

noremap \sw :call <SID>HighlightAndStripWhitespaces()<cr>

function! s:HighlightAndStripWhitespaces()
  if search('\s\+$', 'n')
    highlight TrailingWhitespaces ctermbg=2
    match TrailingWhitespaces /\s\+$/
    redraw
    sleep 1
    call s:StripWhitespaces()
    match TrailingWhitespaces //
    echo 'Trailing whitespaces removed'
  else
    echo 'No trailing whitespaces found'
  endif
endfunction

function! s:StripWhitespacesForCurrentBuffer()
  if !exists('b:strip_whitespaces_on_save') || exists('b:strip_whitespaces_on_save') && b:strip_whitespaces_on_save
    call s:StripWhitespaces()
  endif
endfunction

function! s:StripWhitespaces()
  if search('\s\+$', 'n')
    normal! mq

    %s/\s\+$//

    normal! `q
  end
endfunction

if exists('g:strip_whitespaces_on_save') && g:strip_whitespaces_on_save
  autocmd! BufWritePre * :call <SID>StripWhitespacesForCurrentBuffer()
endif
