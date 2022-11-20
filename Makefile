HOME_DIR ?= $(HOME)
SRC_DIR ?= $(CURDIR)

LIST= \
	vim \


.PHONY. : all install
all: $(LIST) 
install:  $(addsuffix -install,$(LIST))

# VIM setup
.PHONY. : vim vim-install

vim :
vim-install : $(HOME_DIR)/.vimrc

$(HOME_DIR)/.vimrc : $(SRC_DIR)/vim/rc.txt
	ln -fs $< $@
	


