updateSystem() {
	# Grab sudo
	printStatusMessage "hello"
	echo -e "\e[34mSTATUS: Later on, while updating PIP, sudo privileges will be required. Grant it now so that you can leave these processes on their own.\033[0m"
	sudo -v

	# Keep the sudo privileges alive until everything finishes
	while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
	printNewLine

	# Homebrew
	echo -e "\e[34mSTATUS: Updating Homebrew...\033[0m"
	brewUpdate=$(brew update)
	checkCommandStatus
	printNewLine

	echo -e "\e[34mSTATUS: Upgrading Homebrew...\033[0m"
	brew upgrade
	checkCommandStatus
	printNewLine

	echo -e "\e[34mSTATUS: Cleaning up Homebrew...\033[0m"
	brew cleanup
	checkCommandStatus
	printNewLine

	# macOS
	echo -e "\e[34mSTATUS: Upgrading outdated App Store apps via mas...\033[0m"
	mas upgrade
	checkCommandStatus
	printNewLine

	# PIP
	echo -e "\e[34mSTATUS: Upgrading the PIP itself...\033[0m"
	sudo pip install --upgrade pip
	checkCommandStatus
	printNewLine

	echo -e "\e[34mSTATUS: Updating the installed packages...\033[0m"
	echo -e "\e[31mFULL DISCLOSURE: Due to PIP's nature, you might have to deal with environment errors.\033[0m"
	sudo pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
	checkCommandStatus
	printNewLine

	# RUBY
	echo -e "\e[34mSTATUS: Updating Ruby itself...\033[0m"
	gem update --system
	checkCommandStatus
	printNewLine

	echo -e "\e[34mSTATUS: Updating the installed gems...\033[0m"
	echo -e "\e[31mFULL DISCLOSURE: It might(most probably will) take a while so take a break(you've been warned)!\033[0m"
	gem update
	checkCommandStatus
	printNewLine

	echo -e "\e[34mSTATUS: Cleaning up the installed gems...\033[0m"
	gem cleanup
	checkCommandStatus
	printNewLine
}

checkCommandStatus() {
	status=$?

	if [ "$status" -eq "0" ];
	then
		echo -e "\e[34mDONE\033[0m"
	else
		echo -e "\e[34mFAILED\033[0m"
	fi
}

printNewLine() {
	echo ""
}

printStatusMessage() {
	echo -e "\e[34mSTATUS: $1\033[0m"
}

updateSystem
