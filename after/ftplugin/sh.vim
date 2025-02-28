" Set Language Server provider
if executable('bash-language-server')
    call lsp#register_server({
        \ 'name': 'bash-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag,
        \     'bash-language-server', 'start']},
        \ 'whitelist': ['sh'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    " Set language server as omnifunc
    setlocal omnifunc=lsp#complete
endfunc

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
