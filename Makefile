install: install-bash install-fish install-i3 install-git install-zathura install-tmux install-general install-emacs install-cmus

install-bash:
	ln -s `pwd`/bash/bash_profile ~/.bash_profile
	ln -s `pwd`/bash/bashrc ~/.bashrc

install-vim:
	mkdir -p ~/.vim/backup
	mkdir -p ~/.vim/swap
	mkdir -p ~/.vim/undo
	ln -s `pwd`/vimrc ~/.vimrc

install-fish:
	mkdir -p ~/.config/fish/
	rm -f ~/.config/fish/config.fish
	ln -s `pwd`/fish/config.fish ~/.config/fish/config.fish

install-i3:
	mkdir -p ~/.i3
	ln -s `pwd`/i3/config ~/.i3/config
	ln -s `pwd`/i3/i3status.conf ~/.i3status.conf
	ln -s `pwd`/compton.conf ~/.compton.conf

install-git:
	ln -s `pwd`/.gitconfig ~/.gitconfig
	ln -s `pwd`/.gitignore ~/.gitignore

install-zathura:
	mkdir -p ~/.config/zathura
	ln -s `pwd`/zathura/zathurarc ~/.config/zathura/zathurarc

install-tmux:
	ln -s `pwd`/tmux.conf ~/.tmux.conf

install-general:
	ln -s `pwd`/xinitrc ~/.xinitrc
	ln -s `pwd`/Xresources ~/.Xresources

install-emacs:
	mkdir -p ~/.emacs.d/.
	ln -s `pwd`/emacs/init.el ~/.emacs.d/init.el

install-cmus:
	mkdir -p ~/.config/cmus/
	ln -s `pwd`/cmus/rc ~/.config/cmus/rc

install-zsh:
	ln -s `pwd`/zsh/zshrc ~/.zshrc
	ln -s `pwd`/zsh/zprofile ~/.zprofile
