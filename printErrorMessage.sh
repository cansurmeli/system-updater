printErrorMessage() {
	RED='\033[0;31m'
	NO_COLOR='\033[0m'
	printf "${RED}$1${NO_COLOR}"
	printNewLine
}
