printStatusMessage() {
	BLUE='\033[0;34m'
	NO_COLOR='\033[0m'
	printf "${BLUE}$1${NO_COLOR}"
	printNewLine
}
