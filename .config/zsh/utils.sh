fzf-commit() {
  git log --oneline | fzf | cut -d' ' -f1 | copy
}

##xs() { xbps-query -Rs '*' | fzf -i --exact --prompt="Select package(s) to install: " --multi | awk '{print $2}' | xargs -ro sudo xbps-install -S }

xs () { xbps-query -Rs '*' | awk '{print $2}' | fzf --prompt="Select package(s) to install: " --multi --border --height 80% | xargs -ro sudo xbps-install -Sy }
