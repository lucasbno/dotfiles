export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:/home/lucasbno/.local/bin"
export PATH="$PATH:/home/lucasbno/.npm-global/bin"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'
export TERM='xterm-256color'
export EDITOR='lvim'
# fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

##################################
######### PLUGINS/ALIAS ##########
##################################

ZSH_THEME="robbyrussell"
plugins=(fzf zsh-autosuggestions fast-syntax-highlighting)

alias copy='xclip -selection clipboard'
alias c='codium'
alias code='codium'
alias pir='gh pr list | cut -f1,2 | gum choose | cut -f1 | xargs gh pr checkout'
# alias zathura="WD=\$(pwd);cd ~/books;nohup zathura \"\$(fzf)\""

bindkey '^f' fzf-cd-widget
bindkey -s "^g" 'git-main^M'

source $ZSH/oh-my-zsh.sh
source $HOME/.utils.sh
