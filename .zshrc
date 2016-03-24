#
# /etc/zshrc is sourced in interactive shells.  It
# should contain commands to set up aliases, functions,
# options, key bindings, etc.
#
source $ZSH/oh-my-zsh.sh

## shell functions
#setenv() { export $1=$2 }  # csh compatibility

# Set prompts
#PROMPT='[%n@%m]%~%# '    # default prompt
#RPROMPT=' %~'     # prompt for right side of screen

# bindkey -v             # vi key bindings
# bindkey -e             # emacs key bindings
bindkey ' ' magic-space  # also do history expansion on space

_src_etc_profile_d()
{
    #  Make the *.sh things happier, and have possible ~/.zshenv options like
    # NOMATCH ignored.
    emulate -L ksh


    # from bashrc, with zsh fixes
    if [[ ! -o login ]]; then # We're not a login shell
        for i in /etc/profile.d/*.sh; do
	    if [ -r "$i" ]; then
	        . $i
	    fi
        done
        unset i
    fi
}
_src_etc_profile_d

unset -f _src_etc_profile_d


############# START OF PERSONAL ZSHRC ###################

autoload -U compinit && compinit
autoload -U colors && colors

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

## history
setopt TRANSIENT_RPROMPT
setopt APPEND_HISTORY # append to the file instead of rewriting it
setopt hist_ignore_all_dups   # no dupes in hist
setopt hist_ignore_space      # ignore commands with a leading space
setopt HIST_IGNORE_SPACE # ignore commands with a leading space
setopt HIST_NO_STORE # don't store the 'history' command
setopt HIST_SAVE_NO_DUPS # don't save duplicates to the history file
setopt HIST_EXPIRE_DUPS_FIRST # forget duplicates first if the internal (running) history gets too large
#### MAKES SHELL INCREDIBLE SLOW OVER GLUSTERNFS!!
#setopt HIST_FCNTL_LOCK # better performance if history file is stored over NFS
setopt CORRECT # correct misspelled commands



# only do a visual bell
ZBEEP='\e[?5h\e[?5l'
setopt NO_BEEP

# do not push prompt around. it's annoying when you are trained
# and used to find the prompt at the same place, espcially with
# huge completions.
unsetopt ALWAYS_LAST_PROMPT

# fix delete key for xterms
bindkey    "^[[3~"          delete-char # fix delete key for xterms

# SOME KEY MAPPING
bindkey '^R' history-incremental-search-backward
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"    history-beginning-search-backward
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}"  history-beginning-search-forward
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward


############### OH MY ZSH #########################
# Path to your oh-my-zsh installation.

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="random"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git rails ruby git-prompt gitfast)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

#if $ZSH; then
#  source $ZSH/oh-my-zsh.sh
#fi

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


############### END OF OF MY ZSH ##################


# show this many characters of pwd (includes "...")
pwdmaxlen=23


####### PROMPT ############################################
##
#

setopt prompt_subst

unset RPROMPT
#PROMPT='[%n@%m]%~%# '    # default prompt

#no more login prompt in not so login shells
[[ $- == *i* ]] || return
[[ `uname` == Linux ]] && alias ls='ls --color=auto'
zstyle ':completion:*:*:*:*:hosts' list-colors '=*=01'
zstyle ':completion:*:*:*:*:users' list-colors '=*=32'


# OMFG PROMPT ON MY OWN

PROMPT='$(_user_host):$(_prompt_dir)$(_stillharts_gitprompt) '
#RPROMPT='$(_stillharts_gitprompt)'

function _user_host() {
  echo "$(_user)$(_at)$(_host)"
}

function _user() {
  echo "$fg[black]%n$reset_color"
}

function _at() {
  echo "$fg_bold[black]@$reset_color"
}

function _host() {
  if [[ $HOSTNAME =~ 'dev' ]]
  then
    echo "$fg[green]%m$reset_color"
  else
    echo "$fg[blue]%m$reset_color"
  fi
}



#3 folders depth 
function _prompt_dir() {
  echo "$fg[cyan]%3~$reset_color"
}

export GIT_PS1_SHOWCOLORHINTS=true
function _stillharts_gitprompt() {
  echo "$fg[red]$(git_prompt_info)$reset_color"
}


############# ZLE ###########
typeset -a zle_highlight

# make default command line text bold
zle_highlight+="default:bold"

# highlight the matching part when searching with ^R
zle_highlight+="isearch:fg=1"

############# -> END ZLE ####


########## COLORS


########## -> END COLORS


#
##
######## END OF PROMPT #######################################



####### ALIASES #############################################
##
#
#alias tmux='TERM=xterm-256color tmux'
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



############## END OF ALIASES ##############################


############## ENV VARS ####################################


export GOPATH='~/bin/'
export GREP_OPTIONS="--color=auto"
export EDITOR="vim"
export GIT_EDITOR="vim"
export LESS=""
export REPORTTIME=2
REPORTTIME=2
export HISTSIZE=10000
export SAVEHIST=300000
LESS+=" --LONG-PROMPT" # show long prompt
LESS+=" --ignore-case" # ignore case unless upper case letters were typed
LESS+=" --quit-if-one-screen" # quit if everytying fits into one screen
LESS+=" --RAW-CONTROL-CHARS" # display ANSI (color) control chars as is
LESS+=" --no-init" # don't clear the screen before paging
export GIT_PAGER="less $LESS"
export TERM=xterm-256color

#### CORRECT LOG PATH IN ANYCASE FOR ZSH
if [ -d "~/log" ]
then
  export HISTFILE=~/log/.zsh_his/prompt
tory
else
  export HISTFILE=~/.zsh_history
fi


source ~/.zshrc_local

