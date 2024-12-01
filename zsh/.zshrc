
############################
########## EXPORT ##########
############################

# See ~/.zshenv

########################################################################################
###  Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.  ###
###  Initialization code that may require console input (password prompts, [y/n]     ###
###  confirmations, etc.) must go above this block; everything else may go below.    ###
########################################################################################

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

###############################################################################
####### https://wiki.archlinux.org/index.php/Python/Virtual_environment #######
###############################################################################

# if [[ ! -d "$WORKON_HOME" ]]; then
#   mkdir -p "$WORKON_HOME"
# fi
# if [[ -a "/usr/bin/virtualenvwrapper_lazy.sh" ]]; then
#   source "/usr/bin/virtualenvwrapper_lazy.sh"
# elif [[ -a "/usr/share/virtualenvwrapper/virtualenvwrapper_lazy.sh" ]]; then
#   source "/usr/share/virtualenvwrapper/virtualenvwrapper_lazy.sh"
# fi


############################
########## HISTORY #########
############################

HISTFILE=$HOME/.zsh_history
HISTSIZE=99999999
SAVEHIST=$HISTSIZE


############################
########## PROMPT ##########
############################

autoload -U compinit && compinit
autoload -U colors && colors

# local host_color="green"
# if [ -n "$SSH_CLIENT" ]; then
#   local host_color="red"
# fi
#
# function virtualenv_info {
#   [ $VIRTUAL_ENV ] && echo '%B%F{black}─[%f%F{cyan}'`basename $VIRTUAL_ENV`'%f%F{black}]%f%b'
# }
# local VENV="\$(virtualenv_info)"
#
# # https://joshdick.net/2017/06/08/my_git_prompt_for_zsh_revisited.html
# # Echoes information about Git repository status when inside a Git repository
# git_info() {
#
#   # Exit if not inside a Git repository
#   ! git rev-parse --is-inside-work-tree > /dev/null 2>&1 && return
#
#   # Git branch/tag, or name-rev if on detached head
#   local GIT_LOCATION=${$(git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD)#(refs/heads/|tags/)}
#
#   local AHEAD="%F{red}⇡NUM%f"
#   local BEHIND="%F{cyan}⇣NUM%f"
#   local MERGING="%F{magenta}⚡︎%f"
#   local UNTRACKED="%F{red}●%f"
#   local MODIFIED="%F{yellow}●%f"
#   local STAGED="%F{green}●%f"
#
#   local -a DIVERGENCES
#   local -a FLAGS
#
#   local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
#   if [ "$NUM_AHEAD" -gt 0 ]; then
#     DIVERGENCES+=( "${AHEAD//NUM/$NUM_AHEAD}" )
#   fi
#
#   local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
#   if [ "$NUM_BEHIND" -gt 0 ]; then
#     DIVERGENCES+=( "${BEHIND//NUM/$NUM_BEHIND}" )
#   fi
#
#   local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
#   if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
#     FLAGS+=( "$MERGING" )
#   fi
#
#   if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
#     FLAGS+=( "$UNTRACKED" )
#   fi
#
#   if ! git diff --quiet 2> /dev/null; then
#     FLAGS+=( "$MODIFIED" )
#   fi
#
#   if ! git diff --cached --quiet 2> /dev/null; then
#     FLAGS+=( "$STAGED" )
#   fi
#
#   local -a GIT_INFO
#   GIT_INFO+=( "%F{white}±" )
#   [ -n "$GIT_STATUS" ] && GIT_INFO+=( "$GIT_STATUS" )
#   [[ ${#DIVERGENCES[@]} -ne 0 ]] && GIT_INFO+=( "${(j::)DIVERGENCES}" )
#   [[ ${#FLAGS[@]} -ne 0 ]] && GIT_INFO+=( "${(j::)FLAGS}" )
#   GIT_INFO+=( "%F{white}$GIT_LOCATION%f" )
#   echo "%B%F{black}─[%f%b${(j: :)GIT_INFO}%B%F{black}]%f%b"
# }
# local GITINFO="\$(git_info)"
#
# local lineup=$'\e[1A'
# local linedown=$'\e[1B'
# PS1="
# %B%F{black}[%f%F{${host_color}}%n%f%F{black}@%B%F{${host_color}}%M%f%F{black}]─[%f%F{white}%~%f%F{black}]${VENV}${GITINFO}%(?,,%B%F{black}─[%f%F{white}%?%f%b%B%F{black}])
# %B%F{green}λ%f%b "
# PS2="%B%F{green}ζ%f%b "
# PS3="%B%F{green}?%f%b "
# PS4="%B%F{green}+%f%b "
# # RPS1="%{$lineup%}%B%F{black}[%D %*]%f%b%{$linedown%} "


############################
########## ALIAS ###########
############################

alias         ...=../..
alias        ....=../../..
alias       .....=../../../..
alias      ......=../../../../..
alias     .......=../../../../../..
alias    ........=../../../../../../..
alias        quit="exit"
alias        fehb="feh --bg-fill $HOME/Pictures/wallpaper.png"
alias        grep="grep --color=auto"
alias        htop="htop -d 5"
alias       iftop="sudo iftop -c $HOME/.iftoprc"
alias           l="ls -alh --color=auto --group-directories-first"
alias      pacman="sudo pacman --color auto"
alias       pipup="sudo pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs sudo pip install --upgrade pip -U"
alias         a2c="aria2c -k1M -x16 -s16 -m16 -c --enable-http-pipelining=true"
alias        a2ct="aria2c --conf-path=/home/txtsd/.config/aria2/aria2.torrent"
alias         ydl="yt-dlp"
alias        apps="obmenu-generator -s -i -d && openbox --reconfigure"
alias    fastboot="sudo fastboot"
# alias        curl="curl --http2"
alias        make="make -j`nproc`"
alias         feh="feh -Sfilename -C $HOME/.local/share/fonts/ -M pf_arma_five/6 --scale-down"
alias         txz="tar -cvJf"
alias        vert="xrandr --output HDMI-A-0 --auto --rotate left && fehb"
alias        hori="xrandr --output HDMI-A-0 --auto --rotate normal && fehb"
alias       adbrb="adb reboot-bootloader"
alias       adbrr="adb reboot recovery"
alias         ref="sudo reflector -p https -l 15 -f 15 --threads 1 -x 'ftp\.' -x '\.biz' -x '\.cz' -x '\.cn' --save /etc/pacman.d/mirrorlist"
alias    devpacks="pacman -Qq | awk '/^.+(-cvs|-svn|-git|-hg|-bzr|-darcs)$/'"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg && sudo mkinitcpio -P"
alias         yay="yay --sudoloop"
alias   whatsmyip="curl ifconfig.co"
alias list-package-files="pacman -Qlq"
alias          sl="streamlink"
alias          fm="pcmanfm-qt"
# alias        java='java "$SILENT_JAVA_OPTIONS"'
alias       javac='javac -Xlint'
alias           e='eza -gl --group-directories-first'
alias          eg='eza -gl --group-directories-first --git-repos'
alias          ee='eza -gaal --group-directories-first'
alias         eeg='eza -gaal --group-directories-first --git-repos'
alias          et='eza -gl --group-directories-first --tree'
alias         eet='eza -gal --group-directories-first --tree'
alias         cpb='shellcheck -s bash -e SC2164,SC2034,SC2154 PKGBUILD && shfmt -i 2 -ci -kp -sr -s -bn --diff -ln bash PKGBUILD && namcap PKGBUILD'

alias    zshrc="subl $HOME/.zshrc"
alias  xinitrc="subl $HOME/.xinitrc"
alias     xres="subl $HOME/.Xresources"
alias  mpvconf="subl $HOME/.config/mpv/mpv.conf"
alias    vimrc="subl $HOME/.vimrc"
alias  defapps="subl $HOME/.config/mimeapps.list"

alias       gs="git status"
alias      gai="git add -i"
alias       gc="git commit -s"
alias      gcm="git commit -s -m"
alias       gd="git diff"
alias      gds="git diff --staged"
alias       gl="git lg"
alias      gll="git log"
alias      gca="git commit --amend"
alias        d="git difftool --no-symlinks --dir-diff"
alias       ds="git difftool --no-symlinks --dir-diff --staged"
alias     gaps="git add PKGBUILD .SRCINFO"
alias      gfp="git fetch && git pull --ff-only"

alias      pvs="pkgctl version setup"
alias      pvc="pkgctl version check"
alias      pvu="pkgctl version upgrade"
# alias       pb="env PKGDEST='/var/cache/pacman/ankylosaurus' pkgctl build && repo-add -n /var/cache/pacman/ankylosaurus/ankylosaurus.db.tar.gz \$(env PKGDEST='/var/cache/pacman/ankylosaurus' makepkg --packagelist)"
# alias      pbu="env PKGDEST='/var/cache/pacman/ankylosaurus' pkgctl build --update-checksums && repo-add -n /var/cache/pacman/ankylosaurus/ankylosaurus.db.tar.gz \$(env PKGDEST='/var/cache/pacman/ankylosaurus' makepkg --packagelist)"

[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

alias  orphans='[[ -n $(pacman -Qdt) ]] && sudo pacman -Rs $(pacman -Qdtq) || echo "no orphans to remove"'

alias tgovspider='scp -p scrapeit/spiders/gov_spider.py nanogiga:~/git/govsitetest/scrapeit/scrapeit/spiders/gov_spider.py'

alias     gist='nocorrect gist'
alias      git='nocorrect git'
alias      man='nocorrect man'
alias    mkdir='nocorrect mkdir'
alias       mv='nocorrect mv'
alias    mysql='nocorrect mysql'
alias     sudo='nocorrect sudo'
alias      vim='nocorrect vim'
alias     stow='nocorrect stow'


############################
######## COMPLETIONS #######
############################

compdef _pacman {powerpill,pill,yt,yaourt}=pacman
compdef _youtube-dl ydl
compdef _ssh {ssh,mosh}=ssh
compdef _cat up0x0st


############################
########## SETOPTS #########
############################

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

setopt cd_able_vars
setopt auto_remove_slash
setopt bg_nice
setopt auto_param_slash
setopt auto_cd
setopt correct
unsetopt correct_all
setopt hash_list_all
setopt short_loops

setopt interactive_comments
setopt list_packed
setopt long_list_jobs
setopt no_clobber
setopt extended_glob
# setopt numeric_glob_sort
# setopt noglob
setopt notify
setopt function_arg_zero

setopt auto_menu
setopt complete_in_word
setopt always_to_end
unsetopt menu_complete
unsetopt flowcontrol

setopt multios # this enables various goodness
               # ls > foo > bar
               # cmd > >(cmd1) > >(cmd2) # would redirect stdout from cmd to stdin of cmd1,2
               # make install > /tmp/logfile | grep -i error
setopt brace_ccl # {a-z} {0-2} etc expansion
setopt prompt_subst # allow substition with $PS1, etc. Needed for vcs_info
setopt no_beep

# https://stackoverflow.com/a/76746393
unsetopt pathdirs # Reduce slowdowns on completion


############################
######### KEYBINDS #########
############################

bindkey -e                                            # Use emacs key bindings

# Begin Prevention of Home/End ~

# autoload zkbd
# function zkbd_file() {
#     [[ -f $HOME/.zkbd/${TERM}-${VENDOR}-${OSTYPE} ]] && printf '%s' $HOME/".zkbd/${TERM}-${VENDOR}-${OSTYPE}" && return 0
#     [[ -f $HOME/.zkbd/${TERM}-${DISPLAY}          ]] && printf '%s' $HOME/".zkbd/${TERM}-${DISPLAY}"          && return 0
#     return 1
# }

# [[ ! -d $HOME/.zkbd ]] && mkdir $HOME/.zkbd
# keyfile=$(zkbd_file)
# ret=$?
# if [[ ${ret} -ne 0 ]]; then
#     zkbd
#     keyfile=$(zkbd_file)
#     ret=$?
# fi
# if [[ ${ret} -eq 0 ]] ; then
#     source "${keyfile}"
# else
#     printf 'Failed to setup keys using zkbd.\n'
# fi
# unfunction zkbd_file; unset keyfile ret

# End Prevention of Home/End ~

typeset -A key
key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}

key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}

key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}

key[Backspace]=${terminfo[kbs]}
key[S-Tab]=${terminfo[kcbt]}

bindkey '^R'                  history-incremental-search-backward # [Ctrl-R] - Search backward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.
bindkey '^F'                  history-incremental-search-forward # [Ctrl-R] - Search backward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.

bindkey "${key[PageUp]}"      history-search-backward             # [PageUp] - Up a line of history
bindkey "${key[PageDown]}"    history-search-forward              # [PageDown] - Down a line of history

bindkey "${key[Up]}"          up-line-or-search                   # start typing + [Up-Arrow] - fuzzy find history forward
bindkey "${key[Down]}"        down-line-or-search                 # start typing + [Down-Arrow] - fuzzy find history backward
bindkey "${key[Left]}"        backward-char                    # [Left]] - Move backward one character, without changing lines
bindkey "${key[Right]}"       forward-char                     # [Right]] - Move forward one character


bindkey "${key[Home]}"        beginning-of-line                # [Home] - Go to beginning of line
bindkey "${key[End]}"         end-of-line                      # [End] - Go to end of line

bindkey ' '                   magic-space                         # [Space] - do history expansion

bindkey '\e[1;5C'             vi-forward-word                        # [Ctrl-RightArrow] - move forward one word
bindkey '\e[1;5D'             vi-backward-word                       # [Ctrl-LeftArrow] - move backward one word
bindkey '\eOc'                vi-forward-word                        # [Ctrl-RightArrow] - move forward one word
bindkey '\eOd'                vi-backward-word                       # [Ctrl-LeftArrow] - move backward one word

bindkey '\e[1;2C'             forward-word                     # [Shift-RightArrow] - move forward one word
bindkey '\e[1;2D'             backward-word                    # [Shift-LeftArrow] - move backward one word
bindkey '\e[c'                forward-word                     # [Shift-RightArrow] - move forward one word
bindkey '\e[d'                backward-word                    # [Shift-LeftArrow] - move backward one word


bindkey '^W'                  backward-kill-word               # [Ctrl-W] - Delete words vi-mode not emacs-mode

bindkey "${key[Backspace]}"   backward-delete-char                # [Backspace] - delete backward
bindkey "${key[S-Tab]}"       reverse-menu-complete               # [Shift-Tab] - move through the completion menu backwards

bindkey "${key[Delete]}"      delete-char                         # [Delete] - delete forward
bindkey "${key[Insert]}"      overwrite-mode                      # [Insert] - overwrite mode

bindkey '^Z'                  undo                                # [Ctrl-Z] - Undo text modification
bindkey '^Y'                  redo                                # [Ctrl-Y] - Redo text modification

# file rename magick
bindkey "^[m"                 copy-prev-shell-word                # Unused - Consider using Meta key | Meta is Alt

# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e'            edit-command-line


# sudo will be inserted before the command
sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    [[ $BUFFER != sudo\ * ]] && LBUFFER="sudo $LBUFFER"
}
zle -N sudo-command-line
# Defined shortcut keys: [Esc] [Esc]
bindkey "\e\e"                sudo-command-line


############################
######## CONVENIENCE #######
############################

magic-single-quotes()   { if [[ $LBUFFER[-1] == \' ]]; then zle self-insert; zle .backward-char; else zle self-insert; fi };
magic-double-quotes()   { if [[ $LBUFFER[-1] == \" ]]; then zle self-insert; zle .backward-char; else zle self-insert; fi };
magic-parentheses()     { if [[ $LBUFFER[-1] == \( ]]; then zle self-insert; zle .backward-char; else zle self-insert; fi };
magic-square-brackets() { if [[ $LBUFFER[-1] == \[ ]]; then zle self-insert; zle .backward-char; else zle self-insert; fi };
magic-curly-brackets()  { if [[ $LBUFFER[-1] == \{ ]]; then zle self-insert; zle .backward-char; else zle self-insert; fi };
magic-angle-brackets()  { if [[ $LBUFFER[-1] == \< ]]; then zle self-insert; zle .backward-char; else zle self-insert; fi };

bindkey \' magic-single-quotes
bindkey \" magic-double-quotes
bindkey \) magic-parentheses
bindkey \] magic-square-brackets
bindkey \} magic-curly-brackets
bindkey \> magic-angle-brackets

zle -N magic-single-quotes
zle -N magic-double-quotes
zle -N magic-parentheses
zle -N magic-square-brackets
zle -N magic-curly-brackets
zle -N magic-angle-brackets

# autoload -U url-quote-magic
# zle -N self-insert url-quote-magic
# autoload -Uz bracketed-paste-magic
# zle -N bracketed-paste bracketed-paste-magic

function zsh_stats() {
  fc -l 1 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n20
}

function take() {
  mkdir -p $1
  cd $1
}

WORDCHARS=''
zmodload -i zsh/complist

# zstyle ':completion:*' rehash true  # Add this to pacman hook because it hurts tabcomplete performance
zstyle ':completion:*' menu select
# zstyle ':completion:*' file-sort name
# zstyle ':completion:*' format 'Completing %d'
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*' list-suffixes true
# zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' verbose true
zstyle ':completion:*' squeeze-slashes true
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)*==34=34}:${(s.:.)LS_COLORS}")';

# completing process IDs with menu selection
# zstyle ':completion:*:*:kill:*' menu yes select
# zstyle ':completion:*:kill:*'   force-list always

## case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'  # Hyphen Insensitive
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# disable named-directories autocompletion
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

# Use caching so that commands like apt and dpkg complete are useable
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR

# Don't complete uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm amanda apache at avahi avahi-autoipd beaglidx bin cacti canna \
        clamav daemon dbus distcache dnsmasq dovecot fax ftp games gdm \
        gkrellmd gopher hacluster haldaemon halt hsqldb ident junkbust kdm \
        ldap lp mail mailman mailnull man messagebus mldonkey mysql nagios \
        named netdump news nfsnobody nobody nscd ntp nut nx obsrun openvpn \
        operator pcap polkitd postfix postgres privoxy pulse pvm quagga radvd \
        rpc rpcuser rpm rtkit scard shutdown squid sshd statd svn sync tftp \
        usbmux uucp vcsa wwwrun xfs '_*'

# ... unless we really want to.
zstyle '*' single-ignored show

expand-or-complete-with-dots() {
  [[ -n "$terminfo[rmam]" && -n "$terminfo[smam]" ]] && echoti rmam
  echo -n "\e[31m...\e[0m"
  [[ -n "$terminfo[rmam]" && -n "$terminfo[smam]" ]] && echoti smam
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

function x() {
  if [[ -f "$1" ]]; then
    case "$1" in
      *.tar.lrz)
        b=$(basename "$1" .tar.lrz)
        lrztar -d "$1" && [[ -d "$b" ]] && cd "$b" ;;
      *.lrz)
        b=$(basename "$1" .lrz)
        lrunzip "$1" && [[ -d "$b" ]] && cd "$b" ;;
      *.tar.bz2)
        b=$(basename "$1" .tar.bz2)
        bsdtar xjf "$1" && [[ -d "$b" ]] && cd "$b" ;;
      *.bz2)
        b=$(basename "$1" .bz2)
        bunzip2 "$1" && [[ -d "$b" ]] && cd "$b" ;;
      *.tar.gz)
        b=$(basename "$1" .tar.gz)
        bsdtar xzf "$1" && [[ -d "$b" ]] && cd "$b" ;;
      *.gz)
        b=$(basename "$1" .gz)
        gunzip "$1" && [[ -d "$b" ]] && cd "$b" ;;
      *.tar.xz)
        b=$(basename "$1" .tar.xz)
        bsdtar Jxf "$1" && [[ -d "$b" ]] && cd "$b" ;;
      *.xz)
        b=$(basename "$1" .gz)
        xz -d "$1" && [[ -d "$b" ]] && cd "$b" ;;
      *.rar)
        b=$(basename "$1" .rar)
        unrar x "$1" && [[ -d "$b" ]] && cd "$b" ;;
      *.tar)
        b=$(basename "$1" .tar)
        bsdtar xf "$1" && [[ -d "$b" ]] && cd "$b" ;;
      *.tbz2)
        b=$(basename "$1" .tbz2)
        bsdtar xjf "$1" && [[ -d "$b" ]] && cd "$b" ;;
      *.tgz)
        b=$(basename "$1" .tgz)
        bsdtar xzf "$1" && [[ -d "$b" ]] && cd "$b" ;;
      *.zip)
        b=$(basename "$1" .zip)
        unzip "$1" && [[ -d "$b" ]] && cd "$b" ;;
      *.Z)
        b=$(basename "$1" .Z)
        uncompress "$1" && [[ -d "$b" ]] && cd "$b" ;;
      *.7z)
        b=$(basename "$1" .7z)
        7z x "$1" && [[ -d "$b" ]] && cd "$b" ;;
      *) echo "don't know how to extract '$1'..." && return 1;;
    esac
    return 0
  else
    echo "'$1' is not a valid file!"
    return 1
  fi
}

function dot_progress() {
  # Fancy progress function from Landley's Aboriginal Linux.
  # Useful for long rm, tar and such.
  # Usage:
  #     rm -rfv /foo | dot_progress
  local i='0'
  local line=''

  while read line; do
    i="$((i+1))"
    if [ "${i}" = '25' ]; then
        printf '.'
        i='0'
    fi
  done
  printf '\n'
}

function colortest() {
  # T=" # "
  for FGs in "    m" "   1m" "  30m" "1;30m" "  31m" "1;31m" "  32m" "1;32m" "  33m" "1;33m" \
             "  34m" "1;34m" "  35m" "1;35m" "  36m" "1;36m" "  37m" "1;37m"; do
    FG=${FGs// /}
    echo -en "\033[$FG $FGs "
    for BG in 40m 41m 42m 43m 44m 45m 46m 47m; do
      echo -en "$EINS \033[$FG\033[$BG $FGs \033[0m";
    done
    echo
  done
}

function pyclean() {
  # Clean python object and compiled files and folders
  find . -type f -name "*.py[co]" -delete
  find . -type d -name "__pycache__" -delete
}

# From http://6ftdan.com/allyourdev/2016/07/01/5-linux-video-editing-tool-tips/

function brighten() {
  INPUT_FILE=$1
  OUTPUT_FILE=$2
  ffmpeg -i "$INPUT_FILE" -vf curves=preset=lighter -c:a copy "$OUTPUT_FILE"
}

function slideshow() {
  FRAMERATE=$1
  IMAGE_SET=$2
  OUTPUT_FILE=$3
  ffmpeg -framerate $FRAMERATE -i "$IMAGE_SET" -codec copy "$OUTPUT_FILE"
}

function fadeout() {
  INPUT_FILE=$1
  OUTPUT_FILE=$2
  FADE_OFFSET=$3
  FADE_LENGTH=$4
  sox "$INPUT_FILE" "$OUTPUT_FILE" fade t 0 $FADE_OFFSET $FADE_LENGTH
}

function videosync() {
  INPUT_FILE=$1
  OUTPUT_FILE=$2
  OFFSET=$3
  ffmpeg -i $INPUT_FILE -itsoffset $OFFSET -i $INPUT_FILE -map 0:0 -map 1:1 -acodec copy -vcodec copy $OUTPUT_F
}

# From https://www.linuxjournal.com/content/generating-good-passwords-part-ii

function genpass() {
  uppers="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  lowers="abcdefghijklmnopqrstuvwxyz"
  digits="0123456789"
  punct="()./?;:[{]}|=+-_*&^%$#@!~"  # skip quotes
  punct="*^%$#@!~"  # skip quotes
  length=32
  RANDOM=`date +%N`
  while [[ ${#password} -lt $length ]] ; do
    case $(( $RANDOM % 7 )) in
      0|1 ) letter=${uppers:$(( $RANDOM % ${#uppers} )):1} ;;
      2|3 ) letter=${lowers:$(( $RANDOM % ${#lowers} )):1} ;;
      4|5 ) letter=${punct:$(( $RANDOM % ${#punct} )):1} ;;
      6 ) letter=${digits:$(( $RANDOM % ${#digits} )):1} ;;
    esac
    password="${password}$letter"
  done
  echo $password
  password=
}

# From http://stackoverflow.com/questions/1767384/ls-command-how-can-i-get-a-recursive-full-path-listing-one-line-per-file
# Needs to be fixed

function lsr() {
  ls -R $1 | awk '
  /:$/&&f{s=$0;f=0}
  /:$/&&!f{sub(/:$/,"");s=$0;f=1;next}
  NF&&f{ print s"/"$0 }'
}

# http://blog.pkh.me/p/21-high-quality-gif-with-ffmpeg.html

function gifenc() {
  touch /tmp/palette.png
  palette="/tmp/palette.png"

  # filters="fps=25,scale=854:-1:flags=lanczos:dither=bayer:bayer_scale=3"
  filters="fps=15,scale=640:-1:flags=lanczos"

  ffmpeg -v warning -i $1 -vf "$filters,palettegen" -y $palette
  ffmpeg -v warning -i $1 -i $palette -lavfi "$filters [x]; [x][1:v] paletteuse" -y $2

}

function ci() {
  for image in *.png;
  do
    mtime=$(stat -c %y "$image")
    # pngcrush -brute -rem alla -rem allb -rem text -reduce -check -q -s -ow "$image"
    oxipng --opt max --strip all --alpha --interlace 0 --threads 8 "$image"
    touch -d "$mtime" "$image"
  done
}

function up0x0st() {
  fullpath=$(readlink -f "$1")
  curl -F"file=@${fullpath}" https://0x0.st
}

function gpgsend() {
  gpg --keyserver hkps://keys.openpgp.org  --send-keys "$1"
  echo $?
  gpg --keyserver hkps://keyserver.ubuntu.com  --send-keys "$1"
  echo $?
  gpg --keyserver hkps://keys.mailvelope.com  --send-keys "$1"
  echo $?
  gpg --keyserver hkps://pgp.mit.edu  --send-keys "$1"
  echo $?
}

function gpgsearch() {
  gpg --keyserver hkps://keys.openpgp.org  --search-keys "$1"
  echo $?
  gpg --keyserver hkps://keyserver.ubuntu.com  --search-keys "$1"
  echo $?
  gpg --keyserver hkps://keys.mailvelope.com  --search-keys "$1"
  echo $?
  gpg --keyserver hkps://pgp.mit.edu  --search-keys "$1"
  echo $?
}

function mr_remotes() {
  git remote add sourcehut "git@git.sr.ht:~$1/$2"
  git remote add codeberg "git@codeberg.org:$1/$2.git"
  git remote add notabug "git@notabug.org:$1/$2.git"
  git remote add gitlab "git@gitlab.com:$1/${2:l}.git" # lower
  git remote add github "git@github.com:$1/$2.git"
  git remote add bitbucket "git@bitbucket.org:$1/${2:l}.git" # lower
}

function mr_links() {
  echo """
## Links

Project: <https://sr.ht/~$1/$2/> <br>
Sources: <https://sr.ht/~$1/$2/sources> <br>
Ticket Tracker: <https://todo.sr.ht/~$1/$2> <br>
Mailing List: <https://lists.sr.ht/~$1/$2> <br>

Mirrors: <br>
[Codeberg](https://codeberg.org/$1/$2) <br>
[NotABug](https://notabug.org/$1/$2) <br>
[GitLab](https://gitlab.com/$1/${2:l}) <br>
[GitHub](https://github.com/$1/$2) <br>
[Bitbucket](https://bitbucket.org/$1/${2:l}) <br>

If sourcehut is not feasible, contribution is welcome from across mirrors.
"""
}
function mr_links_only() {
  echo "
https://sr.ht/~$1/$2
https://codeberg.org/$1/$2
https://notabug.org/$1/$2
https://gitlab.com/$1/${2:l}
https://github.com/$1/$2
https://bitbucket.org/$1/${2:l}
"
}

function mr_remotes_delete() {
  git remote remove sourcehut
  git remote remove codeberg
  git remote remove notabug
  git remote remove gitlab
  git remote remove github
  git remote remove bitbucket
}

function mr_push() {
  git push sourcehut
  git push codeberg
  git push notabug
  git push gitlab
  git push github
  git push bitbucket
}

function mr_delete_tag() {
  git push sourcehut --delete $1
  git push codeberg --delete $1
  git push notabug --delete $1
  git push gitlab --delete $1
  git push github --delete $1
  git push bitbucket --delete $1
}

function c2av1() {
    zmodload zsh/mathfunc
    fn="${1}"
    len_lhs=$((${#fn}-4))
    fn_lhs=${fn::${len_lhs}}
    fn_rhs=${fn:${len_lhs}}
    fn_new=${fn_lhs}.av1.mkv
    mtime=$(stat -c %y "${fn}")

    # https://stackoverflow.com/a/47068801
    fps=$(ffmpeg -i ${fn} 2>&1 | sed -n "s/.*, \(.*\) fps.*/\1/p")
    keyframes=$((int(ceil($fps)) * 5))
    zmodload -u zsh/mathfunc

    ffmpeg -i "${fn}" -map 0 -c copy -c:v libsvtav1 -crf 35 -preset 6 -svtav1-params tune=0 -g $keyframes "${fn_new}"
    touch -d "$mtime" "$fn_new"
}

function c2av1_here() {
  list=$(find -maxdepth 1 -type f -printf "%s %f\n" | sort -n | cut --delimiter=" " -f 2-)

  setopt shwordsplit
  saveIFS=$IFS;
  IFS=$'\n';
  list_split=(${list})
  IFS=$saveIFS
  unsetopt shwordsplit

  for file in ${list_split};
  do
    _len_lhs_8=$((${#file}-8))
    _len_lhs_4=$((${#file}-4))
    file_rhs_8=${file:${_len_lhs_8}}
    file_rhs_4=${file:${_len_lhs_4}}
    if [[ ${file_rhs_8} != ".av1.mkv" ]];
    then
      if [[ ${file_rhs_4} != ".log" ]];
      then
        echo "\n"
        echo "Converting ${file}\n"
        c2av1 "${file}"
        sleep 2
        # rm "${file}"
      fi
    fi
  done
}

function cbz2rarjxl() {
  for file in *.cbz;
  do
    unzip "${file}" -d temp
    mtime=$(stat -c %y "${file}")
    fn=${file%".cbz"}
    cd temp
    fd -e png --max-depth 1 -j 2 -x cjxl {} "{.}.jxl" --brotli_effort=11 -e 9
    fd -e jpg --max-depth 1 -j 1 -x cjxl {} "{.}.jxl" --lossless_jpeg=1 --brotli_effort=11 -e 9
    rm *.png
    rm *.jpg
    rm *.jpeg
    rar a -r -m5 -rr10p "../${fn}.cbr" .
    touch -d "$mtime" "../${fn}.cbr"
    cd ..
    sleep 1
    rm -rf temp
    # rm "${file}"
  done
}

function bumppkgrel() {
  if [[ -a "PKGBUILD" ]]; then
    emulate sh -c 'source PKGBUILD'
    new_pkgrel=$((${pkgrel/.*}+1))
    if ! grep --extended-regexp --quiet --max-count=1 "^pkgrel=${pkgrel}$" PKGBUILD; then
      echo "Non-standard pkgrel declaration"
      return 1
    fi
    sed --regexp-extended "s|^(pkgrel=)${pkgrel}$|\1${new_pkgrel}|g" --in-place PKGBUILD
  else
    echo 'No PKGBUILD found!'
    return 1
  fi
}

function pbu() {
  env PKGDEST='/var/cache/pacman/ankylosaurus' pkgctl build "$@" && \
  repo-add -n /var/cache/pacman/ankylosaurus/ankylosaurus.db.tar.gz $(env PKGDEST='/var/cache/pacman/ankylosaurus' makepkg --packagelist)
}

function pbu() {
  env PKGDEST='/var/cache/pacman/ankylosaurus' pkgctl build --update-checksums "$@" && \
  repo-add -n /var/cache/pacman/ankylosaurus/ankylosaurus.db.tar.gz $(env PKGDEST='/var/cache/pacman/ankylosaurus' makepkg --packagelist)
}

############################
####### PROMPT AGAIN #######
############################

local cursor_root="\033]12;#f38ba8\007"
local cursor_remote="\033]12;#a6e3a1\007"
local cursor_regular="\033]12;#cdd6f4\007"

zle-line-init() {
  if [[ $EUID == 0 ]]; then
    echo -ne $cursor_root
  elif [[ -n "$SSH_CLIENT" ]] || [[ -n "$SSH_TTY" ]]; then
    echo -ne $cursor_remote
  else
    echo -ne $cursor_regular
  fi
  if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    echoti smkx
  fi
}

zle -N zle-line-init

zle-line-finish() {
  if [[ $EUID == 0 ]]; then
    echo -ne $cursor_root
  elif [[ -n "$SSH_CLIENT" ]] || [[ -n "$SSH_TTY" ]]; then
    echo -ne $cursor_remote
  else
    echo -ne $cursor_regular
  fi
  if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    echoti rmkx
  fi
}

zle -N zle-line-finish


############################
########## TITLE ###########
############################

function title {
  [[ "$EMACS" == *term* ]] && return

  # if $2 is unset use $1 as default
  # if it is set and empty, leave it as is
  : ${2=$1}

  if [[ "$TERM" == screen* ]]; then
    print -Pn "\ek$1:q\e\\" #set screen hardstatus, usually truncated at 20 chars
  elif [[ "$TERM" == xterm* ]] || [[ "$TERM" == rxvt* ]] || [[ "$TERM" == ansi ]] || [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
    print -Pn "\e]2;$2:q\a" #set window name
    print -Pn "\e]1;$1:q\a" #set icon (=tab) name
  fi
}

ZSH_THEME_TERM_TAB_TITLE_IDLE="%15<..<%~%<<" #15 char left truncated PWD
ZSH_THEME_TERM_TITLE_IDLE="%n@%M: %~"

# Runs before showing the prompt
function termsupport_precmd {
  title $ZSH_THEME_TERM_TAB_TITLE_IDLE $ZSH_THEME_TERM_TITLE_IDLE
}

# Runs before executing the command
function termsupport_preexec {
  emulate -L zsh
  setopt extended_glob

  # cmd name only, or if this is sudo or ssh, the next cmd
  local CMD=${1[(wr)^(*=*|sudo|ssh|rake|-*)]:gs/%/%%}
  local LINE="${2:gs/%/%%}"

  title '$CMD' '%100>...>$LINE%<<'
}

precmd_functions+=(termsupport_precmd)
preexec_functions+=(termsupport_preexec)

ttyctl -f

## workaround for handling TERM variable in multiple tmux sessions properly from http://sourceforge.net/p/tmux/mailman/message/32751663/ by Nicholas Marriott
if [[ -n ${TMUX} && -n ${commands[tmux]} ]];then
  case $(tmux showenv -g TERM 2>/dev/null) in
    *256color) ;&
    TERM=fbterm)
      TERM=screen-256color ;;
    *)
      TERM=screen
  esac
fi


# https://wiki.archlinux.org/index.php/zsh#The_.22command_not_found.22_hook
if [[ -a "/usr/share/doc/pkgfile/command-not-found.zsh" ]]; then
  source /usr/share/doc/pkgfile/command-not-found.zsh
fi

# https://wiki.archlinux.org/index.php/Zsh#Fish-like_syntax_highlighting
if [[ -a "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [[ -a "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# aur/git-extras
if [[ -a "/usr/share/doc/git-extras/git-extras-completion.zsh" ]]; then
  source /usr/share/doc/git-extras/git-extras-completion.zsh
fi

# broot
if [[ -a "/home/txtsd/.config/broot/launcher/bash/br" ]]; then
  source /home/txtsd/.config/broot/launcher/bash/br
fi

autoload -Uz compinit
fpath+=~/.zfunc

eval "$(zoxide init zsh --cmd cd)"

# pnpm
export PNPM_HOME="/home/txtsd/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# powerline10k

if [[ -a "/usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme" ]]; then
  source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
fi
