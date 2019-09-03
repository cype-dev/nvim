" Use Language Server if installed
if executable('clangd')
    if !exists('g:cpp_ls_loaded')
        let g:cpp_ls_loaded=1
        call lsp#register_server({
            \ 'name': 'clangd',
            \ 'cmd': {server_info->['clangd']},
            \ 'whitelist': ['cpp'],
            \ })
    endif
    setlocal omnifunc=lsp#complete
"   setlocal formatexpr=LanguageClient_textDocument_rangeFormatting
else
    echoerr 'Clangd Language Server not installed'
endif

" Folding
setlocal foldmethod=marker
setlocal foldmarker={,}