checkCommandStatus() {
	status=$?

	if [ "$status" -eq "0" ];
	then
		printStatusMessage "DONE"
	else
		printWarningMessage "FAILED"
	fi
}
