export BROWSER=google-chrome-stable
export DEV=$HOME/dev
export DOTFILES=$DEV/.dotfiles
export EDITOR=nvim
export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!{node_modules,.git}"'
export FZF_DEFAULT_OPTS='--height 96%'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
'
export GITHUB=https://github.com/jamtartley
export KEYTIMEOUT=25
export MANPAGER='nvim +Man!'
export MANWIDTH=999
export TERM=xterm-256color
export VISUAL=nvim
export XDG_CONFIG_HOME=$HOME/.config
export ZSH=$HOME/.oh-my-zsh

export PATH=$HOME/.gem/ruby/2.7.0/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.scripts:$PATH
export PATH=$HOME/.dotnet/tools:$PATH

DISABLE_AUTO_UPDATE="false"
ZSH_THEME="bureau"

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS

source $ZSH/oh-my-zsh.sh

if [ "$ISLINUX" '==' 'true' ]; then
    { infocmp -1 xterm-256color ; echo "\tsitm=\\E[3m,\n\tritm=\\E[23m,"; } | \
        tic -x -
fi

# zplug
source $HOME/.zplug/init.zsh
zplug "plugins/git",   from:oh-my-zsh
zplug "softmoth/zsh-vim-mode"
zplug "zsh-users/zsh-autosuggestions"
zplug "zdharma/fast-syntax-highlighting", defer:2
zplug "$HOME/.zsh", from:local

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

alias c='clear'
alias l="ls -alhG"
alias mkd="mkdir -pv"
alias rz="source $HOME/.zshrc"

if type nvim > /dev/null 2>&1;
then
    alias v='nvim'
    alias vim="nvim"
fi

alias cf='cat $(fzf)'
alias vf='vim $(fzf)'

alias g='git status'
alias gs='git status -s'
alias gl='git log'

alias dev="cd $DEV"
alias dots="cd $DOTFILES"

tldr() {
  curl "https://cheat.sh/$1"
}

for file in $DOTFILES/*/*.zsh; do
    source "$file"
done

[[ -x ~/.zsh_aliases ]] && source ~/.zsh_aliases
