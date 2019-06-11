trap ctrlC INT

function ctrlC() {
	printNewLine
	printWarningMessage "Script interrupted by the user."
	exit 0
}
