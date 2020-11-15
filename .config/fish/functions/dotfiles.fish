# Defined in - @ line 1
function dotfiles --wraps='/usr/bin/git --git-dir=/home/fulvio/.dotfiles/ --work-tree=/home/fulvio' --description 'Work with dotfiles git repo'
  /usr/bin/git --git-dir=/home/fulvio/.dotfiles/ --work-tree=/home/fulvio $argv;
end
