handleMacOS() {
	isCommandAvailable=$(checkCommandAvailability "softwareupdate")

	if [ "$isCommandAvailable" -eq "1" ];
	then
		printStatusMessage "Installing macOS updates..."
		executeUpdateCommand "softwareupdate -ia"
	else
		printWarningMessage "Command `softwareupdate` is not available. Hence, updating your macOS system itself could not be carried on."
	fi
}
