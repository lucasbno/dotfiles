if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
# export EDITOR="lvim"
# export VISUAL="lvim"
export PATH="$PATH:/home/lucasbno/.local/bin"
export PATH="$PATH:/home/lucasbno/.npm-global/bin"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'
export TERM='xterm-256color'
export GTK_THEME='Catppuccin-Mocha-Standard-Blue-Dark'
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

##################################
######### PLUGINS/ALIAS ##########
##################################

ZSH_THEME="awesomepanda"
plugins=(fzf zsh-autosuggestions fast-syntax-highlighting)

alias copy='xclip -selection clipboard'
alias c='codium'
alias code='codium'
alias pir='gh pr list | cut -f1,2 | gum choose | cut -f1 | xargs gh pr checkout'
# alias zathura="WD=\$(pwd);cd ~/books;nohup zathura \"\$(fzf)\""

bindkey '^f' fzf-cd-widget
bindkey -s "^g" 'git-main^M'

source $ZSH/oh-my-zsh.sh

# eval "$(starship init zsh)"

export N_PREFIX="$HOME/.local/bin/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

foo() { if [ "$1" = "bar" ]; then echo "doing something..."; fi; }
#source /home/lucasbno/.tmc-autocomplete.sh || true
source /home/lucasbno/.tmc-autocomplete.sh || true
