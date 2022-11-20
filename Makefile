HOME_DIR ?= $(HOME)
SRC_DIR ?= $(CURDIR)

LIST= \
	vim \
	bash \


.PHONY. : all install
all: $(LIST) 
install:  $(addsuffix -install,$(LIST))

# Bash setup
.PHONY. : bash bash-install

bash:
bash-install : $(HOME_DIR)/.bash_aliases

$(HOME_DIR)/.bash_aliases : $(SRC_DIR)/bash/aliases.txt
	ln -fs $< $@

# VIM setup
.PHONY. : vim vim-install

vim :
vim-install : $(HOME_DIR)/.vimrc

$(HOME_DIR)/.vimrc : $(SRC_DIR)/vim/rc.txt
	ln -fs $< $@
	


