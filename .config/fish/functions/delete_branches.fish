
# Adapted from
# https://seb.jambor.dev/posts/improving-shell-workflows-with-fzf/
# https://github.com/sgrj/fzf-functions/blob/main/delete-branches/delete-branches.fish

function delete_branches --description 'Select and delete git branches'
    git branch |
        grep --invert-match '\*' |
        cut -c 3- |
        fzf --multi --preview="git log --color {}" |
        xargs --no-run-if-empty git branch --delete
end
