fzf-commit() {
  git log --oneline | fzf | cut -d' ' -f1 | copy
}
