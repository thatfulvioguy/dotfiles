function cleanmerged -d "Clean up fully merged git branches"
	git branch --merged | grep -Ev "\*|main|master|development" | xargs -r -n 1 git branch -d
end
