# My vim config

Features
* Pathogen for plugin management
* YCM - requires compilation of clang completer and python2 compatibility

## Installation

1. Clone to `~/.vim/`
1. Create a symbolic link to vimrc in `.vim/vimrc`
1. `cd` into `.vim/vimrc` and run
```
git submodule update --init --recursive
```

### Update the submodules
If you don't want to review the changes of plugins just do
```
git submodule foreach git pull origin
```

