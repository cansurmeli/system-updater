handlePIP() {
	isCommandAvailable=$(checkCommandAvailability "pip")

	if [ "$isCommandAvailable" -eq "1" ];
	then
		printStatusMessage "Upgrading the PIP itself..."
		executeUpdateCommand "pip install -U pip"

		printStatusMessage "Updating the installed packages..."
		printWarningMessage "FULL DISCLOSURE: Due to PIP's nature, you might have to deal with environment errors."
		executeUpdateCommand "pip install -U $(pip freeze | awk '{split($0, a, "=="); print a[1]}')"
	else
		printWarningMessage "Command `pip` is not available. Hence, updating pip and the packages installed by it could not be carried on."
	fi
}
