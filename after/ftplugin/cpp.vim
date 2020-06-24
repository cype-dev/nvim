" Use Language Server if installed
if executable('clangd')
    call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd']},
        \ 'whitelist': ['cpp'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    " Set language server as omnifunc
    setlocal omnifunc=lsp#complete

    " Set folding based on language server
    setlocal foldmethod=expr
    setlocal foldexpr=lsp#ui#vim#folding#foldexpr()
    setlocal foldtext=lsp#ui#vim#folding#foldtext()

    " Set language server as vista executive
    let g:vista_executive_for.cpp='vim_lsp'
endfunc

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
