# -*- mode: shell-script -*-
# vim: set fdm=marker :
[ -z "$PS1" ] && return
unsetopt autocd beep
bindkey -e

zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
autoload -U colors && colors
compinit
# End of lines added by compinstall

(( $+commands[lesspipe.sh] )) && eval `lesspipe.sh`

autoload zmv

HISTFILE=~/.zhistory
DEF_HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000

WORDCHARS='*?_-.[]~!#$%(){}<>'


export EDITOR="emacsclient -c -a vim"
export ALTERNATE_EDITOR="vim"
export SUDO_EDITOR="$HOME/local/bin/emacsclient -c -a vim"
export BROWSER="luakit"
export PAGER="less"
setopt hist_ignore_all_dups     \
    hist_ignore_space           \
    hist_reduce_blanks          \
    append_history              \
    share_history               \
    inc_append_history          \
    hist_no_functions           \
    extended_history            \
    hist_no_store               \
    interactivecomments         \
    \
    extended_glob               \
    braceccl                    \
    longlistjobs                \
    \
    prompt_subst                \
    \
    pushd_to_home               \
    local_options


PLUGINS_DIR=~/.zplugins
PLUGINS=(
    zcolors
    zremap
    zaliases
    zcompletion
    zscripts
    zpriv
    zXephyr
    zmancolor
    zCMake
    humble
    filehandlers
    functional
    urxvt_cwd-spawn
    term-title
    image-selector
    perl-edit
    fasd
    scratchdir
    )
if [ -f ~/.zloader ]; then
    . ~/.zloader
fi

if [ $TERM = "vt100" -o $TERM = "dumb" ]; then
    PSFILE=.zpromptlegacy.zsh
elif [ -z "$PSFILE" ]; then
    PSFILE=.zprompt
fi
if [ -f ~/$PSFILE ]; then
    . ~/$PSFILE
fi

if [ $TERM = "eterm-color" ]; then
    unset HISTFILE
    eval "$(dircolors -b)"
    zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
fi

if [ -n "$CLEARONSTART" ]; then
    clear
    unset CLEARONSTART
fi

trap 'exec zsh' USR1
