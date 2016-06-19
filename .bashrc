alias tmux0='tmux a -t 0'
alias tmux1='tmux a -t 1'
alias ll='ls -lh'
alias la='ls -lAhF'
alias lr='la -rt'
alias vi='vim'
alias view='vi -R'
alias ..='cd ..'
alias -- -='cd -'
alias -g L='| less'
alias -g WC='| wc'
alias -g G='| grep'

#git aliases
alias gs="git status | ${(z)GIT_PAGER}"
alias gc="git commit -m"
alias gl="git log --decorate"
alias gd="git diff"
alias ga="git add -p"
alias deploy_to_stage="bundle exec cap staging deploy"
alias deploy_to_production="bundle exec cap production deploy"

#rails aliases
alias be='bundle exec'
alias rr='rails runner'
alias rc='rails console'
alias rs='rails server'

alias berr='bundle exec rails runner'
alias berc='bundle exec rails console'
alias bers='bundle exec rails server'
alias beru='bundle exec ruby'
alias beirb='bundle exec irb'
alias bersp='bundle exec rake spec'

alias generate_coverage='RAILS_ENV=test bundle exec foreman run rake spec:coverage'
alias generate_best_practices='be rails_best_practices -f html --output-file public/coverage/best_practices.html .'
alias generate_rubycritics='be rubycritic -p public/coverage/rubycritic/ app'
alias generate_rubocop='be rubocop --rails --format html -o public/coverage/rubocop.html app'
alias generate_brakeman='be brakeman -o public/coverage/brakeman.html'

alias fori='be foreman run'
alias foreman_dev='be foreman start -f Procfile-dev'
alias foriman='be foreman start'
alias foricons='be foreman run rails console'
alias guardian='be foreman run guard'




export EDITOR="vim"
export GIT_EDITOR="vim"
