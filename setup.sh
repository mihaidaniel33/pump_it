#!/bin/bash

dont_forget() {
	echo """

#################################################
#################################################

		Don't forget:
	  	- Install Xcode
		- Install Docker (Rancher desktop)
		- Run system settings
		- Set up .ssh/config file

#################################################
#################################################
"""
}


# Install brew
add_brew () {
	echo "Installing brew ..."

	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	user_name=$(whoami)
	
	(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/$user_name/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"

	brew update
}

add_git () {
	echo "Installing git ..."
	brew install git
}

add_iterm () {
	echo "Installing iTerm2 ..."
	brew install --cask iterm2
}

add_zsh () {
	echo "Installing zsh and oh-my-zsh ..."

	brew install zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

add_other_packages () {
	brew install --cask visual-studio-code
	brew install --cask google-cloud-sdk

	brew install \
		jq yq \
		awscli azure-cli \
		kubernetes-cli kind \
		go
}


set_config_files () {
	echo "Setting .vimrc file ..."
	cat ./config_files/vimrc > ~/.vimrc

	echo "Setting .ssh/config file ... "
	mkdir ~/.ssh
	cat ./config_files/ssh_config > ~/.ssh/config
}


add_brew
add_git
add_iterm
add_zsh
add_other_packages
set_config_files
dont_forget




