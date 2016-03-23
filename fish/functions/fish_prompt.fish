function fish_prompt --description "Write out the prompt"
  # Just calculate this once, to save a few cycles when displaying the prompt
  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  end

  set -l color_cwd
  set -l suffix
  switch $USER
  case root toor
    if set -q fish_color_cwd_root
      set color_cwd $fish_color_cwd_root
    else
      set color_cwd $fish_color_cwd
    end
    set suffix '#'
  case '*'
    set color_cwd $fish_color_cwd
    set suffix ''
  end

  

  echo -n -s "$USER" @ "$__fish_prompt_hostname" ':' (set_color $color_cwd) (prompt_pwd) (set_color normal) "$suffix" ' '
end

function __own_git_prompt
  if test -f ".git/HEAD"
    set da_branch (set_color red)" ("(cat .git/HEAD | rev | cut -d/ -f1 | rev)")"(set_color normal)
  else
    set da_branch ""
  end
  echo $da_branch
end


function __helpi
  set -l asdf ""
  if true; set -l asdf "a"; end
  echo $asdf
end

function __cachy_git_status
  set -l now_git_status_epoch (date +%s)
  if test $last_git_status_epoch
  else
    set -g last_git_status_msg ""
    set -g last_git_status_epoch  (date +%s)
  end
  if [ "$now_git_status_epoch" = "$last_git_status_epoch" ]
  else
    if [ `git status` ~= "" ]
      set -g last_git_status_msg ""
    else
      set -g last_git_status_msg "asdf"
    end
  end
  set -g last_git_status_epoch  (date +%s)
  echo $last_git_status_msg
end
