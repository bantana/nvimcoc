" Install Vim Plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" function {{{
function! EnsureDirExits (dir)
  if !isdirectory(a:dir)
    if exists("*mkdir")
      call mkdir(a:dir, 'p')
      echo "Created directory: " . a:dir
    else
      echo "please create directory: " . a:dir
    endif
  endif
endfunction
" }}}
"
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.config/nvim/plugged')
Plug 'Shougo/denite.nvim'
Plug 'morhetz/gruvbox'
Plug 'mileszs/ack.vim'
Plug 'mattn/emmet-vim'
"Plug 'scrooloose/nerdcommenter'
Plug 'tomtom/tcomment_vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf',{'dir': '~/.fzf', 'do': './install --all'}
" Install nightly build, replace ./install.sh with install.cmd on windows
Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}
" " Or install latest release tag
" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
" " Or build from source code
" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/jsonc.vim'
Plug 'honza/vim-snippets'
Plug 'terryma/vim-multiple-cursors'
Plug 'rbgrouleff/bclose.vim'
Plug 'scrooloose/nerdtree'
" Plug 'tpope/vim-unimpaired'
" Plug 'ntpeters/vim-better-whitespace'
Plug 'gagoar/StripWhiteSpaces'
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'simnalamburt/vim-mundo'
Plug 'thinca/vim-quickrun'
" Plug 'liuchengxu/eleline.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'leafgarland/typescript-vim'
Plug 'w0rp/ale'
" Plug 'prettier/vim-prettier',{
"   \ 'do': 'yarn install',
"   \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'vue', 'yaml', 'html'] }
"
Plug 'posva/vim-vue'
Plug 'albanm/vuetify-vim'
Plug 'travisjeffery/vim-auto-mkdir'
Plug 'majutsushi/tagbar'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'dart-lang/dart-vim-plugin'
Plug 'bantana/vim-article'

" brew install languagetool
Plug 'rhysd/vim-grammarous'
Plug 'stephenway/postcss.vim'
Plug 'iloginow/vim-stylus'
Plug 'liuchengxu/graphviz.vim'
"Plug 'floobits/floobits-neovim'
Plug 'lervag/vimtex', {'for': ['tex', 'plaintex', 'bst']}
" Plug 'lyokha/vim-xkbswitch'
Plug 'rlue/vim-barbaric'
Plug 'sheerun/vim-polyglot'
Plug 'https://gn.googlesource.com/gn', { 'rtp': 'tools/gn/misc/vim' }
Plug 'rust-lang/rust.vim'
" Plug 'JuliaEditorSupport/julia-vim'
Plug 'tracyone/fzf-funky',{'on': 'CtrlPFunky'}
call plug#end()

" Color Scheme {{{
" set termguicolors
set t_Co=256
set background=dark
hi Search term=reverse cterm=reverse gui=reverse ctermfg=237
colorscheme gruvbox
" colorscheme peachpuff " morning
" }}}
" basic {{{
set nocompatible
syntax enable
filetype plugin indent on
set mouse=a
set showcmd
set showmode
set backspace=indent,eol,start
set wildmenu
set wildmode=list:longest
set ignorecase
set smartcase
set number
set relativenumber
set ruler
set incsearch
set hlsearch
set wrap
set scrolloff=3
set title
set visualbell
set shell=bash

set ofu=syntaxcomplete#Complete
" Map cursor for insert mode
let &t_SI .= "\<Esc>[5 q"
" solid block
let &t_EI .= "\<Esc>[2 q"
" }}}

" Tabs, spaces, wrapping ------------------- {{{
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set wrap
set textwidth=110 "80-width lines is for 1995"
let &wrapmargin=&textwidth
set formatoptions=qrn1
" }}}
" copy {{{
" pbcopy
if has('mac')
	let g:clipboard = {
		\   'name': 'macOS-clipboard',
		\   'copy': {
		\      '+': 'pbcopy',
		\      '*': 'pbcopy',
		\    },
		\   'paste': {
		\      '+': 'pbpaste',
		\      '*': 'pbpaste',
		\   },
		\   'cache_enabled': 0,
		\ }
endif

if has('clipboard')
	set clipboard& clipboard+=unnamedplus
endif
" }}}
" python {{{
"let g:python_host_prog="/usr/local/bin/python"
let g:python3_host_prog="/usr/local/bin/python3"
"if has('python3')
  "set pyx=3
"elseif has('python')
  "set pyx=2
"endif
" }}}

augroup golang
  " this one is which you're most likely to use?
  autocmd FileType go nnoremap <buffer> <leader>gi :GoImport
augroup end


" mapleader {{{
let mapleader = " "
let maplocalleader = "\\"
" }}}

" shutkey {{{
nnoremap <leader>ev :e ~/.config/nvim/init.vim<CR>
nnoremap <ESC><ESC> :nohlsearch<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>/ :Ack!<Space>
nnoremap <leader>m :TagbarToggle<CR>
nnoremap <leader>q :Bclose<CR>
nnoremap <leader>gt :Gist

autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" nnoremap <leader>z :new<CR>:terminal bash --rcfile ~/.bash_profile<CR>
nnoremap <silent> <leader>z :sp term://bash --rcfile ~/.bash_profile<CR>
"
if has('nvim')
  augroup vimrc_term
    autocmd!
    autocmd WinEnter term://* nohlsearch
    autocmd WinEnter term://* startinsert

    autocmd TermOpen * tnoremap <buffer> <C-h> <C-\><C-n><C-w>h
    autocmd TermOpen * tnoremap <buffer> <C-j> <C-\><C-n><C-w>j
    autocmd TermOpen * tnoremap <buffer> <C-k> <C-\><C-n><C-w>k
    autocmd TermOpen * tnoremap <buffer> <C-l> <C-\><C-n><C-w>l
    autocmd TermOpen * tnoremap <buffer> <Esc> <C-\><C-n>
  augroup END
endif

" Nerdtree {{{
map <leader>n :NERDTreeToggle<cr>
let NERDTreeIgnore=['node_modules']
" autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p
" }}}
" range {{{
map <leader>rg :Ranger<CR>
let g:NERDTreeHijackNetrw = 0 "// add this line if you use NERDTree
let g:ranger_replace_netrw = 1 "// open ranger when vim open a directory
" }}}
"
"
" ale always {{{
let g:ale_sign_column_always=1
let g:ale_linters_explicit = 1
let g:ale_linters = {'javascript': [''],'go': ['gometalinter']}
let g:ale_fixers = {
  \ 'html': ['prettier'],
  \ 'css' : ['stylelint', 'prettier'],
  \ 'javascript': ['eslint', 'prettier']
  \ }
  " \ 'html': ['prettier'],
" let g:ale_fixers = {'javascript': ['prettier-standard']}
" let g:ale_fixers = {'javascript': ['prettier']}
" let g:ale_javascript_prettier_standard_executable = '/usr/local/bin/prettier-standard'
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_standard_use_global=1
"
" let g:ale_java_google_java_format_executable = "/usr/local/bin/google-java-format"
" let g:ale_fixers = { 'java': ['google_java_format']}

" max line length that prettier will wrap on
" Prettier default: 80
let g:prettier#config#print_width = 80

" number of spaces per indentation level
" Prettier default: 2
let g:prettier#config#tab_width = 2

" use tabs over spaces
" Prettier default: false
let g:prettier#config#use_tabs = 'false'

" print semicolons
" Prettier default: true
let g:prettier#config#semi = 'false'
" let g:prettier#config#semi = 'true'

" single quotes over double quotes
" Prettier default: false
" let g:prettier#config#single_quote = 'false'
let g:prettier#config#single_quote = 'true'

" print spaces between brackets
" Prettier default: true
let g:prettier#config#bracket_spacing = 'true'

" put > on the last line instead of new line
" Prettier default: false
let g:prettier#config#jsx_bracket_same_line = 'false'

" avoid|always
" Prettier default: avoid
let g:prettier#config#arrow_parens = 'always'

" none|es5|all
" Prettier default: none
" let g:prettier#config#trailing_comma = 'es5'
let g:prettier#config#trailing_comma = 'none'

" flow|babylon|typescript|css|less|scss|json|graphql|markdown
" Prettier default: babylon
" let g:prettier#config#parser = 'flow'
let g:prettier#config#parser = 'babylon'

" cli-override|file-override|prefer-file
let g:prettier#config#config_precedence = 'prefer-file'

" always|never|preserve
let g:prettier#config#prose_wrap = 'preserve'

" let g:prettier#config#spaceBeforeFunctionParen = 'true'

let g:prettier#autoformat = 0
" let g:prettier#autoformat = 1
"
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
" command! -nargs=0 PrettierAsync :call CocAction('runCommand', 'prettier.formatFile')

" autocmd BufWritePre *.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier
" autocmd BufWritePre *.java,*.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
" command! -nargs=0 Prettier :CocCommand prettier.formatFile
" vim-quickrun {{{
let g:quickrun_config = {
\    "_" : {
\        "outputter" : "message",
\    },
\    'dart': {
\       'command': 'dart',
\       'cmdopt': '--enable-asserts',
\    }
\}
" }}}
" split naviagation {{{
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" }}}
" Command for fzf {{{
nnoremap <C-p> :<C-u>FZF<CR>
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

if has('nvim')
  let $FZF_DEFAULT_OPTS='--layout=reverse'
  let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }
  function! OpenFloatingWin()
    let height = &lines - 3
    let width = float2nr(&columns - (&columns * 2 / 10))
    let col = float2nr((&columns - width) / 2)

    " 设置浮动窗口打开的位置，大小等。
    " 这里的大小配置可能不是那么的 flexible 有继续改进的空间
    let opts = {
          \ 'relative': 'editor',
          \ 'row': height * 0.3,
          \ 'col': col + 25,
          \ 'width': width * 2 / 3,
          \ 'height': height / 2
          \ }

    let buf = nvim_create_buf(v:false, v:true)
    let win = nvim_open_win(buf, v:true, opts)

    " 设置浮动窗口高亮
    call setwinvar(win, '&winhl', 'Normal:Pmenu')

    setlocal
          \ buftype=nofile
          \ nobuflisted
          \ bufhidden=hide
          \ nonumber
          \ norelativenumber
          \ signcolumn=no
  endfunction
endif
" }}}
" Command for shortkey {{{
inoremap jj <ESC>
" }}}
" snippets for shortkey {{{
" nnoremap <leader>es :vsplit ~/.config/nvim/plugged/vim-snippets/snippets/
" let g:UltiSnipsSnippetsDir="~/.config/nvim/ultisnips"
" nnoremap <leader>es :UltiSnipsEdit<CR>
nnoremap <leader>es :CocCommand snippets.editSnippets<CR>
" }}}
" cocquickfixChange {{{
let g:coc_auto_copen = 0
autocmd User CocQuickfixChange :Denite -mode=normal quickfix
autocmd User CocQuickfixChange :call fzf_quickfix#run()
" }}}
" jest {{{
" Run jest for current project
command! -nargs=0 Jest :call  CocAction('runCommand', 'jest.projectTest')
"
" " Run jest for current file
command! -nargs=0 JestCurrent :call  CocAction('runCommand', 'jest.fileTest', ['%'])
"
"" Run jest for current test
nnoremap <leader>te :call CocAction('runCommand', 'jest.singleTest')<CR>

" Init jest in current cwd, require global jest command exists
command! JestInit :call CocAction('runCommand', 'jest.init')
" }}}
" emmet {{{
augroup EmmetSettings
  autocmd! FileType html imap <tab> <plug>(emmet-expand-abbr)
  autocmd! FileType html let g:user_emmet_expandabbr_key = '<Tab>'
  autocmd! FileType html imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
augroup END
" }}}

"sudo after opening:
cmap w!! w !sudo tee >/dev/null %

" " Or map each action separately
" au FileType javascript nmap <silent> K :call LanguageClient#textDocument_hover()<CR>
" au FileType javascript nmap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" au FileType javascript nmap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" Error and warning signs. {{{
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
" }}}
" ALENextWrap replace with :<C-u>CocList diagnostics
" nnoremap <leader>s :ALENextWrap<CR>
" ruby support {{{
" let g:ruby_host_prog = ""
" }}}
" vim-mundo ------- {{{
set undofile
" check 'vim-mundo directory'
call EnsureDirExits($HOME . '/.vim/tmp/undo')
set undodir=~/.vim/tmp/undo
nnoremap <leader>u :MundoToggle<cr>
let g:mundo_debug = 1
let g:mundo_preview_bottom = 1
let g:mundo_tree_statusline = "mundo"
let g:mundo_preview_statusline = "mundo preview"
" }}}

" vim-go ----------------------------------- {{{
let g:go_auto_type_info=1
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_goimports_bin = "goimports -tabs=false -tabwidth=4"
let g:go_fmt_fail_silently = 1
let g:go_fmt_experimental = 1
let g:go_doc_keywordprg_enabled = 1
" let g:go_bin_path = expand("~/bin")
let g:go_bin_path = $HOME."/bin"
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_build_constraints = 1
let g:go_snippet_engine = "ultisnips"
let g:go_gocode_propose_source=0

let g:go_metalinter_autosave = 1
"let g:go_metalinter_autosave_enabled = ['vet', 'golint']
"let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
" shortkey
" au FileType go nmap <Leader>s <Plug>(go-implements)

set invsplitbelow
let g:go_term_mode = "split"
let g:go_term_enabled = 1
let g:go_list_type = "quickfix"

" }}}.
" Dart-vim-plugin {{{
let dart_format_on_save = 1
" }}}

" typescript ctags {{{
let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
  \ }
" }}}
" UltiSnips {{{
let g:tagbar_type_snippets = {
    \ 'ctagstype' : 'snippets',
    \ 'kinds' : [
        \ 's:snippets',
    \ ]
    \ }
" }}}
" chineses dummy text emmet {{{
let g:user_emmet_settings = {
  \  'custom_expands1' : {
  \    '^\%(lorem\|lipsum\)\(\d*\)$' : function('emmet#lorem#ja#expand'),
  \  },
  \}
" }}}

" test plugin reload {{{
nnoremap <leader>l :so ~/.config/nvim/init.vim<CR>
" }}}

" StripWhiteSpaces {{{
" let g:better_whitespace_enabled=1
"let g:strip_whitespace_confirm=0
"let g:strip_whitespace_on_save=1
" autocmd FileType article,vue EnableStripWhitespaceOnSave
" }}}
"
" coc.nvim {{{
" if hidden not set, TextEdit might fail.
set hidden

" " Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? coc#rpc#request('doKeymap', ['snippets-expand-jump','']) :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
" vmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  " autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" vmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
" }}} end coc.nvim


" Using CocList {{{
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" " Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" }}}

" languagetool {{{
let g:grammarous#languagetool_cmd = 'languagetool'
let g:grammarous#hooks = {}
function! g:grammarous#hooks.on_check(errs) abort
    nmap <buffer><C-n> <Plug>(grammarous-move-to-next-error)
    nmap <buffer><C-p> <Plug>(grammarous-move-to-previous-error)
endfunction
let g:grammarous#disabled_categories = {
            \ '*' : ['PUNCTUATION'],
            \ 'help' : ['PUNCTUATION', 'TYPOGRAPHY'],
            \ }
let g:grammarous#default_comments_only_filetypes = {
            \ '*' : 1, 'help' : 0, 'markdown' : 0,
            \ }
" }}}
" rivive {{{
" go get -u -v github.com/mgechev/revive
call ale#linter#Define('go', {
\   'name': 'revive',
\   'output_stream': 'both',
\   'executable': 'revive',
\   'read_buffer': 0,
\   'command': 'revive %t',
\   'callback': 'ale#handlers#unix#HandleAsWarning',
\})
" }}}
" google-java-format {{{
" autocmd FileType java AutoFormatBuffer google-java-format
" }}}
" css tagbar ctags {{{
" brew install --HEAD universal-ctags/universal-ctags/universal-ctags
let g:tagbar_type_css = {
\ 'ctagstype' : 'Css',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
\ }
" }}}
" vimtex {{{
" require: brew cask install mactex skim

let g:tex_flavor='latex'
let g:vimtex_view_method='skim'
let g:vimtex_quickfix_mode=0
set conceallevel=0
let g:tex_conceal='abdmg'
let g:Tex_CompileRule_pdf='xelatex -interaction=nonstopmode $*'
let g:vimtex_compiler_enabled=1
let g:vimtex_compiler_progname='nvr'
let g:vimtex_view_general_options
    \ = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'

" TOC settings
let g:vimtex_toc_config = {
      \ 'name' : 'TOC',
      \ 'layers' : ['content', 'todo', 'include'],
      \ 'resize' : 1,
      \ 'split_width' : 50,
      \ 'todo_sorted' : 0,
      \ 'show_help' : 1,
      \ 'show_numbers' : 1,
      \ 'mode' : 2,
      \}
"
" }}}
" graphviz {{{
" How to open the generated output file.
" If does not exist, graphviz.vim will automatically choose the right way depending on the platform.
"let g:graphviz_viewer = 'open'
let g:graphviz_viewer = 'skim'

" Default output format. Default is 'pdf'.
let g:graphviz_output_format = 'pdf'

" Options passed on to dot. Default is ''.
let g:graphviz_shell_option = ''
augroup graphviz
  " this one is which you're most likely to use?
  "autocmd FileType dot nnoremap <buffer> <leader>gb :GraphvizCompile<CR> :Graphviz! pdf<CR>
  autocmd FileType dot nnoremap <buffer> <leader>gb :GraphvizCompile<CR>
augroup end
" }}}
" "+++ Spelling +++ {{{
let g:spellfile_URL = 'http://ftp.vim.org/vim/runtime/spell'
set spelllang=en_us
setlocal spell spelllang=en_us
set spellfile=~/.config/nvim/spell/en.utf-8.add
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.txt setlocal spell
autocmd BufRead,BufNewFile *.article setlocal spell

autocmd FileType gitcommit setlocal spell
set complete+=kspell
" }}}

" vim-barbaric {{{
" install:
" curl -o /usr/local/bin/xkbswitch https://raw.githubusercontent.com/myshov/xkbswitch-macosx/master/bin/xkbswitch
" chmod +x /usr/local/bin/xkbswitch

" The input method for Normal mode (as defined by `xkbswitch -g` or `ibus engine`)
let g:barbaric_default = 0

" The scope where alternate input methods persist (buffer, window, tab, global)
let g:barbaric_scope = 'buffer'

" Forget alternate input method after n seconds in Normal mode (disabled by default)
" Useful if you only need IM persistence for short bursts of active work.
let g:barbaric_timeout = -1
" }}}
function! Zoom ()
    " check if is the zoomed state (tabnumber > 1 && window == 1)
    if tabpagenr('$') > 1 && tabpagewinnr(tabpagenr(), '$') == 1
        let l:cur_winview = winsaveview()
        let l:cur_bufname = bufname('')
        tabclose

        " restore the view
        if l:cur_bufname == bufname('')
            call winrestview(cur_winview)
        endif
    else
        tab split
    endif
endfunction

nmap <leader>b :call Zoom()<CR>
" rust {{{
let g:rust_fold = 1
let g:rustfmt_command = 'rustfmt'
let g:rustfmt_fail_silently = 0
let g:rustfmt_autosave = 1
if has('mac')
  let g:rust_clip_command = 'pbcopy'
  " let g:rust_clip_command = 'xclip -selection clipboard' // linux
endif
" }}}
let g:netrw_scp_cmd="scp -q -P 22"
" fzf-funky {{{
let g:ctrlp_funky_syntax_highlight = 1
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
" }}}
