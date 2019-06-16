handleRuby() {
	printStatusMessage "Updating Ruby itself..."
	executeUpdateCommand "sudo gem update --system"

	printStatusMessage "Updating the installed gems..."
	printWarningMessage "FULL DISCLOSURE: It might(most probably will) take a while so take a break(you've been warned)!"
	executeUpdateCommand "sudo gem update"

	printStatusMessage "Cleaning up the installed gems..."
	executeUpdateCommand "gem cleanup"
}
