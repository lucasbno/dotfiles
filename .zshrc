export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="robbyrussell"
plugins=(tmux git fzf zsh-autosuggestions fast-syntax-highlighting)

source $HOME/.config/zsh/utils.sh
source $HOME/.config/zsh/export
source $ZSH/oh-my-zsh.sh
source $HOME/.config/zsh/aliases
source $HOME/.config/zsh/prompt

if [ -z "$TMUX" ]
then
    tm
fi

# source $HOME/.config/zsh/prompt
# eval "$(starship init zsh)"
export DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus"
eval "$(zoxide init zsh)"
