DOTFILES_EXCLUDES = .git .gitmodules
DOTFILES_TARGETS  = $(wildcard .??*)
DOTFILES_DIR      = $(PWD)
DOTFILES_FILES    = $(filter-out $(DOTFILES_EXCLUDES) ,$(DOTFILES_TARGETS))

update:
	git pull origin master
	git submodule init
	git submodule update
	#git submodule foreach git pull origin master

deploy:
	@$(foreach f, $(DOTFILES_FILES), ln -sfnv $(abspath $(f)) $(HOME)/$(f);)

clean:
	@$(foreach f, $(DOTFILES_FILES), rm $(HOME)/$(f);)
