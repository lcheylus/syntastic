"============================================================================
"File:        solc.vim
"Description: Solidity syntax checker - using solc
"Maintainer:  Jacob Cholewa <jacob@cholewa.dk>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================

if exists('g:loaded_syntastic_solidity_solc_checker')
    finish
endif
let g:loaded_syntastic_solidity_solc_checker = 1

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_solidity_solc_GetLocList() dict
    let makeprg = self.makeprgBuild({})

    let errorformat =
        \ '%f:%l:%c: %trror: %m,' .
        \ '%f:%l:%c: %tarning: %m'

    return SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'solidity',
    \ 'name': 'solc'})

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set sw=4 sts=4 et fdm=marker:
