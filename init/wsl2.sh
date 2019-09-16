sudo apt update -y

tmux -h
if [ $? -ne 0 ]; then
    sudo apt install tmux -y
fi

ructc -h
if [ $? -ne 0 ]; then
    curl https://sh.rustup.rs -sSf | sh
fi

nvim -h
if [ $? -ne 0 ]; then
    wget https://github.com/neovim/neovim/releases/download/v0.4.2/nvim-linux64.tar.gz
    tar xvf nvim-linux64
    nvim +PlugUpdate +qall > /dev/null
fi

go -h
if [ $? -ne 0 ]; then
    wget https://dl.google.com/go/go1.13.linux-amd64.tar.gz
    sudo tar -C /usr/local -xvf go1.13.linux-amd64.tar.gz
    GO111MODULE=on go get golang.org/x/tools/gopls@latest
then
