handleRuby() {
	isCommandAvailable=$(checkCommandAvailability "gem")

	if [ "$isCommandAvailable" -eq "1" ];
	then
		printStatusMessage "Updating Ruby itself..."
		executeUpdateCommand "sudo gem update --system"

		printStatusMessage "Updating the installed gems..."
		printWarningMessage "FULL DISCLOSURE: It might(most probably will) take a while so take a break(you've been warned)!"
		executeUpdateCommand "sudo gem update"

		printStatusMessage "Cleaning up the installed gems..."
		executeUpdateCommand "sudo gem cleanup"
	else
		printWarningMessage "Command 'gem' is not available. Hence, updating Ruby could not be carried on."
	fi
}
