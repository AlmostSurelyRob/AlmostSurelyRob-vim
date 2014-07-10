# My vim config

Features
* Pathogen
* YCM - requires compilation of clang completer

## Installation

1. Clone to `~/.vim/`
1. Create a symbolic link to vimrc in `.vim/vimrc`
1. `cd` into `.vim/vimrc` and run
```
git submodule update --init --recursive
```

Update the submodules with
```
git submodule foreach git pull origin
```

