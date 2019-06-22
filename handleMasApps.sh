handleMacOS() {
	isCommandAvailable=$(checkCommandAvailability "mas")

	if [ "$isCommandAvailable" -eq "1" ];
	then
		printStatusMessage "Upgrading outdated App Store apps via mas..."
		executeUpdateCommand "mas upgrade"
	else
		printWarningMessage "Command `mas` is not available. Hence, updating your App Store apps could not be carried on."
	fi
}
