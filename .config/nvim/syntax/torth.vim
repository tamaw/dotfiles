" Vim syntax file
"
" Language: Torth - A concatenative stack programming language by Thomas

if exists("b:current_syntax")
  finish
endif

setlocal iskeyword=@,+,*,-,.,48-57,60-62,_
setlocal comments=://
setlocal commentstring="// "
syntax case match

" Comments
syntax keyword torthTodo contained TODO FIXME XXX NOTE
syntax region torthComment start="//" end="$" keepend contains=torthTodo

" Type signatures
syntax match torthSigError contained /\<\S\+\>/
syntax keyword torthType contained no-return any i64 bool addr
syntax keyword torthSigSep contained --
syntax region torthSig start="( " end=" )" keepend contains=torthType,torthSigSep,torthSigError

" Strings
syntax region torthString start=/\(^\|\s\)"/ skip=/\v\\./ end=/\v"/

" Basic tokens
syntax keyword torthKeyword if then else endif while do loop proc endproc ret data enddata
syntax keyword torthKeyword extern export import
syntax match torthKeyword /ccall([01234])/
syntax keyword torthPrimitiveWord 2drop 2dup 2over 2swap divmod drop dup eputs exit hlt load8 load64 output over puts rot sar shl shr store8 store64 swap syscall1 syscall3
syntax keyword torthPrimitiveWord not invert and or xor
syntax match torthPrimitiveWord "\<\([+*=-]\|[<>]=\?\)\>"
syntax match torthWord "\<\.\*\>"
syntax match torthDecimalInteger "\<-\?\d\+\>"
syntax keyword torthPreInclude include
syntax keyword torthPreDefine define end
syntax keyword torthPreCond pre-if pre-endif
syntax keyword torthTraceKeyword traceon traceoff tracehere

syntax sync clear
syntax sync minlines=1 maxlines=10

hi def link torthTodo Todo
hi def link torthComment Comment
hi def link torthPreInclude PreProc
hi def link torthPreDefine PreProc
hi def link torthPreCond PreProc
hi def link torthPreExtern PreProc
hi def link torthTraceKeyword Statement
hi def link torthKeyword Keyword 
hi def link torthPrimitiveWord Function
hi def link torthWord Normal
hi def link torthDecimalInteger Number
hi def link torthString String
hi def link torthSig Keyword
hi def link torthSigSep Comment
hi def link torthType Type
hi def link torthSigError Error

let b:current_syntax = "torth"

" vim:ts=8 sw=4
