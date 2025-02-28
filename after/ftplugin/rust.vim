" Enable spell checking
setlocal spell

" Use language server if installed
if executable('rust-analyzer')
    call lsp#register_server({
        \ 'name': 'rust-analyzer',
        \ 'cmd': {server_info->['rust-analyzer']},
        \ 'whitelist': ['rust'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    " Set language server as omnifunc
    setlocal omnifunc=lsp#complete

    " Set language server as linting provider
    "let b:ale_linters={'rust': ['analyzer']}

    " Keep rls as linter for now (because it supports diagnostics on text-edit)
    let b:ale_linters=['rls']
    let b:ale_rust_rls_toolchain=''
    let b:ale_rust_rls_config={'rust': {'clippy_preference': 'on'}}

    " Set folding based on language server
    setlocal foldmethod=expr
    setlocal foldexpr=lsp#ui#vim#folding#foldexpr()
    setlocal foldtext=lsp#ui#vim#folding#foldtext()

    " Set language server as vista executive
    let g:vista_executive_for.rust='vim_lsp'
endfunc

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
