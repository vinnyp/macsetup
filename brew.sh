#!/bin/bash

# First set of formulae
pack1=(
	coreutils
	binutils
	diffutils
	findutils
	gawk
	gnutls
	gzip
	screen
	watch
	wget
	bash
	emacs
	gpatch
	m4
	make
	nano
	file-formula
	git
	less
	openssh
	perl518
	python
	rsync
	svn
	unzip
	zsh
	rbenv
	ruby-build
	imagemagick
	youtube-dl
	hub
	ffmpeg
	tree
	graphicsmagick
)
# Install brew formulae to /usr/local/bin
echo "Installing brew core formulae..."
brew install ${pack1[@]}

# GNU formulae
pack2=(
	ed
	gnu-indent
	gnu-sed
	gnu-tar
	gnu-which
	grep
)
#  Install them without the g prefix.
brew install ${pack2[@]} --with-default-names

# Additional formulae
brew install wdiff --with-gettext
brew install vim --override-system-vi

# Casks to Install
casks1=(
	atom
	cakebrew
	flux
	java
	sublime-text
	virtualbox
	vagrant
	vlc
)
# Install brew casks
brew cask install ${casks1[@]}
