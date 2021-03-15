
# bobthefish settings

set -g theme_display_date no
set -g theme_display_vi no
set -g theme_display_ruby no
set -g theme_display_vagrant no
set -g theme_display_hg no

set -g theme_title_display_process yes
set -g theme_display_k8s_context yes
set -g theme_display_k8s_namespace yes

# Disable powerline symbols in virtual ttys ($TERM will be some variant of "xterm" under a windowing system)
if [ "$TERM" = 'linux' ]
    set -g theme_powerline_fonts no
end
