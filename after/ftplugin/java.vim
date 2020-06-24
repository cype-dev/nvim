if executable('java') && executable('jdtls')
    call lsp#register_server({
        \ 'name': 'jdtls',
        \ 'cmd': {server_info->['jdtls', '-data', getcwd()]},
        \ 'whitelist': ['java'],
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
    let g:vista_executive_for.java='vim_lsp'
endfunc

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
