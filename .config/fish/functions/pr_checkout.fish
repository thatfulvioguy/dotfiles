
# Adapted from
# https://seb.jambor.dev/posts/improving-shell-workflows-with-fzf/
# https://github.com/sgrj/fzf-functions/blob/main/pr-checkout/pr-checkout.fish

function pr_checkout
    set -l jq_template '"'\
'#\(.number) - \(.title)'\
'\t'\
'Author: \(.user.login) '\
'Created: \(.created_at | fromdateiso8601 | strflocaltime("%Y-%m-%d %H:%M %Z")) '\
'Updated: \(.updated_at | fromdateiso8601 | strflocaltime("%Y-%m-%d %H:%M %Z"))\n\n'\
'\(.body)'\
'"'

    set -l pr_number (
      gh api 'repos/:owner/:repo/pulls' |
      jq ".[] | $jq_template" |
      sed -e 's/"\(.*\)"/\1/' -e 's/\\\\t/\t/' |
      fzf \
        --with-nth=1 \
        --delimiter='\t' \
        --preview='echo -e {2} | bat --style plain --color always --language md' \
        --preview-window=top:wrap |
      sed 's/^#\([0-9]\+\).*/\1/'
    )

    if [ -n "$pr_number" ]
        gh pr checkout "$pr_number"
    end
end
