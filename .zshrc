autoload colors
colors
PROMPT="%{$fg[green]%}%n[%*]%(!.#.$) %{$reset_color%}"

alias ls='ls --color=auto'

if [ -e "/usr/bin/vim" ]; then
    EDITOR=/usr/bin/vim
fi

if [ -e "/usr/local/bin/direnv" ]; then
    eval "$(direnv hook zsh)"
fi
