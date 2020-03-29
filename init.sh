if [ "$(uname)" == 'Darwin' ]; then
    mac
fi

mac() {
    if !(type "brew" > /dev/null 2>&1); then
    	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    fi
    
    brew install git
    brew install wget
    
    
    wget https://raw.githubusercontent.com/anunez/one-dark-iterm/master/one-dark.itermcolors
    
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    
    cd
    
    if [ ! -e $HOME/dotfiles ]; then
    	git clone https://github.com/bookun/dotfiles.git
    fi
    
    if [ -e $HOME/.tmux.conf ]; then
    	rm $HOME/.tmux.conf
    fi

    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    
    cat brew_list.txt | xargs brew install
    cat brew_cask_list.txt | xargs brew cask install
    
    rm $HOME/.zshrc
    if [ ! -e $HOME/.config/nvim ]; then
    	mkdir -p $HOME/.config/nvim
    fi
    
    ln -s dotfiles/zsh/.zshrc_mac $HOME/.zshrc
    ln -s dotfiles/tmux/.tmux.conf $HOME/.tmux.conf
    ln -s dotfiles/nvim/init.vim $HOME/.config/nvim/init.vim
}
