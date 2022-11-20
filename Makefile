HOME_DIR ?= $(HOME)
SRC_DIR ?= $(CURDIR)

LIST= \
	vim \
	bash \
	ssh \


.PHONY. : all $(LIST)
all: $(LIST) 

# Bash setup
bash : $(HOME_DIR)/.bash_aliases

$(HOME_DIR)/.bash_aliases : $(SRC_DIR)/bash/aliases.txt
	ln -fs $< $@

# VIM setup
vim : $(HOME_DIR)/.vimrc

$(HOME_DIR)/.vimrc : $(SRC_DIR)/vim/rc.txt
	ln -fs $< $@

# SSH setup
ssh : $(HOME_DIR)/.ssh/config.d $(HOME_DIR)/.ssh/config.d/hosts 

$(HOME_DIR)/.ssh/config.d/hosts : $(SRC_DIR)/ssh/hosts $(HOME_DIR)/.ssh/config.d
	ln -fs $< $@
	chmod 600 $<
	@echo "!! Please add 'include config.d/hosts' to $(HOME_DIR)/.ssh/config !!"

$(HOME_DIR)/.ssh/config.d :
	mkdir -p $@


