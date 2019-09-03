" Enable all features of Vim
set nocompatible

" Set shell
set shell=/bin/sh

" Default augroup
augroup vimrc
    autocmd!
augroup END

"Plugins"
    "minpac"
        " Use minpac as wrapper for native plugin management
        packadd minpac
        call minpac#init()

        " Theme
        call minpac#add('morhetz/gruvbox')
        call minpac#add('luochen1990/rainbow')
        call minpac#add('nathanaelkane/vim-indent-guides')
        call minpac#add('vim-airline/vim-airline')
        call minpac#add('vim-airline/vim-airline-themes')
        call minpac#add('drzel/vim-line-no-indicator')

        " Editor features
        call minpac#add('majutsushi/tagbar')
        call minpac#add('prabirshrestha/async.vim')
        call minpac#add('prabirshrestha/vim-lsp')
        call minpac#add('thomasfaingnaert/vim-lsp-snippets')
        call minpac#add('thomasfaingnaert/vim-lsp-ultisnips')
        call minpac#add('w0rp/ale')
        call minpac#add('rhysd/vim-grammarous')
        call minpac#add('lambdalisue/suda.vim')
        call minpac#add('junegunn/goyo.vim')
        call minpac#add('junegunn/limelight.vim')
        call minpac#add('reedes/vim-pencil')
        call minpac#add('tpope/vim-fugitive')

        " Editing features
        call minpac#add('junegunn/fzf')
        call minpac#add('junegunn/fzf.vim')
        call minpac#add('lifepillar/vim-mucomplete')
        call minpac#add('sirver/UltiSnips')
        call minpac#add('honza/vim-snippets')
        call minpac#add('Raimondi/delimitMate')
        call minpac#add('alvan/vim-closetag')
        call minpac#add('tpope/vim-surround')
        call minpac#add('tpope/vim-repeat')
        call minpac#add('scrooloose/nerdcommenter')
        call minpac#add('chaoren/vim-wordmotion')
        call minpac#add('junegunn/vim-easy-align')

        " Language dependent features
        call minpac#add('lervag/vimtex')

    "Airline"
        " Enable Powerline symbols
        let g:airline_powerline_fonts=1

        " Dont show whitespace errors
        let g:airline#extensions#whitespace#enabled=0

        " Show open buffers if only one tab is open
        let g:airline#extensions#tabline#enabled=1

        " Airline theme
        let g:airline_theme='gruvbox'

    "vim-line-no-indicator"
        " Indicator theme
        let g:line_no_indicator_chars=
            \ [' ', '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█']

        " Show indicator in airline
        let g:airline_section_z=
            \ '%#__accent_bold#%{LineNoIndicator()}%#__restore__#%2c'

    "Tagbar"
        " Toggle Tagbar
        map <silent> <Leader>tt :TagbarToggle<CR>

        " Enable usage of leader key in tagbar window
        let g:tagbar_map_showproto=""

    "delimitMate"
        let delimitMate_expand_cr=1

    "Rainbow"
        " Activate parantheses color based on level
        let g:rainbow_active=1

    "Gruvbox"
        " Gruvbox theme
        let g:gruvbox_italic=1
        let g:gruvbox_contrast_dark='soft'

    "mucomplete"
        " Enable mucomplete
        let g:mucomplete#enable_auto_at_startup=1

        " Set default completions
        let g:mucomplete#chains={}
        let g:mucomplete#chains.default=
            \ ['ulti', 'omni', 'c-n', 'path', 'tags', 'dict']

        " Set completion triggers
        let g:mucomplete#can_complete={
            \ 'default': {
            \    'omni': { t -> strlen(&l:omnifunc) > 0 && t =~# 
            \        '\%(\k\|\.\|\:\:\)$' }}}

    "vim-lsp"
        " Disable diagnostics
        let g:lsp_diagnostics_enabled=0

        " Lsp feature keybinds
        map <silent> <Leader>lh :LspHover<CR>
        map <silent> <Leader>ld :LspPeekDefinition<CR>

    "Goyo"
        " Toggle Limelight, Pencil and relative numbers with Goyo
        augroup goyo_config
            autocmd!
            autocmd User GoyoEnter Limelight  | call ToggleRelativeNumbers()
                \ | Pencil
            autocmd User GoyoLeave Limelight! | call ToggleRelativeNumbers()
                \ | NoPencil
        augroup END

        " Toggle Goyo
        map <silent> <Leader>gt :Goyo<CR>

    "Limelight"
        " Limelight theme
        let g:limelight_conceal_ctermfg=245
        let g:limelight_conceal_guifg='#928374'

    "Indent Guides"
        " Enable Indent Guides
        let g:indent_guides_enable_on_vim_startup=1

        " Disable hotkey for enable/disable
        let g:indent_guides_default_mapping=0

        " Let theme set colors
        let g:indent_guides_auto_colors=0

        " Set width of the guides
        let g:indent_guides_guide_size=1

        " Hide first guide
        let g:indent_guides_start_level=2

    "vim-easy-align"
        " Keychord for aligning in visual and normal mode
        xmap ga <Plug>(EasyAlign)
        nmap ga <Plug>(EasyAlign)

    "FZF"
        " Use vim colorscheme for fzf
        let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \   'bg':      ['bg', 'Normal'],
            \   'hl':      ['fg', 'Comment'],
            \   'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \   'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \   'hl+':     ['fg', 'Statement'],
            \   'info':    ['fg', 'PreProc'],
            \   'border':  ['fg', 'Ignore'],
            \   'prompt':  ['fg', 'Conditional'],
            \   'pointer': ['fg', 'Exception'],
            \   'marker':  ['fg', 'Keyword'],
            \   'spinner': ['fg', 'Label'],
            \   'header':  ['fg', 'Comment'] }

    "Compatibility"
        " Expand snippet, delimiter or enter newline depending on context
        let g:UltiSnipsExpandTrigger="<NOP>"
        imap <silent> <expr> <CR> mucomplete#ultisnips#expand_snippet("\<Plug>delimitMateCR")

"Tags"
    " Search recursively for tags file
    set tags=./tags;

"Keybinds"
    " Set space as leader
    map <Space> <Leader>

"Behaviour"
    " Use filetype detection, plugins and indentation
    filetype plugin indent on

    " Change title of terminal
    set title

    " Set default encoding
    set encoding=utf-8

    " Prefer unix file format
    set fileformats=unix,dos,mac

    " Tells Vim the connection to the used terminal is fast
    set ttyfast

    " Only redraw when needed
    set lazyredraw

    " Allow unwritten hidden buffers
    set hidden

    " Number of remembered commands
    set history=1000

"Spacing"
    " Number of spaces a tab accounts for
    set tabstop=4

    " Number of spaces used for indentation
    set shiftwidth=4

    " Replace tabs with spaces
    set expandtab

    " >> and << moves to nearest multiple of shiftwidth instead of fixed amount
    set shiftround

    " Use indentation level and pattern of previous line, preserve structure
    set autoindent
    set copyindent
    set preserveindent

    " Disable copying of comment of previous line
    autocmd vimrc FileType * setlocal formatoptions-=cro

"Whitespace"
    " Characters representing whitespace when list is enabled
    set listchars=tab:>~
    set listchars+=eol:$
    set listchars+=space:.
    set listchars+=trail::
    " Character representing continuing line to the left
    set listchars+=precedes:<
    " Character representing continuing line to the right
    set listchars+=extends:>

    " Toggle between indent guides, listchars and nothing
    let g:listchars_enabled=0
    function! ToggleListChars()
        if g:listchars_enabled == 0
            IndentGuidesDisable
            set list
            let g:listchars_enabled=1
        elseif g:listchars_enabled == 1
            set nolist
            let g:listchars_enabled=2
        else
            IndentGuidesEnable
            let g:listchars_enabled=0
        endif
    endfunction
    nnoremap <silent> <F1> :call ToggleListChars()<CR>

"Syntax Highlighting"
    " Show matching brackets
    set showmatch

    " Enable syntax highlighting
    syntax on

"Spell Checking"
    " Set spell checking languages
    set spelllang=en_us,de_de
    set spellfile=$HOME/.vim/spell/spell.utf8.add
    set spellfile+=$HOME/.vim/spell/en.utf-8.add
    set spellfile+=$HOME/.vim/spell/de.utf-8.add
 
"Concealing"
    " Show unconcealed text in insert mode"
    set concealcursor=nc

"Colorscheme"
    " Tells Vim that the used background is dark
    set background=dark

    " Enable true color
    set termguicolors

    " Sets the color scheme used in syntax highlighting
    colorscheme gruvbox

    " Use terminal background
"   autocmd vimrc VimEnter * hi Normal ctermbg=none guibg=none

"Search"
    " Search while typing
    set incsearch

    " Case sensitive if upper case letters are used in search
    set ignorecase
    set smartcase

    " Highlight matches
    set hlsearch

    " Start from the beginning of the file if end is reached
    set wrapscan

    " Hide searches when pressing escape
    nnoremap <silent> <ESC> :noh<CR><ESC>

"Window"
    " Show status line
    set laststatus=2

    " Do not show current mode (Mode is already shown in Airline plugin)
    set noshowmode

    " Visual instead of audible notifications
    set visualbell

    " Highlight current line
"   set cursorline

    " Highlight 81st column on every line, highlight everything beyond 120
    let &colorcolumn="81,".join(range(121,999),",")

"Folding"
    " Show column on the left indicating folds
"   set foldcolumn=1

    " Do not start with folds enabled
    set nofoldenable

    " Do not fold any when folding is enabled
    set foldlevelstart=99

"Views"
    " Load perisistent views, write view on save
    autocmd vimrc BufWinEnter *.* silent! loadview
    autocmd vimrc BufWrite *.* mkview

    " Only save folds and cursor position in view
    set viewoptions=folds,cursor

"Line numbers"
    " Show line numbers
    set number

    " Use absolute line numbers in insert mode and if buffer is out of focus
    function! ToggleRelativeNumbers()
        if !exists('#relative_number#InsertEnter')
            augroup relative_number
                autocmd!
                autocmd BufLeave,FocusLost,InsertEnter *
                    \ :setlocal norelativenumber
                autocmd BufEnter,FocusGained,InsertLeave *
                    \ :setlocal relativenumber
            augroup END
        else
            augroup relative_number
                autocmd!
                setlocal norelativenumber
            augroup END
        endif
    endfunction
    call ToggleRelativeNumbers()

"Textdisplay"
    " Lines continue beyond screen
    set nowrap

    " Wrapped lines break at white space
    set linebreak

    " Wrapped lines keep indentation
    set breakindent

"Autocompletion"
    "Wildmenu"
        " Use wildmenu (command completion)
        set wildmenu

        " Invoke wildmenu on first tab press, show longest common string first
        set wildmode=longest:full,full

    "Codecompletion"
        " Always show menu and do not autoselect/autoinsert match
        set completeopt=noinsert,menuone,noselect

        " Hide file messages
        set shortmess+=c

"Undofile"
    " Persist undo history only if in subdirectory of $HOME
    autocmd vimrc BufReadPre,BufNewFile *
        \ if strpart(expand('%:p'), 0, strlen($HOME) + 1) == $HOME . '/'
        \ | setlocal undofile | endif

    " Set undo file directory, use full path as name for undofile
    set undodir=./.undo//,../.undo//,$HOME/.undo//

    " Number of saved changes
    set undolevels=1000

"Filetypes"
    " Use LaTeX as default TeX flavor
    let g:tex_flavor="latex"

"Backspacing"
    " Always allow backspacing
    set backspace=indent
    set backspace+=eol
    set backspace+=start

"Splits"
   " Open horizontal splits below the current window
    set splitbelow

    " Open vertical splits to the right of the current window
    set splitright

    " Use Ctrl + directon to move between split windows
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l

"Filebrowser"
    " Disable banner
    let g:netrw_banner=0

    " Use tree like view
    let g:netrw_liststyle=3

    " Width of the window (if opened in split window)
    let g:netrw_winsize=25

    " Disable history
    let g:netrw_dirhistmax=0

    " Hotkey for opening/closing the file browser
    map <silent> <Leader>et :Explore<CR>

"Movement"
    " Disable arrow keys
    nnoremap <Left> <NOP>
    nnoremap <Down> <NOP>
    nnoremap <Up> <NOP>
    nnoremap <Right> <NOP>
    inoremap <Left> <NOP>
    inoremap <Down> <NOP>
    inoremap <Up> <NOP>
    inoremap <Right> <NOP>

    " Move up and down in screen lines
    nnoremap j gj
    nnoremap k gk

    " Move left and right in screen lines
"   nnoremap $ g$
"   nnoremap 0 g0

    " Number of characters to skip while scrolling horizontally
    set sidescroll=1

    " Number of lines to show under cursor while scrolling
    set scrolloff=5

"Mouse"
    " Enable mouse
    set mouse=a

"Clipboard"
    " Set keys for copy and paste to and from system clipboard
    vnoremap <C-y> "+y
    nnoremap <C-p> <ESC>"+pi