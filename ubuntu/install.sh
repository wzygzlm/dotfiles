#!/bin/sh

# 1. Clone dotfiles: 
git clone https://github.com/wzygzlm/dotfiles.git

# 2. Install required package:
sudo apt-get install tmux mutt offlineimap ncdu ranger cmus vim python-pip xclip fonts-powerline msmtp cscope exuberant-ctags zathura

# 4. Clone powerline-shell and tmux-powerline: 
cd && git clone https://github.com/b-ryan/powerline-shell.git && git clone https://github.com/erikw/tmux-powerline.git

# 4. Install the powerline-shell: 
cd powerline-shell && sudo python setup.py install

# 5. Copy all the files from dotfiles/ubuntu to ~/.:
cd & cp -rf dotfiles/ubuntu/.[^.]* ~/ & cp -rf dotfiles/ubuntu/* ~/

# 6. Clone vim vundle:
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
