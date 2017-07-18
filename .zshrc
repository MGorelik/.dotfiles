# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/apathymac/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="bullet-train"

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
ENABLE_CORRECTION="true"

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

BULLETTRAIN_TIME_12HR="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
   export EDITOR='vim'
fi

# Compilation flags
 export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias zshconfig="v ~/.zshrc"
alias v="/usr/local/Cellar/vim/8.0.0005/bin/vim"

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true

export DJANGO_SETTINGS_MODULE=app.settings
alias si="cd ~/Workspace/seedinvest && source seedinvest/settings/local_environment.sh && source bin/activate"
alias sss="cd ~/Workspace/secure-storage-service/secure_storage_service && source secure_storage_service/settings/local_environment.sh  && source ../bin/activate"
alias siops="cd ~/Workspace/siops/siops && source siops/settings/local_environment.sh && source ../bin/activate"
alias icrm='cd ~/Workspace/investor-crm && source bin/activate && cd ~/Workspace/investor-crm/investor_crm && source investor_crm/settings/local_environment.sh && export DJANGO_SETTINGS_MODULE="investor_crm.settings.local"'
alias sis="si && ./manage.py shell_plus"
alias sss_s="sss && ./manage.py shell_plus --settings=secure_storage_service.settings.local"
alias ops_s="siops && ./manage.py shell_plus"
alias crm_s="icrm && ./manage.py shell_plus"
alias cel='python manage.py celeryd -l info --settings=seedinvest.settings.local_michael -Q email,engine,script,celery'
alias crmcel='icrm && python manage.py celeryd -l info -n crmwebapp.%h -c4 --settings=investor_crm.settings.celery.local'
alias grun='grunt watch'
alias tunnel='ssh -D 10013 ubuntu@ec2-54-208-139-18.compute-1.amazonaws.com'
alias loadsi="si && source seedinvest/settings/local_environment.sh && memcached -d && (redis-server /usr/local/etc/redis.conf --daemonize yes) && (/usr/local/sbin/rabbitmq-server -detached)"
alias loadops="ops && source siops/siops/settings/local_environment.sh"
alias run='python manage.py runserver --settings=seedinvest.settings.local_michael'
alias run_sss='./manage.py runserver 0.0.0.0:8001 --settings=secure_storage_service.settings.local'
alias run_ops='./manage.py runserver 0.0.0.0:8002 --settings=siops.settings.local'
alias run_crm='./manage.py runserver 0.0.0.0:8003 --settings=investor_crm.settings.local'
alias si_swarm='python manage.py si_swarm --settings=seedinvest.settings.local_michael'
alias test='python manage.py test seedinvest --settings=seedinvest.settings.local_test'
alias mq=/usr/local/sbin/rabbitmq-server
alias elasticsearch=/usr/local/bin/elasticsearch
alias bastion='ssh ubuntu@10.0.0.233'

eval "$(hub alias -s)"

# fish-like autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
