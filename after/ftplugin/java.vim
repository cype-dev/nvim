if executable('java') && executable('jdtls')
    if !exists('g:java_ls_loaded')
        let g:java_ls_loaded=1
        call lsp#register_server({
            \ 'name': 'jdtls',
            \ 'cmd': {server_info->['jdtls', '-data', getcwd()]},
            \ 'whitelist': ['java'],
            \ })
    endif
    setlocal omnifunc=lsp#complete
else
    echoerr "Eclipse Language Server not installed"
endif
