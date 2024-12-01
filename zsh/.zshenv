# LANG stuff
export LANG=en_US.UTF-8
if [[ -z "$LC_CTYPE" && -z "$LC_ALL" ]]; then
    export LC_CTYPE=${LANG%%:*} # pick the first entry from LANG
    export LC_ALL=${LANG%%:*}
fi
export TZ=":/etc/localtime"


# PATH stuff
export -U PATH path
path=($HOME/.local/bin $path)
# export PATH

export -TU XDG_DATA_DIRS xdg_data_dirs

# export XDG_CURRENT_DESKTOP=gnome
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
xdg_data_dirs=(/usr/local/share/ /usr/share/ /var/lib/flatpak/exports/share/ /home/txtsd/.local/share/flatpak/exports/share/)
export XDG_CONFIG_DIRS=/etc/xdg
export XDG_CACHE_HOME=$HOME/.cache

export GOPATH="$HOME/git/golang/"
export FLUTTERPATH="$HOME/flutter/bin"
export -TU JAVA_FONTS java_fonts
java_fonts=($XDG_DATA_HOME/fonts /usr/share/fonts/TTF /usr/share/fonts/OTF /usr/share/fonts)
# export _JAVA_OPTIONS='-Dswing.aatext=true -Dawt.useSystemAAFontSettings=on -Dswing.defaultlaf.sun.java.swing.plaf.gtk.GTKLookAndFeel'
export _JAVA_OPTIONS="-Dswing.aatext=true -Dawt.useSystemAAFontSettings=on -Dswing.defaultlaf.sun.java.swing.plaf.gtk.GTKLookAndFeel -Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
export FT2_SUBPIXEL_HINTING=1
export VISUAL='nvim'
export EDITOR='nvim'

export QT_STYLE_OVERRIDE=kvantum
export QT_QPA_PLATFORMTHEME=qt6ct
# Make GTK apps use portals for file chooser etc.
export GDK_DEBUG=portals
export GTK_USE_PORTAL=1
# export XZ_OPT='-9e --threads=0'
# export GTK_THEME=:light
export ZSH_CONFIG_DIR=$XDG_CONFIG_HOME/zsh/
export ZSH_CACHE_DIR=$XDG_CACHE_HOME/zsh/
# export QT_QPA_PLATFORM=wayland-egl
export GPG_TTY=$(tty)
export FREETYPE_PROPERTIES="truetype:interpreter-version=35"
# export LIBGL_ALWAYS_SOFTWARE=1
export GIT_PROTOCOL="version=2"
# export GALLIUM_HUD_PERIOD=0.07
# export GALLIUM_HUD="GPU-load+cpu+fps"
export VIRTUAL_ENV_DISABLE_PROMPT=1
# export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/radeon_icd.i686.json:/usr/share/vulkan/icd.d/radeon_icd.x86_64.json
# export GTK_IM_MODULE=xim
# export QT_IM_MODULE=xim
# export ENABLE_VKBASALT=1
export SAL_USE_VCLPLUGIN=qt6

export CARGO_HOME="$XDG_DATA_HOME/cargo"
export CONAN_USER_HOME="$XDG_CONFIG_HOME"
export DVDCSS_CACHE="$XDG_DATA_HOME/dvdcss"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export KDEHOME="$XDG_CONFIG_HOME/kde"
export KODI_DATA="$XDG_DATA_HOME/kodi"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NVM_DIR="$XDG_DATA_HOME/nvm"
export PARALLEL_HOME="$XDG_CONFIG_HOME/parallel"
export RXVT_SOCKET="$XDG_RUNTIME_DIR/urxvtd"
export WORKON_HOME="$XDG_DATA_HOME/virtualenvs"

# For use with KeepassXC
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# For Wayland and Sway, see .zprofile
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org/"

# Poetry disable keyring
export PYTHON_KEYRING_BACKEND=keyring.backends.fail.Keyring

# To set the ssh-askpass program
export SSH_ASKPASS=/usr/bin/lxqt-openssh-askpass

# Directories
if [[ ! -d "$XDG_CONFIG_HOME" ]]; then
  mkdir -p $XDG_CONFIG_HOME
fi

if [[ ! -d "$ZSH_CONFIG_DIR" ]]; then
  mkdir -p $ZSH_CONFIG_DIR
fi

if [[ ! -d "$XDG_CACHE_HOME" ]]; then
  mkdir -p $XDG_CACHE_HOME
fi

if [[ ! -d "$ZSH_CACHE_DIR" ]]; then
  mkdir -p $ZSH_CACHE_DIR
fi

if [[ ! -d "$XDG_STATE_HOME" ]]; then
  mkdir -p $XDG_STATE_HOME
fi

fpath=($ZSH_CONFIG_DIR $fpath)

