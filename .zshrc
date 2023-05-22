source $HOME/.config/zsh/export

#ZSH_THEME="robbyrussell"
plugins=(fzf zsh-autosuggestions fast-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source $HOME/.config/zsh/aliases
source $HOME/.config/zsh/utils.sh

if [ -z "$TMUX" ]
then
    tm
fi

eval "$(starship init zsh)"

