sudo apt update -y
sudo apt install zsh -y

ln -s `pwd`/zsh/.zshrc ~/.zshrc
ln -s `pwd`/tmux/.tmux.conf ~/.tmux.conf
ln -s `pwd`/nvim ~/.config/nvim 
chsh -s /usr/bin/zsh

sh ./init/wsl2.sh
