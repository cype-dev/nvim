" Check if Language Server is installed
if executable('rls')
    " Use Language Server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'whitelist': ['*'],
        \ })
    setlocal omnifunc=lsp#complete

    " Use Language Server formatting
"   setlocal formatexpr=LanguageClient#textDocument_rangeFormatting()

    " Set linting provider (rls with clippy)
    let b:ale_linters=['rls']
    let b:ale_rust_rls_toolchain='stable'
    let g:ale_rust_rls_config={'rust': {'clippy_preference': 'on'}}
else
    echoerr "RLS Language Server not installed"
    " Use clippy as linter if rls is not available
    let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')
endif

" Folding
setlocal foldmethod=marker
setlocal foldmarker={,}

" Compatibility settings for tagbar and rust
let g:tagbar_type_rust = {
  \ 'ctagstype' : 'rust',
  \ 'kinds' : [
      \ 'n:modules',
      \ 's:structures:1',
      \ 'i:interfaces',
      \ 'c:implementations',
      \ 'f:functions:1',
      \ 'g:enumerations:1',
      \ 't:type aliases:1:0',
      \ 'v:constants:1:0',
      \ 'M:macros:1',
      \ 'm:fields:1:0',
      \ 'e:enum variants:1:0',
      \ 'P:methods:1',
  \ ],
  \ 'sro': '::',
  \ 'kind2scope' : {
      \ 'n': 'module',
      \ 's': 'struct',
      \ 'i': 'interface',
      \ 'c': 'implementation',
      \ 'f': 'function',
      \ 'g': 'enum',
      \ 't': 'typedef',
      \ 'v': 'variable',
      \ 'M': 'macro',
      \ 'm': 'field',
      \ 'e': 'enumerator',
      \ 'P': 'method',
  \ },
\ }
