export PATH="$HOME/nvim-linux64/bin:/usr/local/go/bin:$HOME/go/bin:$PATH:/home/linuxbrew/.linuxbrew/bin:$HOME/.yarn/bin"
export GOPATH=$(go env GOPATH)

export HISTFILE=$HOME/.zsh_history
export HISTSIZE=9999
export SAVEHIST=999999
setopt hist_ignore_dups
setopt share_history

export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval `ssh-agent` && ssh-add $HOME/.ssh/id_rsa_reso

if [ $HOME/.zshrc -nt ~/.zshrc.zwc ]; then
  zcompile ~/.zshrc
fi

eval "$($HOME/starship/target/release/starship init zsh)"

# for WSL2
# My OS is not latest...
export WSL_IP_HOST=`ip a show eth0 | grep inet | grep -v inet6 | awk -F' ' '{print $2}' | awk -F'/' '{print $1}'`
export DISPLAY=$(awk '/nameserver/ {print $2}' /etc/resolv.conf):0.0

if [ ! -e "$HOME/.zplugin" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
fi

### Added by Zplugin's installer
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk
zplugin ice atclone"dircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh" nocompile'!'
zplugin light trapd00r/LS_COLORS
alias ls='ls --color=auto'


zplugin ice from"gh-r" as"program"
zplugin load junegunn/fzf-bin

zplugin ice as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' src"zhook.zsh"
zplugin light direnv/direnv

zplugin ice from"gh-r" as"program"
zplugin load stedolan/jq

zplugin light zdharma/fast-syntax-highlighting

zplugin ice as"program" pick:"bin/anyenv"
zplugin light anyenv/anyenv

eval "$(anyenv init -)"
export GODOCC_STYLE=solarized-dark


#export RUST_LOG=starship=debug starship
slack-status-changer &
