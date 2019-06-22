handleHomebrew() {
	isCommandAvailable=$(checkCommandAvailability "brew")

	if [ "$isCommandAvailable" -eq "1" ];
	then
		printStatusMessage "Updating Homebrew..."
		executeUpdateCommand "brew update"

		printStatusMessage "Upgrading Homebrew..."
		executeUpdateCommand "brew upgrade"

		printStatusMessage "Cleaning up Homebrew..."
		executeUpdateCommand "brew cleanup"
	else
		printWarningMessage "Command `brew` is not available. Hence, updating your brews could not be carried on."
	fi
}
