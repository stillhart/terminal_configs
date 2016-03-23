function fish_right_prompt
  echo -n -s (__own_git_prompt)
end

function __own_git_prompt
  if test -f ".git/HEAD"
    set da_branch (set_color red)" ("(cat .git/HEAD | rev | cut -d/ -f1 | rev)")"(set_color normal)
  else
    set da_branch ""
  end
  echo $da_branch
end
