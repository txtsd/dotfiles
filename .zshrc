############################
########## HISTORY #########
############################

HISTFILE=~/.zsh_history
HISTSIZE=99999999
SAVEHIST=99999999


############################
########## PROMPT ##########
############################

autoload -U compinit && compinit
autoload -U colors && colors

local host_color="green"
if [ -n "$SSH_CLIENT" ]; then
  local host_color="red"
fi

PROMPT="
%{$fg_bold[grey]%}┌[%{$fg_bold[${host_color}]%}%n%{$reset_color%}%{$fg_bold[grey]%}@%{$fg_bold[${host_color}]%}%m%{$reset_color%}%{$fg_bold[grey]%}]─[%{$fg_bold[white]%}%~%{$reset_color%}%{$fg_bold[grey]%}] %(?,,%{$fg_bold[grey]%}[%{$fg_bold[white]%}%?%{$reset_color%}%{$fg_bold[grey]%}])
%{$fg_bold[grey]%}└─▶%{$reset_color%} "
PS2="%{$fg_bold[grey]%}├─▶%{$reset_color%} "

if [[ $USER == "root" ]]; then
  CARETCOLOR="red"
else
  CARETCOLOR="white"
fi


############################
########## ALIAS ###########
############################

alias      ...=../..
alias     ....=../../..
alias    .....=../../../..
alias   ......=../../../../..
alias  .......=../../../../../..
alias ........=../../../../../../..
alias     fehb="feh --bg-fill ~/Pictures/wallpaper.png"
alias     grep="grep --color=auto"
alias     htop="sudo htop -d 5"
alias    iftop="sudo iftop -c ~/.iftoprc"
alias     java="`which java` -Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"
alias    javac="`which javac` -Xlint"
alias        l="ls -alh --color=auto --group-directories-first"
alias       mm="mmaker -vf Openbox3"
alias       nn="nano"
alias     pcmn="sudo pacman --color auto"
alias    pipup="sudo pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs sudo pip install --upgrade pip -U"
alias      snn="sudo nano"
alias       yt="yaourt"

alias   ebuild='nocorrect ebuild'
alias     gist='nocorrect gist'
alias      git='nocorrect git'
alias   heroku='nocorrect heroku'
alias  hpodder='nocorrect hpodder'
alias      man='nocorrect man'
alias    mkdir='nocorrect mkdir'
alias       mv='nocorrect mv'
alias    mysql='nocorrect mysql'
alias     sudo='nocorrect sudo'


############################
########## EXPORT ##########
############################

export LANG=en_US.UTF-8
export PATH=~/.gem/ruby/2.2.0/bin:$PATH
export JAVA_FONTS=/usr/share/fonts/TTF
export EDITOR="vim"


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
setopt correct_all
setopt hash_list_all
setopt short_loops

setopt interactive_comments
setopt list_packed
setopt long_list_jobs
setopt no_clobber
setopt extended_glob
setopt numeric_glob_sort
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


############################
######## CONVENIENCE #######
############################

magic-single-quotes()   { if [[ $LBUFFER[-1] == \' ]]; then zle self-insert; zle .backward-char; else zle self-insert; fi }; bindkey \' magic-single-quotes
magic-double-quotes()   { if [[ $LBUFFER[-1] == \" ]]; then zle self-insert; zle .backward-char; else zle self-insert; fi }; bindkey \" magic-double-quotes
magic-parentheses()     { if [[ $LBUFFER[-1] == \( ]]; then zle self-insert; zle .backward-char; else zle self-insert; fi }; bindkey \) magic-parentheses
magic-square-brackets() { if [[ $LBUFFER[-1] == \[ ]]; then zle self-insert; zle .backward-char; else zle self-insert; fi }; bindkey \] magic-square-brackets
magic-curly-brackets()  { if [[ $LBUFFER[-1] == \{ ]]; then zle self-insert; zle .backward-char; else zle self-insert; fi }; bindkey \} magic-curly-brackets
magic-angle-brackets()  { if [[ $LBUFFER[-1] == \< ]]; then zle self-insert; zle .backward-char; else zle self-insert; fi }; bindkey \> magic-angle-brackets
zle -N magic-single-quotes
zle -N magic-double-quotes
zle -N magic-parentheses
zle -N magic-square-brackets
zle -N magic-curly-brackets
zle -N magic-angle-brackets

# autoload -U url-quote-magic
# zle -N self-insert url-quote-magic

if [[ -z "$LC_CTYPE" && -z "$LC_ALL" ]]; then
    export LC_CTYPE=${LANG%%:*} # pick the first entry from LANG
    export LC_ALL=${LANG%%:*}
fi

function zsh_stats() {
  fc -l 1 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n20
}

function take() {
  mkdir -p $1
  cd $1
}

zstyle ':completion:*' rehash true
zstyle ':completion:*' menu select

############################
######### KEYBINDS #########
############################

# Make sure that the terminal is in application mode when zle is active, since
# only then values from $terminfo are valid
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init() {
    echoti smkx
  }
  function zle-line-finish() {
    echoti rmkx
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

bindkey -e                                            # Use emacs key bindings

bindkey '\ew' kill-region                             # [Esc-w] - Kill from the cursor to the mark
bindkey -s '\el' 'ls\n'                               # [Esc-l] - run command: ls
bindkey '^r' history-incremental-search-backward      # [Ctrl-r] - Search backward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.
if [[ "${terminfo[kpp]}" != "" ]]; then
  bindkey "${terminfo[kpp]}" up-line-or-history       # [PageUp] - Up a line of history
fi
if [[ "${terminfo[knp]}" != "" ]]; then
  bindkey "${terminfo[knp]}" down-line-or-history     # [PageDown] - Down a line of history
fi

if [[ "${terminfo[kcuu1]}" != "" ]]; then
  bindkey "${terminfo[kcuu1]}" up-line-or-search      # start typing + [Up-Arrow] - fuzzy find history forward
fi
if [[ "${terminfo[kcud1]}" != "" ]]; then
  bindkey "${terminfo[kcud1]}" down-line-or-search    # start typing + [Down-Arrow] - fuzzy find history backward
fi

if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line      # [Home] - Go to beginning of line
fi
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}"  end-of-line            # [End] - Go to end of line
fi

bindkey ' ' magic-space                               # [Space] - do history expansion

bindkey '^[[1;5C' forward-word                        # [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5D' backward-word                       # [Ctrl-LeftArrow] - move backward one word
bindkey '^W'      vi-backward-kill-word               # [Ctrl-W] - Delete words vi-mode not emacs-mode

if [[ "${terminfo[kcbt]}" != "" ]]; then
  bindkey "${terminfo[kcbt]}" reverse-menu-complete   # [Shift-Tab] - move through the completion menu backwards
fi

bindkey '^?' backward-delete-char                     # [Backspace] - delete backward
if [[ "${terminfo[kdch1]}" != "" ]]; then
  bindkey "${terminfo[kdch1]}" delete-char            # [Delete] - delete forward
else
  bindkey "^[[3~" delete-char
  bindkey "^[3;5~" delete-char
  bindkey "\e[3~" delete-char
fi

# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# file rename magick
bindkey "^[m" copy-prev-shell-word

# sudo will be inserted before the command
sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    [[ $BUFFER != sudo\ * ]] && LBUFFER="sudo $LBUFFER"
}
zle -N sudo-command-line
# Defined shortcut keys: [Esc] [Esc]
bindkey "\e\e" sudo-command-line


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
ZSH_THEME_TERM_TITLE_IDLE="%n@%m: %~"

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

