updateSystem() {
	sudoStatus=$(checkSudoPrivileges)

	# Grab sudo if needed
	if [ "$sudoStatus" != "has_sudo__pas_set" ]; then
		printStatusMessage "Later on, while updating PIP, sudo privileges will be required. Grant it now so that you can leave these processes on their own."
		printNewLine
		sudo -v
	fi

	# Keep the sudo privileges alive until everything finishes
	while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

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
	printWarningMessage "FULL DISCLOSURE: Due to PIP's nature, you might have to deal with environment errors."
	executeUpdateCommand "sudo pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"

	# RUBY
	printStatusMessage "Updating Ruby itself..."
	executeUpdateCommand "gem update --system"

	printStatusMessage "Updating the installed gems..."
	printWarningMessage "FULL DISCLOSURE: It might(most probably will) take a while so take a break(you've been warned)!"
	executeUpdateCommand "gem update"

	printStatusMessage "Cleaning up the installed gems..."
	executeUpdateCommand "gem cleanup"
}

checkCommandStatus() {
	status=$?

	if [ "$status" -eq "0" ];
	then
		printStatusMessage "DONE"
	else
		printWarningMessage "FAILED"
	fi
}

printNewLine() {
	echo ""
}

printStatusMessage() {
	BLUE='\033[0;34m'
	NO_COLOR='\033[0m'
	printf "${BLUE}$1${NO_COLOR}"
	printNewLine
}

printWarningMessage() {
	RED='\033[0;31m'
	NO_COLOR='\033[0m'
	printf "${RED}$1${NO_COLOR}"
	printNewLine
}

executeUpdateCommand() {
	$1	
	checkCommandStatus
	printNewLine
}

# https://superuser.com/questions/553932/how-to-check-if-i-have-sudo-access
checkSudoPrivileges() {
	local prompt

	prompt=$(sudo -nv 2>&1)

	if [ $? -eq 0 ]; then
		echo "has_sudo__pass_set"
	elif echo $prompt | grep -q '^sudo:'; then
		echo "has_sudo__needs_pass"
	else
		echo "no_sudo"
	fi
}

updateSystem
