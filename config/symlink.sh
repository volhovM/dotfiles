#!/bin/bash

dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# $1 filename, $2 real path
function makeLink {
  rm $2
  mkdir -p "$(dirname "$2")"
  ln -s $dir/$1 $2
}

makeLink "./.xmobarrc" ~/.xmobarrc
makeLink "./.vimperatorrc" ~/.vimperatorrc
makeLink "./.xinitrc" ~/.xinitrc
makeLink "./.gitconfig" ~/.gitconfig
makeLink "./xmonad.hs" ~/.xmonad/xmonad.hs
makeLink "./.emacs" ~/.emacs
makeLink "./.xmodmap" ~/.xmodmap
makeLink "./.zshrc" ~/.zshrc
makeLink "./.mrconfig" ~/.mrconfig
mkdir -p ~/.config/dunstrc/
makeLink "./dunstrc" ~/.config/dunst/dunstrc
makeLink "./.vimrc" ~/.vimrc
makeLink "./.bashrc" ~/.bashrc
mkdir -p ~/.stack
makeLink "./config.yaml" ~/.stack/config.yaml
makeLink "./.orgstat.yaml" ~/.orgstat.yaml
makeLink "./.Xresources" ~/.Xresources
makeLink "./categorize.cfg" ~/.arbtt/categorize.cfg
