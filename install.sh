#/bin/bash

if [ -d "$ZSH" ]; then
	echo $ZSH
else
	echo "Please run this script in oh-my-zsh"
	exit;
fi


cd "$(dirname "$0")"

DOTFILES=$(pwd)

for dotfile in dotfiles/.*; do
	fn=${dotfile##*/}
	test "$fn" = ".." && continue
	test "$fn" = "." && continue

	src="$DOTFILES/$dotfile"
	dst="$HOME/$fn"

	echo "linking $src =>  $dst"
	if [ -L "$dst" ]; then
		echo "Symlink $dst exists, overwrite"
	elif [ -e "$dst" ]; then
		echo "File $dst exists, backup as $dst.kommit-backup"
		mv "$dst" "$dst.kommit-backup"
	else
		echo "$dst not exists, create"
	fi
	ln -sf "$src" "$dst"
	echo
done

ZSH_CUSTOM=$ZSH/custom
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

cd ~/.vim/
mkdir backup
mkdir swap
