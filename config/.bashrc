alias cam="mplayer tv:// -tv driver=v4l2:width=640:height=480:device=/dev/video0 -fps 32"
alias speak="espeak -g 20mS -p 60 -a 150 -s 100"
alias noise="play -n -c1 synth whitenoise band -n 100 20 band -n 50 20 gain +25  fade h 1 864000 1"
alias gdb="gdb --tui"
alias screenshot="cd ~/pictures/screen/ && scrot -s"
alias instantphoto="cd ~/pictures/screen/ && (sleep 2 && scrot -u) & timeout 3 mplayer tv:// -tv driver=v4l2:width=640:height=480:device=/dev/video0 -fps 32 && cd -"
alias dvorak='setxkbmap -layout us,ru -variant dvorak,ruu -option "grp:caps_toggle" && xmodmap ~/.xmodmap'
alias undvorak='setxkbmap us,ru'
alias monon='xrandr --auto && xrandr --output VGA1 --primary --above LVDS1 --dpi 105'
alias monoff='xrandr --auto --dpi 105'
alias ledger="ledger -f ~/Dropbox/org/finances.dat"
alias nix-env-haskell="nix-env -qaP -f \"<nixpkgs>\" -A haskellPackages | grep "

alias d2h="perl -e 'printf qq|%X\n|, int( shift )'"
alias d2o="perl -e 'printf qq|%o\n|, int( shift )'"
alias d2b="perl -e 'printf qq|%b\n|, int( shift )'"
alias h2d="perl -e 'printf qq|%d\n|, hex( shift )'"
alias h2o="perl -e 'printf qq|%o\n|, hex( shift )'"
alias h2b="perl -e 'printf qq|%b\n|, hex( shift )'"
alias o2h="perl -e 'printf qq|%X\n|, oct( shift )'"
alias o2d="perl -e 'printf qq|%d\n|, oct( shift )'"
alias o2b="perl -e 'printf qq|%b\n|, oct( shift )'"

function xal {
  (xautolock -disable && sleep $(($1 * 60)) && xautolock -enable)&
}

export TERM='xterm-256color'
#export TERM='linux'
export EDITOR='vim'
export BROWSER='firefox'
export NIX_STACK='--nix'
PATH=$PATH:/home/volhovm/.local/bin
#export NIX_PATH="/home/volhovm/nixpkgsGlobal:$NIX_PATH"
set -o vi

function __prompt_command() {
    local EXIT="$?"             # This needs to be first

    #local Red='\[\e[0;31m\]'
    #local Gre='\[\e[0;32m\]'
    #local BYel='\[\e[1;33m\]'
    #local BBlu='\[\e[1;34m\]'
    #local Pur='\[\e[0;35m\]'

    local col0='\[\e[0m\]'
    local col_grey='\[$(tput setaf 241)\]'
    local col_green='\[\e[1;32m\]'
    local col_red='\[\e[1;31m\]'
    local col_purple='\[\e[1;35m\]'

    local ps_date="${col_grey}$(date +'%H:%M:%S')${col0}"
    local ps_whoami="${col_green}[\u@\h]${col0}"
    local ps_lambda="${col_purple}ξ> ${col0}"
    local ps_path="${col_purple}\w${col0}"
    if [ $EXIT != 0 ]; then
        ps_excode="${col_red}{$EXIT}${col0} "   
    else
        ps_excode=""    
    fi
    
    git_prompt() {
      local ref="$(git symbolic-ref -q HEAD 2>/dev/null)"
      if [ -n "$ref" ]; then
        echo "$(tput setaf 241)(${ref#refs/heads/}) "
      fi
    }

    #PS1="${ps1_date} ${ps1_user} ${ps1_path} \n${ps1_lambda} "
    PS1="${ps_date} ${ps_whoami} ${ps_excode}${ps_path} \$(git_prompt)\n${ps_lambda}"

}

export PROMPT_COMMAND=__prompt_command  # Func to gen PS1 after CMDs
