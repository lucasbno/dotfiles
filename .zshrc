export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git fzf zsh-autosuggestions fast-syntax-highlighting)

source $HOME/.config/zsh/aliases
source $HOME/.config/zsh/utils.sh
source $HOME/.config/zsh/export

if [ -z "$TMUX" ]
then
    tm
fi

source $ZSH/oh-my-zsh.sh
