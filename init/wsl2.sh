sudo apt update -y
sudo apt install zsh -y

tmux -h
if [ $? -ne 0 ]; then
    sudo apt install tmux -y
fi

ructc -h
if [ $? -ne 0 ]; then
    curl https://sh.rustup.rs -sSf | sh
fi

npm -h
if [ $? -ne 0 ]; then
    sudo apt install npm -y
fi

yarn -h
if [ $? -ne 0 ]; then
    sudo npm install -g yarn
fi


nvim -h
if [ $? -ne 0 ]; then
    if [ ! -e nvim-linux64.tar.gz ]; then
        wget https://github.com/neovim/neovim/releases/download/v0.4.2/nvim-linux64.tar.gz
    fi
    if [ ! -e nvim-linux64 ]; then
        tar xvf nvim-linux64
    fi
    if [ ! -e ~/.local/share/nvim/site/autoload/plug.vim ]; then
        curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi
    nvim +PlugUpdate +qall > /dev/null
fi

go -h
if [ $? -ne 0 ]; then
    wget https://dl.google.com/go/go1.13.linux-amd64.tar.gz
    sudo tar -C /usr/local -xvf go1.13.linux-amd64.tar.gz
    GO111MODULE=on go get golang.org/x/tools/gopls@latest
then
