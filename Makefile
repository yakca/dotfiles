install: install-vim install-fish install-i3 install-qt install-git intall-zathura install-general

install-vim:
	mkdir -p ~/.vim/backup
	mkdir -p ~/.vim/swap
	mkdir -p ~/.vim/undo
	ln -s `pwd`/vimrc ~/.vimrc

install-fish:
	mkdir -p ~/.config/fish/
	ln -s `pwd`/config.fish ~/.config/fish/config.fish

install-i3:m
	mkdir -p ~/.i3
	ln -s `pwd`/i3/config ~/.i3/config
	ln -s `pwd`/i3/i3status.conf ~/.i3status.conf
	ln -s `pwd`/compton.conf ~/.compton.conf

install-qt:
	mkdir -p ~/.config/QtProject/qtcreator/styles
	ln -s `pwd`/qt/solarized-dark.xml ~/.config/QtProject/qtcreator/styles/solarized-dark.xml

install-git:
	ln -s `pwd`/.gitconfig ~/.gitconfig
	ln -s `pwd`/.gitignore ~/.gitignore

install-zathura:
	mkdir -p ~/.config/zathura
	ln -s `pwd`/zathura/zathurarc ~/.config/zathura/zathurarc

install-general:
	ln -s `pwd`/xinitrc ~/.xinitrc
	ln -s `pwd`/Xresources ~/.Xresources
	ln -s `pwd`/tmux.conf ~/.tmux.conf
