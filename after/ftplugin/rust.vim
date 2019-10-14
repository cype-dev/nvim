" Check if Language Server is installed
if executable('rls')
    " Use Language Server
    if !exists('g:rust_ls_loaded')
        let g:rust_ls_loaded=1
        call lsp#register_server({
            \ 'name': 'rls',
            \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
            \ 'whitelist': ['rust'],
            \ })
    endif

    " Set language server as omnifunc
    setlocal omnifunc=lsp#complete

    " Use Language Server formatting
"   setlocal formatexpr=LanguageClient#textDocument_rangeFormatting()

    " Set linting provider (rls with clippy)
    let b:ale_linters=['rls']
    let b:ale_rust_rls_toolchain='stable'
    let b:ale_rust_rls_config={'rust': {'clippy_preference': 'on'}}

    " Set vista executive
    let g:vista_executive_for.rust='vim_lsp'
else
    echoerr "RLS Language Server not installed"
    " Use clippy as linter if rls is not available
    let b:ale_rust_cargo_use_clippy = executable('cargo-clippy')
endif

" Folding
setlocal foldmethod=marker
setlocal foldmarker={,}
