# -*- mode: shell-script -*-
# vim: set fdm=marker :
export PATH="/sbin:$PATH"
export PATH="/usr/sbin:$PATH"

# Load Nix environment.
[ -e ~/.nix-profile/etc/profile.d/nix.sh ] && source ~/.nix-profile/etc/profile.d/nix.sh
[ -d /usr/share/terminfo ] && export TERMINFO=/usr/share/terminfo

export PATH="$HOME/.cask/bin:$PATH"

export PATH="$HOME/.cabal/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"

export PATH="$HOME/.npm-global/bin:$PATH"

[ -e ~/perl5/perlbrew/etc/bashrc ] && source ~/perl5/perlbrew/etc/bashrc

export PATH="$HOME/.gem/ruby/2.3.0/bin:$PATH"

export PATH="$HOME/.gopath/bin:$PATH"

typeset -T C_INCLUDE_PATH c_include_path
typeset -T CPLUS_INCLUDE_PATH cplus_include_path
typeset -T LIBRARY_PATH library_path
typeset -T LD_LIBRARY_PATH ld_library_path
typeset -T PYTHONPATH pythonpath

export PATH="$HOME/.local/bin:$PATH"

# ~/local package paths
export PATH="$HOME/local/bin:$PATH"

# Note: The array syntax is used to avoid prepending to an empty list.
# It would add a trailing colon, which effectively works as ".", which
# in turn breaks for example Perlbrew.
c_include_path+=("$HOME/local/include" $c_include_path)
cplus_include_path+=("$HOME/local/include" $cplus_include_path)
library_path+=("$HOME/local/lib" $library_path)
ld_library_path+=("$HOME/local/lib" $ld_library_path)

FPATH=$HOME/.fpath:$FPATH

export PATH="$HOME/.bin:$PATH"
export PATH="$PATH:$HOME/.ssh/bin"

export MANPATH="$HOME/local/share/man:"

typeset -U PATH PYTHONPATH C_INCLUDE_PATH CPLUS_INCLUDE_PATH LIBRARY_PATH LD_LIBRARY_PATH FPATH

export ACRONYMDB="$HOME/.resources/acronyms"
export RLWRAP_HOME="$HOME/.rlwrap"

export P4CONFIG=".p4config"
export P4MERGE="m4merge"

if [ -r ~/.config/ranger/rc.conf ]; then
    export RANGER_LOAD_DEFAULT_RC=FALSE
fi
