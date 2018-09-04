DOTFILES_EXCLUDES = .git .gitmodules
DOTFILES_TARGETS  = $(wildcard .??*)
DOTFILES_DIR      = $(PWD)
DOTFILES_FILES    = $(filter-out $(DOTFILES_EXCLUDES) ,$(DOTFILES_TARGETS))
SYSTEMD_FILES     = $(notdir $(wildcard systemd/*))

update:
	git pull origin master
	git submodule init
	git submodule update
	#git submodule foreach git pull origin master

deploy:
	@$(foreach f, $(DOTFILES_FILES), ln -sfnv $(abspath $(f)) $(HOME)/$(f);)
	@$(foreach f, $(SYSTEMD_FILES), ln -sfnv $(abspath $(f)) $(HOME)/.config/systemd/user/$(f);)

clean:
	@$(foreach f, $(DOTFILES_FILES), rm $(HOME)/$(f);)
