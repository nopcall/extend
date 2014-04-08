#!/bin/sh

# It's a shell script for update purcell/emacs.d and nopcall/extend

extend_path=$(cd "$(dirname "$0")"; pwd)
echo $extend_path

# update extend itself
cd $extend_path && git submodule init && git submodule update && git pull

# set a variable for Mac's `sed `
if [ `uname` = "Darwin" ]; then
    mac_newline=$'\n'
    echo '\033[0;33;1m ' 'Its Mac X OS.' '\033[0m'
fi

# remove extend's link from .emacs.d
if [ ! -f "~/.emacs.d/extend" ]; then
    rm -rf ~/.emacs.d/extend
    echo '\033[0;33;1m ' 'Remove extend link success.' '\033[0m'
fi

# remove extend's load command from init.el
if [ `uname` = "Darwin" ];then
    sed -i '' "/init-extend/G " ~/.emacs.d/init.el  && sed -i '' '/init-extend/d' ~/.emacs.d/init.el
    echo '\033[0;33;1m ' 'Remove load command success' '\033[0m'
else if [ `uname` = "Linux" ]; then
    sed -i '/init-extend/d' ~/.emacs.d/init.el
    echo '\033[0;33;1m ' 'Remove load command success' '\033[0m'
fi
fi

# update purcell/emacs.d
cd ~/.emacs.d && git pull
echo '\033[0;33;1m ' 'Purcell/Emacs update accomplish.' '\033[0m'

# relink extend
ln -s $extend_path ~/.emacs.d/
if [ ! -f "~/.emacs.d/extend" ]; then
    echo '\033[0;33;1m ' 'Rebuild link success. ' '\033[0m'
fi

# add extend's load command from init.el
if [ `uname` = "Darwin" ];then
    sed -i '' "/init-locales/a\\$mac_newline \(load \(expand-file-name \"extend/init-extend.el\" user-emacs-directory\)\)" ~/.emacs.d/init.el
    echo '\033[0;33;1m ' 'Add load command success. ' '\033[0m'
else if [ `uname` = "Linux" ]; then
    sed -i "/init-locales/a \(load \(expand-file-name \"extend/init-extend.el\" user-emacs-directory\)\)" ~/.emacs.d/init.el
    echo '\033[0;33;1m ' 'Add load command success. ' '\033[0m'
fi
fi
