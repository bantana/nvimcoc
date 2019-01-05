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

## coc.nvim

### golang

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

