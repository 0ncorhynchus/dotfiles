DOTFILES = .tmux.conf .vim .vimrc .zshrc

.PHONY: deploy clean

deploy:
	@$(foreach f, $(DOTFILES), ln -sfnv $(abspath $(f)) $(HOME)/$(f);)

clean:
	@$(foreach f, $(DOTFILES), rm $(HOME)/$(f);)
