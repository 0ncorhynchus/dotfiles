DOTFILES_EXCLUDES = .git .gitmodules
DOTFILES_TARGETS  = $(wildcard .??*)
DOTFILES_DIR      = $(PWD)
DOTFILES_FILES    = $(filter-out $(DOTFILES_EXCLUDES) ,$(DOTFILES_TARGETS))

deploy:
	@$(foreach f, $(DOTFILES_FILES), ln -sfnv $(abspath $(f)) $(HOME)/$(f);)
