grabSudoIfNeeded() {
	if [ "$sudoStatus" != "has_sudo__pass_set" ]; then
		printStatusMessage "Later on, sudo privileges will be required. Grant it now so that you can leave this script on it's own."
		sudo -v
		printNewLine
	else
		printStatusMessage "Already have the sudo privileges; you can lay back and let the script do its job."
		printNewLine
	fi
}
