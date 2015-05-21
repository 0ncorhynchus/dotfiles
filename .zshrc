autoload colors
colors
PROMPT="%{$fg[green]%}%n[%*]%(!.#.$) %{$reset_color%}"

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
