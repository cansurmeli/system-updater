updateSystem() {
	# Grab sudo
	printStatusMessage "Later on, while updating PIP, sudo privileges will be required. Grant it now so that you can leave these processes on their own."
	sudo -v

	# Keep the sudo privileges alive until everything finishes
	while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
	printNewLine

	# Homebrew
	printStatusMessage "Updating Homebrew..."
	executeUpdateCommand "brew update"

	printStatusMessage "Upgrading Homebrew..."
	executeUpdateCommand "brew upgrade"

	printStatusMessage "Cleaning up Homebrew..."
	executeUpdateCommand "brew cleanup"

	# macOS
	printStatusMessage "Upgrading outdated App Store apps via mas..."
	executeUpdateCommand "mas upgrade"

	# PIP
	printStatusMessage "Upgrading the PIP itself..."
	executeUpdateCommand "sudo pip install --upgrade pip"

	printStatusMessage "Updating the installed packages..."
	echo -e "\e[31mFULL DISCLOSURE: Due to PIP's nature, you might have to deal with environment errors.\033[0m"
	executeUpdateCommand "sudo pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"

	# RUBY
	printStatusMessage "Updating Ruby itself..."
	executeUpdateCommand "gem update --system"

	printStatusMessage "Updating the installed gems..."
	echo -e "\e[31mFULL DISCLOSURE: It might(most probably will) take a while so take a break(you've been warned)!\033[0m"
	executeUpdateCommand "gem update"

	printStatusMessage "Cleaning up the installed gems..."
	executeUpdateCommand "gem cleanup"
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

executeUpdateCommand() {
	$1	
	checkCommandStatus
	printNewLine
}

updateSystem
