# README

neovim coc.nvim and vim-go

```bash

brew install neovim

brew install python3

pip3 list |awk 'NR>2 {print "pip3 install --upgrade --user "$1}'|bash -

pip3 install neovim

git clone https://github.com/bantana/nvimcoc

nvim  +"CocInstall coc-vetur coc-snippets coc-stylelint coc-css coc-prettier coc-yaml coc-tslint coc-html coc-tsserver coc-eslint coc-emmet coc-json"

nvim +GoInstallBinaries main.go
```

## install node

use homebrew

```bash
brew install node
```

or install use nvm

```bash
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
nvm ls-remote
nvm install v10.15.0
```

## coc.nvim

### golang

install go-langserver

```bash
go get -u -v github.com/sourcegraph/go-langserver
```

vi ~/.config/nvim/coc-settings.json

```json
"languageserver": {
  "golang": {
    "command": "go-langserver",
      "filetypes": ["go"],
      "initializationOptions": {
        "gocodeCompletionEnabled": true,
        "diagnosticsEnabled": true,
        "lintTool": "golint"
      }
  }
}
```

### bash

```bash

yarn global add bash-language-server

```

vi ~/.config/nvim/coc-settings.json

```json

  "languageserver": {
      "bash": {
        "command": "bash-language-server",
        "args": ["start"],
        "filetypes": ["sh"],
        "ignoredRootPaths": ["~"]
      }
  }
```

### dart

install dart sdk

```bash
brew tap dart-lang/dart
brew install dart
brew upgrade dart
```

install dart_language_server

```bash
pub global activate dart_language_server

```

vi ~/.config/nvim/coc-settings.json

```json
"languageserver": {
  "dart": {
    "command": "dart_language_server",
    "args": [],
    "filetypes": ["dart"],
    "initializationOptions": {},
    "settings": {
      "dart": {
        "validation": {},
        "completion": {}
      }
    }
  },
}

```

### Dockerfile

install dockerfile-language-server-nodejs

```bash
yarn global add dockerfile-language-server-nodejs

```

~/.config/nvim/coc-settings.json

```json
"languageserver": {
  "dockerfile": {
    "command": "docker-langserver",
    "filetypes": ["dockerfile"],
    "args": ["--stdio"]
  }
}
```

### typescript

```bash
yarn global add javascript-typescript-langserver
```

### c, c++, object/c

```bash
brew tap twlz0ne/homebrew-ccls
brew install ccls
```

```json
    "ccls": {
      "command": "ccls",
      "filetypes": ["c", "cpp", "objc", "objcpp"],
      "rootPatterns": [
        ".ccls",
        "compile_commands.json",
        ".vim/",
        ".git/",
        ".hg/"
      ],
      "initializationOptions": {
        "cacheDirectory": "/tmp/ccls"
      }
    },
```

## vimtex mactex skim

latex support

~/.config/nvim/init.nvim

    Plug 'lervag/vimtex', {'for': ['tex', 'plaintex', 'bst']}

```bash
brew cask install mactex skim
```

```bash
if [[ -d /usr/local/texlive/2018/bin/x86_64-darwin ]]; then
  #statements
  export PATH=$PATH:/usr/local/texlive/2018/bin/x86_64-darwin
fi
```

```vimscript
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
```

vim command:

    :vimtexCompile

## floobits.com

plugin:

    Plug 'floobits/floobits-neovim'

visit floobits.com to register a account.
