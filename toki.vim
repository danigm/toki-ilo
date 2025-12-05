" Vim syntax file
" Language:     toki
" Maintainer:   Daniel Garcia Moreno <dani@danigm.net>
" Updaters:
" URL:          https://github.com/danigm/toki-ilo
" Changes:
" Last Change:  2025 Dec 05

" Based on qml syntax

syn keyword tokiTodo      TODO FIXME XXX TBD contained
syn match   tokiComment   "#.*$" contains=tokiTodo,@Spell
syn match   tokiSpecial   "\\\d\d\d\|\\."
syn region  tokiString    start=+"+  skip=+\\\\\|\\"\|\\$+  end=+"\|$+  contains=tokiSpecial,@htmlPreproc

syn match   tokiNumber    "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syn keyword tokiStatement nasin li nimi kama jo nextgroup=tokiFunction skipwhite
syn match   tokiFunction  "\h\w*" display contained

syn keyword tokiConditional la ante
syn keyword tokiOperator    e o en anu pini
syn keyword tokiStatement   lon ala
syn keyword tokiType        nanpa nimi jaki

hi def link tokiComment     Comment
hi def link tokiTodo        Todo
hi def link tokiString      String
hi def link tokiStatement   Statement
hi def link tokiNumber      Number
hi def link tokiFunction    Function
hi def link tokiConditional Conditional
hi def link tokiOperator    Operator
hi def link tokiType        Type

let b:current_syntax = "toki"

" vim: ts=8
