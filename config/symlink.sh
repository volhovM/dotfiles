#!/bin/bash

dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# $1 filename, $2 real path
function makeLink {
  rm $2
  ln -s $dir$1 $2
}

makeLink "/.xmobarrc" ~/.xmobarrc
makeLink "/.vimperatorrc" ~/.vimperatorrc
makeLink "/.xinitrc" ~/.xinitrc
makeLink "/xmonad.hs" ~/.xmonad/xmonad.hs
makeLink "/.emacs" ~/.emacs
makeLink "/.xmodmap" ~/.xmodmap
makeLink "/.zshrc" ~/.zshrc
makeLink "/.mrconfig" ~/.mrconfig
mkdir -p ~/.config/dunstrc/
makeLink "/dunstrc" ~/.config/dunst/dunstrc
makeLink "/.vimrc" ~/.vimrc
