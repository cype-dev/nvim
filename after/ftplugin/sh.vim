" Set Language Server provider
if executable('bash-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'bash-language-server',
        \ 'cmd': {server_info->['bash-language-server', 'start']},
        \ 'whitelist': ['*'],
        \ })
    setlocal omnifunc=lsp#complete
else
    echoerr "bash-language-server not installed"
endif

