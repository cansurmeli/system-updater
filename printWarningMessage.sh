printWarningMessage() {
	ORANGE='\033[0;33m'
	NO_COLOR='\033[0m'
	printf "${ORANGE}$1${NO_COLOR}"
	printNewLine
}
