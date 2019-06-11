handleHomebrew() {
	printStatusMessage "Updating Homebrew..."
	executeUpdateCommand "brew update"

	printStatusMessage "Upgrading Homebrew..."
	executeUpdateCommand "brew upgrade"

	printStatusMessage "Cleaning up Homebrew..."
	executeUpdateCommand "brew cleanup"
}
