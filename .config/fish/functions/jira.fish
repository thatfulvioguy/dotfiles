
# Adapted very loosely from
# https://seb.jambor.dev/posts/improving-shell-workflows-with-fzf/
# https://github.com/sgrj/fzf-functions/blob/main/create-branch/create-branch.fish

# Useful snippets for jira_query:

# https://bipulkkuri.medium.com/jira-jql-cheat-sheet-788c0eae25ed
# set -l in_next_sprint "(sprint is not EMPTY AND sprint not in openSprints() AND sprint not in closedSprints())"

# https://community.atlassian.com/t5/Jira-questions/Re-Function-in-JQL-for-current-sprint/qaq-p/45772/comment-id/19409#M19409
# set -l in_current_sprint "(sprint in openSprints() and sprint not in futureSprints())"

# set -l not_done "(statusCategory != Done)"

function jira --description 'Open the given Jira issue or begin a search for one'
    if not set -q jira_url jira_query jira_user jira_token
        echo "One or more of jira_url, jira_query, jira_user, jira_token not set"
        echo "Add a file with 'set -g jira_url https://this-envs-jira' etc. to \$__fish_config_dir/conf.d/"
        return 1
    else if [ -n "$argv[1]" ]
        jira_open $argv[1]
    else

        set -l jq_template '"'\
'\(.key) \(.fields.summary)'\
'\t'\
'Reporter: \(.fields.reporter.displayName)\n'\
'Created: \(.fields.created)\n'\
'Updated: \(.fields.updated)\n\n'\
'\(.fields.description)'\
'"'
        # can't get higher than 100 results without pagination...
        set -l key (
            curl \
                --data-urlencode "jql=$jira_query" \
                --data-urlencode "fields=summary,reporter,created,updated,description" \
                --data-urlencode "maxResults=100" \
                --get \
                --user "$jira_user:$jira_token" \
                --silent \
                --compressed \
                $jira_url'/rest/api/2/search' |
            jq ".issues[] | $jq_template" |
            sed -e 's/"\(.*\)"/\1/' -e 's/\\\\t/\t/' |
            fzf \
                --with-nth=1 \
                --delimiter='\t' \
                --preview='echo -e {2}' \
                --preview-window=top:wrap |
            awk '{printf "%s", $1}'
        )

        if [ -n "$key" ]
            jira_open "$key"
        end
    end

    
end
