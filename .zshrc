export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="robbyrussell"
plugins=(tmux git fzf zsh-autosuggestions fast-syntax-highlighting)

source $HOME/.config/zsh/aliases
source $HOME/.config/zsh/utils.sh
source $HOME/.config/zsh/export
source $ZSH/oh-my-zsh.sh

if [ -z "$TMUX" ]
then
    tm
fi

teste-24() {
  preview="yadm diff --color=always -- {-1}"
  yadm diff --name-only | fzf -m --ansi --preview $preview
}

source $HOME/.config/zsh/prompt
