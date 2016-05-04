install: install-vim install-fish install-i3 install-qt install-git install-zathura install-tmux install-general install-emacs

install-vim:
	mkdir -p ~/.vim/backup
	mkdir -p ~/.vim/swap
	mkdir -p ~/.vim/undo
	ln -s `pwd`/vimrc ~/.vimrc

install-vundle:
	mkdir -p ~/.vim/bundle
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall
	cd ~/.vim/bundle/vimproc.vim && make && cd -

install-fish:
	mkdir -p ~/.config/fish/
	rm -f ~/.config/fish/config.fish
	ln -s `pwd`/fish/config.fish ~/.config/fish/config.fish

install-i3:
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

install-tmux:
	ln -s `pwd`/tmux.conf ~/.tmux.conf

install-general:
	ln -s `pwd`/xinitrc ~/.xinitrc
	ln -s `pwd`/Xresources ~/.Xresources

install-emacs:
	mkdir -p ~/.emacs.d/.
	ln -s `pwd`/emacs/init.el ~/.emacs.d/init.el
