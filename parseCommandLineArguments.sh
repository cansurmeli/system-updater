parseCommandLineArguments() {
	echo $1
	POSITIONAL=()
	while [[ $# -gt 0 ]]
	do
		key="$1"

		case $key in
				-h|--help)
				HELP="$2"
				less "help.txt"
				exit 0											# as expected, display the help and exit
				shift												# past argument
				;;
				-o|--output)
				LOG_OUTPUT_LOCATION="$2"
				shift												# past argument
				shift												# past value
				;;
				-v|--verbose)
				isVerbose=true
				shift												# past argument
				;;
				--default)
				DEFAULT=YES
				shift												# past argument
				;;
				*)													# unknown option
				POSITIONAL+=("$1")					# save it in an array for later
				shift												# past argument
				;;
		esac
	done
	set -- "${POSITIONAL[@]}"					# restore positional parameters
}
