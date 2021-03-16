# Defined in - @ line 1
function dotfiles --wraps="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME" --description 'Work with dotfiles git repo'
  /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $argv;
end
