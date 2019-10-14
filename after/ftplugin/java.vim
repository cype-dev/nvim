if executable('java') && executable('jdtls')
    if !exists('g:java_ls_loaded')
        let g:java_ls_loaded=1
        call lsp#register_server({
            \ 'name': 'jdtls',
            \ 'cmd': {server_info->['jdtls', '-data', getcwd()]},
            \ 'whitelist': ['java'],
            \ })
    endif

    " Set language server as omnifunc
    setlocal omnifunc=lsp#complete

    " Set vista executive
    let g:vista_executive_for.java='vim_lsp'
else
    echoerr "Eclipse Language Server not installed"
endif
