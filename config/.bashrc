alias cam="mplayer tv:// -tv driver=v4l2:width=640:height=480:device=/dev/video0 -fps 32"
alias speak="espeak -g 20mS -p 60 -a 150 -s 100"
alias noise="play -n -c1 synth whitenoise band -n 100 20 band -n 50 20 gain +25  fade h 1 864000 1"
alias gdb="gdb --tui"
alias screenshot="cd ~/pictures/screen/ && scrot -s"
alias instantphoto="cd ~/pictures/screen/ && (sleep 2 && scrot -u) & timeout 3 mplayer tv:// -tv driver=v4l2:width=640:height=480:device=/dev/video0 -fps 32 && cd -"
alias dvorak='setxkbmap -layout pl,ru -variant dvorak,ruu -option "grp:caps_toggle" && xmodmap ~/.xmodmap'
alias undvorak='setxkbmap us,ru'
function fgon { feh --bg-fill ~/wallpaper.jpg; }
function monon { xrandr --auto && xrandr --output VGA-1 --primary --above eDP1 --dpi 100; fgon; }
function mononhdmi { xrandr --auto && xrandr --output HDMI2 --primary --above eDP1; fgon; }
function monoff { xrandr --auto --dpi 100; fgon; }
alias ledger="ledger --explicit --strict -f ~/org/finances.dat"
alias nix-env-haskell="nix-env -qaP -f \"<nixpkgs>\" -A haskellPackages | grep "
alias sbuild="stack build --fast -j 2 --test --bench --no-run-tests --no-run-benchmarks"
alias grep="grep --color=auto"
function notify {
#  pitch=$(($RANDOM % 50 - 25))
#  rate=$(($RANDOM % 30 - 15))
#
#  notPhrase[0]="The task is over"
#  notPhrase[1]="The task was completed"
#  notPhrase[2]="Task is finished"
#  notPhrase[3]="Get back to work"
#
#  rand=$[ $RANDOM % 4 ]
#  chosenPhrase=${notPhrase[$rand]}
#  spd-say --rate $rate --pitch $pitch "$chosenPhrase"
 
  paplay ~/dotfiles/scripts/just-like-magic.ogg&
  curtime=$(date +%T)
  notify-send -u critical "$curtime Task is over"
}

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

#export NIX_PATH="/home/volhovm/nixpkgsGlobal:$NIX_PATH"
export TERM='xterm-256color'
# export TERM='xterm'
export EDITOR='vim'
export BROWSER='firefox'
export NIX_STACK='--nix'

export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

PATH=$PATH:/home/volhovm/.local/bin
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
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:'

