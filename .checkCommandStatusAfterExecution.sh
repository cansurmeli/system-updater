checkCommandStatusAfterExecution() {
	status=$?

	if [ "$status" -eq "0" ];
	then
		printStatusMessage "DONE"
	else
		printErrorMessage "FAILED"
	fi
}
