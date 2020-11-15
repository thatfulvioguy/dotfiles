
# Jabba inserts this to the end of config.fish instead of creating a file like this
# It also hardcodes the home path when it shouldn't
if not functions -q jabba
    [ -s "$HOME/.jabba/jabba.fish" ]; and source "$HOME/.jabba/jabba.fish"
else
    echo "Jabba was already loaded - did you not remove the junk it added to config.fish?"
end
