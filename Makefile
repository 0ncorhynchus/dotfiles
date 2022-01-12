DOTFILES = .tmux.conf .zshrc

.PHONY: all deploy clean

all: deploy $(HOME)/.cache/dein

deploy:
	@$(foreach f, $(DOTFILES), ln -sfnv $(abspath $(f)) $(HOME)/$(f);)
	@ln -sfnv $(abspath nvim) $(HOME)/.config/nvim

clean:
	@$(foreach f, $(DOTFILES), rm -f $(HOME)/$(f);)
	@rm -f $(HOME)/.config/nvim
	@rm -rf $(HOME)/.cache/dein

$(HOME)/.cache/dein:
	@mkdir -p $@
	@git clone --depth=1 https://github.com/Shougo/dein.vim $@/repos/github.com/Shougo/dein.vim
