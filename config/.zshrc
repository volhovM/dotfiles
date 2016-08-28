# Path to your oh-my-zsh installation.
export ZSH=/home/volhovm/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gianu"
#ZSH_THEME="flazz"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

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
plugins=(git colored-man vi-mode )
export GROFF_NO_SGR=1

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/x86_64-pc-linux-gnu/gcc-bin/4.8.3"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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
alias mv='mv -v'
alias cp='cp -v'
alias rm='rm -v'
alias cam="mplayer tv:// -tv driver=v4l2:width=640:height=480:device=/dev/video0 -fps 32"
alias speak="espeak -g 20mS -p 60 -a 150 -s 100"
alias noise="play -n -c1 synth whitenoise band -n 100 20 band -n 50 20 gain +25  fade h 1 864000 1"
alias gdb="gdb --tui"
alias screenshot="cd ~/pictures/screen/ && scrot -s"
alias instantphoto="cd ~/pictures/screen/ && (sleep 2 && scrot -u) & timeout 3 mplayer tv:// -tv driver=v4l2:width=640:height=480:device=/dev/video0 -fps 32 && cd -"
#alias rm='nocorrect rm -i'      # удаление с подтверждением
DEFAULT_USER="volhovm"
setopt NO_HUP
setopt NO_CHECK_JOBS
export PATH=/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/x86_64-pc-linux-gnu/gcc-bin/4.8.3:/sbin:/usr/games/bin:~/.cabal/bin/:/home/volhovm/programs/stack-0.1.5.0-x86_64-linux/ 
export EDITOR=vim
alias dvorak='setxkbmap -layout us,ru -variant dvorak,ruu -option "grp:caps_toggle" && xmodmap ~/.xmodmap'
alias undvorak='setxkbmap us,ru'
# ghc-pkg-reset
# # Removes all installed GHC/cabal packages, but not binaries, docs, etc.
# # Use this to get out of dependency hell and start over, at the cost of some rebuilding time.
function ghc-pkg-reset() {
    read "answ?erasing all your user ghc and cabal packages - are you sure (y/n) ? "
    if [[ "$answ" =~ ^[Yy]$ ]]
    then
        echo 'erasing directories under ~/.ghc'; rm -rf `find ~/.ghc -maxdepth 1 -type d`; \
	echo 'erasing ~/.cabal/lib'; rm -rf ~/.cabal/lib; \
#       echo 'erasing ~/.cabal/packages'; rm -rf ~/.cabal/packages; \
#       echo 'erasing ~/.cabal/share'; rm -rf ~/.cabal/share; \
    fi
}
export AWS_ACCESS_KEY_ID='AKIAIIYU5LMZ2VKM5G4A'
export AWS_SECRET_ACCESS_KEY='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'
