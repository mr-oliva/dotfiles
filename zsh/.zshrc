export PATH="$HOME/nvim-linux64/bin:/usr/local/go/bin:$HOME/go/bin:$HOME/.cargo/bin:$PATH:/home/linuxbrew/.linuxbrew/bin:$HOME/.yarn/bin"
export GOPATH=$(go env GOPATH)

export HISTFILE=$HOME/.zsh_history
export HISTSIZE=9999
export SAVEHIST=999999
setopt hist_ignore_dups
setopt share_history

export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_ALL=en_US.UTF-8
#export LANG="ja_JP.UTF-8"
#export LANGUAGE="ja_JP.UTF-8"
#export LC_ALL="ja_JP.UTF-8"
export TERM=xterm-256color

if [ "$TMUX" = "" ]; then
	slack-status-changer &
	tmux;
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval `ssh-agent` && ssh-add $HOME/.ssh/id_rsa_reso

if [ $HOME/.zshrc -nt ~/.zshrc.zwc ]; then
  zcompile ~/.zshrc
fi

eval "$($HOME/starship/target/release/starship init zsh)"

# for WSL2
# My OS is not latest...
export IP=`ip addr show eth0 | grep 'inet\b' | awk '{print $2}' | cut -d/ -f1`
export DISPLAY=$(awk '/nameserver/ {print $2}' /etc/resolv.conf):0.0

if [[ ! -n "${VIMRUNTIME}" ]]; then


export GTK_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export QT_IM_MODULE=fcitx
export DefaultIMModule=fcitx
#xset -r 49
#COUNT=`ps aux | grep -v "grep" | wc -l`
#if [ $COUNT -eq 0 ]; then
#    fcitx-autostart
#    #fcitx-config-gtk3
#fi

if [ ! -e "$HOME/.zinit" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
fi

### Added by Zplugin's installer
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk
zinit ice atclone"dircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh" nocompile'!'
zinit light trapd00r/LS_COLORS
alias ls='ls --color=auto'

zinit light b4b4r07/emoji-cli

zinit ice from"gh-r" as"program"
zinit load junegunn/fzf-bin

zinit ice as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' src"zhook.zsh"
zinit light direnv/direnv

zinit ice from"gh-r" as"program"
zinit load stedolan/jq

zinit light zdharma/fast-syntax-highlighting

zinit ice as"program" pick:"bin/anyenv"
zinit light anyenv/anyenv

zinit ice as"program" pick:"hub-linux-amd64-*/bin/hub" from:"gh-r"
zinit light github/hub

zinit ice wait'1' lucid as"program" pick"nvim*/bin/nvim" from:"gh-r"
zinit light neovim/neovim

zinit ice wait'3' lucid as"program" has"go" \
    atclone"GO111MODULE=on go install ./..." atpull"%atclone"
zinit light golang/tools

eval "$(anyenv init -)"
export GODOCC_STYLE=solarized-dark
fi

#export LIBGL_ALWAYS_INDIRECT=1

alias lg='lazygit'
