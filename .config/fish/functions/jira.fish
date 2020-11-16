
function jira --description 'Open the given Jira issue'
    if not set -q jira_url
        echo "\$jira_url not set"
        echo "Add a file with 'set -g jira_url https://this-envs-jira' to \$__fish_config_dir/conf.d/"
        return 1
    else
	   xdg-open "$jira_url/browse/$argv[1]"
    end
end
