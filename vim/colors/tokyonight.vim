" -----------------------------------------------------------------------------
" Name:         Tokyo Night
" Author:       Luis Zuniga
" License:      MIT
" -----------------------------------------------------------------------------

" Initialization: {{{
highlight clear
if exists('syntax_on')
  syntax reset
endif
set background=dark

let s:t_Co = exists('&t_Co') && !empty(&t_Co) && &t_Co > 1 ? &t_Co : 2
let s:tmux = executable('tmux') && $TMUX !=# ''

let g:colors_name = 'tokyonight'

" ---------------------------------------------------------------------
" Palette
" ---------------------------------------------------------------------
let s:bg         = '#1a1b26'
let s:bg_alt     = '#1d1f2d'
let s:bg_popup   = '#141520'
let s:bg_high    = '#202437'
let s:bg_visual  = '#1f253f'
let s:bg_select  = '#2e3347'
let s:border     = '#414868'
let s:line_nr    = '#484b5c'
let s:comment    = '#4d526b'
let s:fg         = '#c0caf5'
let s:fg_alt     = '#a9b1d6'
let s:white      = '#ffffff'
let s:blue       = '#7aa2f7'
let s:cyan       = '#7dcfff'
let s:green      = '#9ece6a'
let s:orange     = '#e08f68'
let s:yellow     = '#dec76e'
let s:yellow2    = '#e0af68'
let s:red        = '#f7768e'
let s:red_err    = '#f44747'
let s:warning    = '#d79a42'
let s:purple     = '#bb9af7'
let s:none 	 = 'NONE'

function! s:hi(group, fg, bg, attr, sp) abort
  let l:cmd = ['highlight', a:group]
  if a:fg !=# ''
    call add(l:cmd, 'guifg=' . a:fg)
  endif
  if a:bg !=# ''
    call add(l:cmd, 'guibg=' . a:bg)
  endif
  if a:attr !=# ''
    call add(l:cmd, 'gui=' . a:attr)
    call add(l:cmd, 'cterm=' . a:attr)
  endif
  if a:sp !=# ''
    call add(l:cmd, 'guisp=' . a:sp)
  endif
  execute join(l:cmd, ' ')
endfunction

" ---------------------------------------------------------------------
" UI
" ---------------------------------------------------------------------
call s:hi('Normal',       s:fg,      s:bg,        '',          '')
call s:hi('NormalFloat',  s:fg,      s:bg_popup,  '',          '')
call s:hi('ColorColumn',  '',        s:bg_high,   '',          '')
call s:hi('CursorLine',   '',        s:bg_high,   'NONE',      '')
call s:hi('CursorColumn', '',        s:bg_high,   'NONE',      '')
call s:hi('CursorLineNr', s:fg,      '',          'bold',      '')
call s:hi('LineNr',       s:line_nr, '',          '',          '')
call s:hi('SignColumn',   '',        s:bg,        '',          '')
call s:hi('EndOfBuffer',  s:bg,      s:bg,        '',          '')
call s:hi('VertSplit',    s:border,  s:bg,        '',          '')
call s:hi('WinSeparator', s:border,  s:bg,        '',          '')
call s:hi('StatusLine',   s:white,   s:bg_alt,    '',          '')
call s:hi('StatusLineNC', s:fg_alt,  s:bg_alt,    '',          '')
call s:hi('TabLine',      s:fg_alt,  s:bg_alt,    '',          '')
call s:hi('TabLineSel',   s:white,   s:bg,        'bold',      '')
call s:hi('TabLineFill',  s:bg,      s:bg,        '',          '')
call s:hi('Pmenu',        s:fg,      s:bg_popup,  '',          '')
call s:hi('PmenuSel',     s:fg,      s:bg_select, 'bold',      '')
call s:hi('PmenuSbar',    '',        s:bg_alt,    '',          '')
call s:hi('PmenuThumb',   '',        s:border,    '',          '')
call s:hi('Visual',       '',        s:bg_visual, '',          '')
call s:hi('VisualNOS',    '',        s:bg_visual, '',          '')
call s:hi('Search',       s:bg,      s:yellow2,   'bold',      '')
call s:hi('IncSearch',    s:bg,      s:orange,    'bold',      '')
call s:hi('CurSearch',    s:bg,      s:orange,    'bold',      '')
call s:hi('MatchParen',   s:fg,      '',          'underline', s:border)
call s:hi('Folded',       s:fg_alt,  s:bg_high,   '',          '')
call s:hi('FoldColumn',   s:line_nr, s:bg,        '',          '')
call s:hi('Conceal',      s:fg_alt,  '',          '',          '')
call s:hi('Whitespace',   s:border,  '',          '',          '')
call s:hi('SpecialKey',   s:border,  '',          '',          '')
call s:hi('NonText',      s:border,  '',          '',          '')
call s:hi('Directory',    s:blue,    '',          '',          '')
call s:hi('Title',        s:blue,    '',          'bold',      '')
call s:hi('Question',     s:blue,    '',          'bold',      '')

" Diagnostics
call s:hi('Error',        s:red_err, '',          'bold',      '')
call s:hi('ErrorMsg',     s:bg, '',          'bold',      '')
call s:hi('WarningMsg',   s:warning, '',          'bold',      '')
call s:hi('MoreMsg',      s:blue,    '',          '',          '')
call s:hi('ModeMsg',      s:fg,      '',          'bold',      '')

call s:hi('DiffAdd',      s:green,   '',          '',          '')
call s:hi('DiffChange',   s:yellow2, '',          '',          '')
call s:hi('DiffDelete',   s:purple,  '',          '',          '')
call s:hi('DiffText',     s:blue,    '',          'bold',      '')

" ---------------------------------------------------------------------
" Core syntax
" ---------------------------------------------------------------------
call s:hi('Comment',      s:comment, '',          '',          '')
call s:hi('Constant',     s:orange,  '',          '',          '')
call s:hi('String',       s:green,   '',          '',          '')
call s:hi('Character',    s:cyan,    '',          '',          '')
call s:hi('Number',       s:orange,  '',          '',          '')
call s:hi('Boolean',      s:cyan,    '',          '',          '')
call s:hi('Float',        s:orange,  '',          '',          '')
call s:hi('Identifier',   s:fg,      '',          '',          '')
call s:hi('Function',     s:blue,    '',          '',          '')
call s:hi('Statement',    s:red,     '',          '',          '')
call s:hi('Conditional',  s:purple,  '',          '',          '')
call s:hi('Repeat',       s:purple,  '',          '',          '')
call s:hi('Label',        s:yellow,  '',          '',          '')
call s:hi('Operator',     s:cyan,    '',          '',          '')
call s:hi('Keyword',      s:red,     '',          '',          '')
call s:hi('Exception',    s:red,     '',          '',          '')
call s:hi('PreProc',      s:red,     '',          '',          '')
call s:hi('Include',      s:purple,  '',          '',          '')
call s:hi('Define',       s:red,     '',          '',          '')
call s:hi('Macro',        s:blue,    '',          '',          '')
call s:hi('PreCondit',    s:red,     '',          '',          '')
call s:hi('Type',         s:red,  '',          '',          '')
call s:hi('StorageClass', s:red,     '',          '',          '')
call s:hi('Structure',    s:red,  '',          '',          '')
call s:hi('Typedef',      s:yellow,  '',          '',          '')
call s:hi('Special',      s:purple,  '',          '',          '')
call s:hi('SpecialChar',  s:cyan,    '',          '',          '')
call s:hi('Tag',          s:purple,  '',          '',          '')
call s:hi('Delimiter',    s:fg,      '',          '',          '')
call s:hi('SpecialComment', s:comment,'',         '',          '')
call s:hi('Debug',        s:red,     '',          '',          '')
call s:hi('Underlined',   s:red,     '',          'underline', '')
call s:hi('Ignore',       s:fg_alt,  '',          '',          '')
call s:hi('Todo',         s:orange,  '',          'bold',      '')

" ---------------------------------------------------------------------
" Language-specific refinements to better match the JSON
" ---------------------------------------------------------------------

" HTML / XML
hi! link htmlTag            Delimiter
hi! link htmlEndTag         Delimiter
hi! link htmlTagName        Tag
hi! link htmlArg            Function
hi! link xmlTag             Delimiter
hi! link xmlEndTag          Delimiter
hi! link xmlTagName         Tag
hi! link xmlAttrib          Function

" Markdown
call s:hi('markdownHeadingDelimiter', s:blue,   '', 'bold',      '')
call s:hi('markdownH1',               s:purple, '', 'bold',      '')
call s:hi('markdownH2',               s:purple, '', 'bold',      '')
call s:hi('markdownLinkText',         s:red,    '', 'underline', '')
call s:hi('markdownUrl',              s:blue,   '', 'underline', '')
call s:hi('markdownCode',             s:green,  '', '',          '')
call s:hi('markdownCodeDelimiter',    s:purple, '', '',          '')
call s:hi('markdownListMarker',       s:purple, '', '',          '')
call s:hi('markdownBlockquote',       s:comment,'', '',          '')
call s:hi('markdownItalic',           s:red,    '', 'italic',    '')
call s:hi('markdownBold',             s:orange, '', 'bold',      '')

" JSON
call s:hi('jsonKeyword',              s:purple, '', '',          '')
call s:hi('jsonQuote',                s:purple, '', '',          '')
call s:hi('jsonString',               s:green,  '', '',          '')
call s:hi('jsonBoolean',              s:cyan,   '', '',          '')
call s:hi('jsonNumber',               s:orange, '', '',          '')
call s:hi('jsonNull',                 s:cyan,   '', '',          '')

" Python-ish
call s:hi('pythonDecorator',          s:cyan,   '', '',          '')
call s:hi('pythonFunction',           s:blue,   '', '',          '')
call s:hi('pythonBuiltin',            s:cyan,   '', '',          '')
call s:hi('pythonOperator',           s:red,    '', '',          '')
call s:hi('pythonSelf',               s:yellow, '', '',          '')

