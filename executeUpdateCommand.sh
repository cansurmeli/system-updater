executeUpdateCommand() {
	isCommandAvailable = checkCommandAvailability $1

	if [ "$isCommandAvailable" == 1]
	then
		$1	
		checkCommandStatus
		printNewLine
	else
		printWarningMessage "Command not available"
	fi
}
