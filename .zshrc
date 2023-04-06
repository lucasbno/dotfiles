export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:/home/lucasbno/.local/bin"
export PATH="$PATH:/home/lucasbno/.cargo/bin"
export PATH="$PATH:/home/lucasbno/.npm-global/bin"
export PATH="$PATH:/home/lucasbno/.config/awesome/scripts"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'
export TERM='xterm-256color'

##################################
######### PLUGINS/ALIAS ##########
##################################

ZSH_THEME="robbyrussell"
plugins=(fzf zsh-autosuggestions fast-syntax-highlighting)

alias copy='xclip -selection clipboard'
alias pir='gh pr list | cut -f1,2 | gum choose | cut -f1 | xargs gh pr checkout'
alias e='lvim ~/notes'
# alias zathura="WD=\$(pwd);cd ~/books;nohup zathura \"\$(fzf)\""

bindkey '^f' fzf-cd-widget
bindkey -s "^g" 'git-main^M'
bindkey '^ ' autosuggest-accept

source $ZSH/oh-my-zsh.sh
#source $HOME/.utils.sh

if [ -z "$TMUX" ]
then
    tm
fi
