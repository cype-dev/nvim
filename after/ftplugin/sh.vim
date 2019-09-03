" Set Language Server provider
if executable('bash-language-server')
    if !exists('g:sh_ls_loaded')
        let g:sh_ls_loaded=1
        call lsp#register_server({
            \ 'name': 'bash-language-server',
            \ 'cmd': {server_info->[&shell, &shellcmdflag,
            \     'bash-language-server', 'start']},
            \ 'whitelist': ['sh'],
            \ })
    endif
    setlocal omnifunc=lsp#complete
else
    echoerr "bash-language-server not installed"
endif
