#!/bin/sh

# 1. Clone dotfiles: 
git clone https://github.com/wzygzlm/dotfiles.git

# 2. Install required package:
sudo apt-get install tmux mutt offlineimap ncdu ranger cmus vim python-pip xclip fonts-powerline msmtp cscope exuberant-ctags zathura zsh autojump

# 3. Clone powerline-shell and tmux-powerline: 
cd && git clone https://github.com/b-ryan/powerline-shell.git && git clone https://github.com/erikw/tmux-powerline.git

# 4. Install the powerline-shell: 
cd powerline-shell && sudo python setup.py install

# 5. Copy all the files from dotfiles/ubuntu to ~/.:
cd && cp -rf dotfiles/ubuntu/.[^.]* ~/ && cp -rf dotfiles/ubuntu/* ~/

# 6. Clone vim vundle:
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# 7. Clone zsh plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/popstas/zsh-command-time.git ~/.oh-my-zsh/custom/plugins/command-time
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ~/.oh-my-zsh/custom/plugins/you-should-use
git clone https://github.com/djui/alias-tips.git ~/.oh-my-zsh/custom/plugins/alias-tips
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# 8. Change shell from bash to zsh
chsh -s /usr/bin/zsh
