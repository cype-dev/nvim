" Disable concealing
let g:tex_conceal = ""

" Enable spell checking
setlocal spell

" Soft wrap lines
setlocal wrap

" Add vimtex as completion source
"au User Ncm2Plugin call ncm2#register_source({
"    \ 'name' : 'vimtex',
"    \ 'priority': 1,
"    \ 'subscope_enable': 1,
"    \ 'complete_length': 1,
"    \ 'scope': ['tex'],
"    \ 'mark': 'tex',
"    \ 'word_pattern': '\w+',
"    \ 'complete_pattern': g:vimtex#re#ncm,
"    \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc']
"    \ })
