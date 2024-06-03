fzf-commit() {
  git log --oneline | fzf | cut -d' ' -f1 | copy
}

git-checkout() {
  BRANCH=$(git branch | cut -c 3- | gum choose)
  git checkout $BRANCH
}

git-update() {
  BRANCH=$(git branch | cut -c 3- | gum choose)

  git fetch upstream

  git checkout $BRANCH

  git merge upstream/$BRANCH 

  git push origin
}

git-download() {
  if [ "$#" -eq  "0" ]
    then
      BRANCH=$(gum input --placeholder "Digite o nome da branch")
  else
      BRANCH=$1
  fi

  git fetch upstream

  git checkout -b $BRANCH upstream/$BRANCH

  git push --set-upstream origin $BRANCH
}


##xs() { xbps-query -Rs '*' | fzf -i --exact --prompt="Select package(s) to install: " --multi | awk '{print $2}' | xargs -ro sudo xbps-install -S }

xs () { xbps-query -Rs '*' | awk '{print $2}' | fzf --prompt="Select package(s) to install: " --multi --border --height 80% | xargs -ro sudo xbps-install -Sy }
