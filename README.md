# README

## install homebrew

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## install node

Use homebrew

```bash
brew install node@10
```

~/.bash_profile

```bash
# npm global reset to user directoy
if [ -d ~/.npm-global ]; then
    export PATH=$PATH:~/.npm-global/bin
    # export NPM_CONFIG_PREFIX=~/.npm-global
else
    mkdir ~/.npm-global
    npm config set prefix '~/.npm-global'
    npm i -g npm
    source ~/.bash_profile
fi
if [ -d /usr/local/opt/node@10/bin ]; then
    PATH=$PATH:/usr/local/opt/node@10/bin
fi

```

Or install use nvm

```bash
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
nvm ls-remote
nvm install v10.15.0
```

## Install neovim and dependence

neovim coc.nvim and vim-go

```bash

brew install neovim

brew install python3

pip3 list |awk 'NR>2 {print "pip3 install --upgrade --user "$1}'|bash -

pip3 install neovim

brew install node@10

git clone https://github.com/bantana/nvimcoc

nvim  +"CocInstall coc-vetur coc-snippets coc-stylelint coc-css coc-prettier coc-yaml coc-tslint coc-html coc-tsserver coc-eslint coc-emmet coc-json"

nvim +GoInstallBinaries main.go
```

## coc.nvim

soft link ~/.config/nvim/ultisnips -> ~/.config/coc/ultisnips

```bash
cd ~/.config/coc && ln -s ~/.config/nvim/ultisnips
```

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

## universal-ctags

[https://github.com/universal-ctags/ctags](universal-ctags)

Install:

```bash
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
```
