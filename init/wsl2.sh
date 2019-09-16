sudo apt update

tmux -h
if [ $? -ne 0 ]; then
    sudo apt install tmux
fi
