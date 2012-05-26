" Markdown Helper - Fast insert markdown tags in Vim
" Maintainer : Xu Xiaodong <xxdlhy@gmail.com>
" Modified   : 2012 May 26
" License    : MIT

if exists("g:loaded_markdownhelper")
  finish
endif

let g:loaded_markdownhelper = 1

" setext or atx
let g:markdownheader_style = "setext"

" User commands
command! MdHeader1 call MdHeader(1)
command! MdHeader2 call MdHeader(2)
command! MdHeader3 call MdHeader(3)
command! MdHeader4 call MdHeader(4)
command! MdHeader5 call MdHeader(5)
command! MdHeader6 call MdHeader(6)

" Maps
noremap <Leader>h1 <esc>:call MdHeader(1)<cr>
noremap <Leader>h2 <esc>:call MdHeader(2)<cr>
noremap <Leader>h3 <esc>:call MdHeader(3)<cr>
noremap <Leader>h4 <esc>:call MdHeader(4)<cr>
noremap <Leader>h5 <esc>:call MdHeader(5)<cr>
noremap <Leader>h6 <esc>:call MdHeader(6)<cr>

" Process markdown header
function! MdHeader(level)
  let row = line(".")
  let text = getline(row)
  let length = strlen(text)

  if a:level == 1
    if g:markdownheader_style == "setext"
      let header = repeat("=", length)
      call append(row, header)
    else
      let header = "# " . text . " #"
      call setline(row, header)
    endif
  elseif a:level == 2
    if g:markdownheader_style == "setext"
      let header = repeat("-", length)
      call append(row, header)
    else
      let header = "## " . text . " ##"
      call setline(row, header)
    endif
  elseif a:level == 3
    let header = "### " . text . " ###"
    call setline(row, header)
  elseif a:level == 4
    let header = "#### " . text . " ####"
    call setline(row, header)
  elseif a:level == 5
    let header = "##### " . text . " #####"
    call setline(row, header)
  elseif a:level == 6
    let header = "###### " . text . " ######"
    call setline(row, header)
  endif
endfunction
