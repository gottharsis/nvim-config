" Colorscheme generated by https://github.com/arcticlimer/djanho
highlight clear

function s:highlight(group, bg, fg, style)
  let gui = a:style == '' ? '' : 'gui=' . a:style
  let fg = a:fg == '' ? '' : 'guifg=' . a:fg
  let bg = a:bg == '' ? '' : 'guibg=' . a:bg
  exec 'hi ' . a:group . ' ' . bg . ' ' . fg  . ' ' . gui
endfunction

let s:Color9 = '#3b6e78'
let s:Color11 = '#737c8c'
let s:Color3 = '#53df83'
let s:Color8 = '#262D35'
let s:Color1 = '#56b6c2'
let s:Color10 = '#495162'
let s:Color0 = '#f8f8f0'
let s:Color2 = '#606F73'
let s:Color4 = '#e74c3c'
let s:Color5 = '#9cd230'
let s:Color7 = '#9da5b4'
let s:Color12 = '#1B1F23'
let s:Color6 = '#21272e'

call s:highlight('Identifier', '', s:Color0, '')
call s:highlight('Constant', '', s:Color1, '')
call s:highlight('Comment', '', s:Color2, '')
call s:highlight('String', '', s:Color3, '')
call s:highlight('Function', '', s:Color4, '')
call s:highlight('Type', '', s:Color4, '')
call s:highlight('Type', '', s:Color5, '')
call s:highlight('Keyword', '', s:Color4, '')
call s:highlight('Comment', '', '', 'italic')
call s:highlight('StatusLine', s:Color7, s:Color6, '')
call s:highlight('WildMenu', s:Color6, s:Color0, '')
call s:highlight('Pmenu', s:Color6, s:Color0, '')
call s:highlight('PmenuSel', s:Color0, s:Color8, '')
call s:highlight('PmenuThumb', s:Color6, s:Color0, '')
call s:highlight('Normal', s:Color6, s:Color0, '')
call s:highlight('Visual', s:Color9, '', '')
call s:highlight('CursorLine', s:Color9, '', '')
call s:highlight('ColorColumn', s:Color9, '', '')
call s:highlight('SignColumn', s:Color6, '', '')
call s:highlight('LineNr', '', s:Color10, '')
call s:highlight('TabLine', s:Color12, s:Color11, '')
call s:highlight('TabLineSel', s:Color0, s:Color8, '')
call s:highlight('TabLineFill', s:Color12, s:Color11, '')
call s:highlight('TSPunctDelimiter', '', s:Color0, '')

highlight! link TSOperator Operator
highlight! link TSFuncMacro Macro
highlight! link TSTagDelimiter Type
highlight! link TSFloat Number
highlight! link Repeat Conditional
highlight! link TSPunctSpecial TSPunctDelimiter
highlight! link TSNumber Number
highlight! link TSField Constant
highlight! link TSConstant Constant
highlight! link TSComment Comment
highlight! link TSLabel Type
highlight! link TSTag MyTag
highlight! link TSParameter Constant
highlight! link TSProperty TSField
highlight! link Conditional Operator
highlight! link TSFunction Function
highlight! link TSParameterReference TSParameter
highlight! link NonText Comment
highlight! link TSPunctBracket MyTag
highlight! link Whitespace Comment
highlight! link TSConstBuiltin TSVariableBuiltin
highlight! link TelescopeNormal Normal
highlight! link CursorLineNr Identifier
highlight! link TSRepeat Repeat
highlight! link Macro Function
highlight! link Folded Comment
highlight! link TSString String
highlight! link TSNamespace TSType
highlight! link TSKeyword Keyword
highlight! link TSType Type
highlight! link Operator Keyword
highlight! link TSConditional Conditional