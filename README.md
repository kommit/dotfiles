# Kommit's personal dotfiles

## Install

Install [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) first.

then:

    git clone https://github.com/kommit/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    ./install.sh


The install.sh does these things:

1. Symlink all dotfiles in [dotfiles](https://github.com/kommit/dotfiles/tree/master/dotfiles) directory, to $HOME.
    * if a symlink with same file name already exists in $HOME, overwrite it.
    * if a regular file or directory with same exists in $HOME, rename it to .xxxx.kommit-backup.
    * create the symlink.

1. Install third-party zsh plugins.
    * https://github.com/zsh-users/zsh-autosuggestions.git
    * https://github.com/zsh-users/zsh-syntax-highlighting.git
    * https://github.com/kommit/zsh-auto-venv.git

1. Install vim plugins
