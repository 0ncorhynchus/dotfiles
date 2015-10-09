autoload colors
colors
autoload -U compinit
compinit -u

PROMPT="%{$fg[green]%}%n@%m$ %{$reset_color%}"

case "$OSTYPE" in
  darwin*)
    alias ls='ls -G'
    ;;
  linux*)
    alias ls='ls --color'
    ;;
esac

if [ -e "/usr/bin/vim" ]; then
    EDITOR=/usr/bin/vim
fi

if [ -e "/usr/local/bin/direnv" ]; then
    eval "$(direnv hook zsh)"
fi
