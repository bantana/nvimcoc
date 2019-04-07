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
Plug 'tomtom/tcomment_vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf',{'dir': '~/.fzf', 'do': './install --all'}
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': 'yarn install'}
" Plug 'neoclide/npm.nvim', {'do' : 'npm install'}
" Plug 'SirVer/ultisnips'
Plug 'neoclide/jsonc.vim'
Plug 'honza/vim-snippets'
Plug 'terryma/vim-multiple-cursors'
Plug 'rbgrouleff/bclose.vim'
Plug 'scrooloose/nerdtree'
" Plug 'tpope/vim-unimpaired'
Plug 'ntpeters/vim-better-whitespace'
" Plug 'gagoar/StripWhiteSpaces'
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
Plug 'floobits/floobits-neovim'
Plug 'lervag/vimtex', {'for': ['tex', 'plaintex', 'bst']}
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
set clipboard=unnamed
" }}}
" python {{{
let g:python_host_prog="/usr/local/bin/python"
let g:python3_host_prog="/usr/local/bin/python3"
" }}}

augroup golang
  " this one is which you're most likely to use?
  autocmd FileType go nnoremap <buffer> <leader>gi :GoImport 
augroup end


" mapleader {{{
let mapleader = " "
let maplocalleader = "\\"
" }}}
" Shortcuts for denite interface
" Show extension list
" nnoremap <silent> <space>e  :<C-u>Denite coc-extension<cr>
" " Show symbols of current buffer
" nnoremap <silent> <space>o  :<C-u>Denite coc-symbols<cr>
" " Search symbols of current workspace
" nnoremap <silent> <space>t  :<C-u>Denite coc-workspace<cr>
" " Show diagnostics of current workspace
" nnoremap <silent> <space>a  :<C-u>Denite coc-diagnostic<cr>
" " Show available commands
" nnoremap <silent> <space>c  :<C-u>Denite coc-command<cr>
" " Show available services
" nnoremap <silent> <space>s  :<C-u>Denite coc-service<cr>
" " Show links of current buffer
" nnoremap <silent> <space>l  :<C-u>Denite coc-link<cr>

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
" }}}
" range {{{
" map <leader>f :Ranger<CR>
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

let g:ale_java_google_java_format_executable = "/usr/local/bin/google-java-format"
let g:ale_fixers = { 'java': ['google_java_format']}

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
" let dart_format_on_save = 1
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
" nnoremap <leader>l :so ~/.config/nvim/init.vim<CR>
" }}}

" StripWhiteSpaces {{{
autocmd FileType article,vue EnableStripWhitespaceOnSave
" }}}
" if hidden not set, TextEdit might fail.
set hidden

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


" Add diagnostic info for https://github.com/itchyny/lightline.vim
" let g:lightline = {
"       \ 'colorscheme': 'wombat',
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ],
"       \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
"       \ },
"       \ 'component_function': {
"       \   'cocstatus': 'coc#status'
"       \ },
"       \ }

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
" }}}


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
set conceallevel=1
let g:tex_conceal='abdmg'
let g:Tex_CompileRule_pdf='xelatex -interaction=nonstopmode $*'
let g:vimtex_compiler_enabled=1
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
let g:graphviz_viewer = 'open'

" Default output format. Default is 'pdf'.
let g:graphviz_output_format = 'pdf'

" Options passed on to dot. Default is ''.
let g:graphviz_shell_option = ''
augroup graphviz
  " this one is which you're most likely to use?
  autocmd FileType dot nnoremap <buffer> <leader>gb :GraphvizCompile<CR> :Graphviz! pdf<CR>
augroup end
" }}}
" "+++ Spelling +++
" let g:spellfile_URL = 'http://ftp.vim.org/vim/runtime/spell'
" set spelllang=en_us
" autocmd BufRead,BufNewFile *.md setlocal spell
" autocmd BufRead,BufNewFile *.txt setlocal spell
