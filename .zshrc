# zsh-newuser-install {{{
# -- lines configured by zsh-newuser-install
# automatically change directory when you input its name
# setopt autocd
# bindkey -v = vi mode; -e = emacs mode
bindkey -e
# -- end of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'
# -- lines added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'
# }}}
# completion {{{
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
# -- set autocompletion for aliases
setopt COMPLETE_ALIASES
# -- end of lines added by compinstall
# # }}}

# PROMPT {{{
DEFAULT=$PS1
[[ -n "$DISPLAY" && "$TERM" = "xterm" ]] && export TERM=xterm-256color
PROMPT='%F{blue}[%c]%#%f '
# -- prompt
# http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#SEC59
# %F{color} = start using foreground color
# %f		= stop using foreground color
# %K{color} = start using background color
# %k		= stop using background color
# }}}
# LS_COLORS {{{
LS_COLORS="";
LS_COLORS=$LS_COLORS:'di=1;32':'fi=00':'ln=1;96':'ex=1;33'; 
export LS_COLORS;
# # }}}
# LESS {{{
# ANSI escape sequences:
export LESS_TERMCAP_mb=$'\E[1;32m'		# begin blink
export LESS_TERMCAP_md=$'\E[1;36m'		# begin bold
export LESS_TERMCAP_so=$'\E[1;34m'		# begin reverse video
export LESS_TERMCAP_us=$'\E[3;33m'		# begin underline
export LESS_TERMCAP_me=$'\E[0m'			# reset bold/blink
export LESS_TERMCAP_se=$'\E[0m'			# reset reverse video
export LESS_TERMCAP_ue=$'\E[0m'			# reset underline
# export LESS='-R --quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --HILITE-UNREAD --tabs=4 --no-init --window=-4'
# export LESSOPEN='|/usr/bin/src-hilite-lesspipe.sh %s'
# # }}}

# plugins

# requires zsh-syntax-highlighting {{{
# -- requires zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# # }}}
# requires fzf {{{
# -- requires fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
# # }}}
# requires pkgfile {{{
source /usr/share/doc/pkgfile/command-not-found.zsh
# # }}}
# requires zsh-autosuggestions {{{
# -- requires zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
typeset -A ZSH_HIGHLIGHT_STYLES
HIGHLIGHT_STYLE=contrast
source $ZDOTDIR/highlight/$HIGHLIGHT_STYLE
# -- fish-like autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=7
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=10
ZSH_AUTOSUGGEST_COMPLETION_IGNORE="man *|git *|sudo pacman *|npm *"
# -- CTRL + SPACE to accept suggestion
bindkey '^ ' autosuggest-accept 
# # }}}
# requires fasd {{{
eval "$(fasd --init auto zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install posix-alias)"
# }}}

# aliases and functions

[ -e $ZDOTDIR/aliases.zsh ] && source $ZDOTDIR/aliases.zsh
[ -e $ZDOTDIR/functions.zsh ] && source $ZDOTDIR/functions.zsh
[ -e $ZDOTDIR/environment.zsh ] && source $ZDOTDIR/environment.zsh
