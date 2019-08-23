" Use Language Server if installed
if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd']},
        \ 'whitelist': ['*'],
        \ })
    setlocal omnifunc=lsp#complete
"   setlocal formatexpr=LanguageClient_textDocument_rangeFormatting
else
    echoerr 'Clangd Language Server not installed'
endif

" Folding
setlocal foldmethod=marker
setlocal foldmarker={,}
