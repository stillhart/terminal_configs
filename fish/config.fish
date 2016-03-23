# CHRUBY
if test -f "/usr/share/chruby/chruby.sh"
  set -gx CHRUBY_ROOT "/usr"
  source /usr/local/share/chruby/chruby.fish
end

if test -f "/usr/share/chruby/auto.sh"
  set -gx CHRUBY_ROOT "/usr"
  source /usr/local/share/chruby/auto.fish
end



set -x GREP_OPTIONS "--color=auto"
set -x EDITOR "vim"
set -x GIT_EDITOR "vim"
set -x REPORTTIME 2
set -x GIT_PAGER "less $LESS"

set fish_greeting ""

. ~/.config/fish/config_local.fish
. ~/.config/fish/aliases.fish
. ~/.config/fish/aliases_local.fish
