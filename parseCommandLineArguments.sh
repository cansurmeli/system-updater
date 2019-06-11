parseCommandLineArguments() {
	POSITIONAL=()
	while [[ $# -gt 0 ]]
	do
		key="$1"

		case $key in
				-h|--help)
				HELP="$2"
				less "help.txt"
				shift												# past argument
				shift												# past value
				;;
				-o|--output)
				LOG_OUTPUT_LOCATION="$2"
				shift												# past argument
				shift												# past value
				;;
				-v|--verbose)
				echo "Acting verbose..."
				shift												# past argument
				shift												# past value
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

	#echo LOG_OUTPUT_LOCATION = "${LOG_OUTPUT_LOCATION}"
}
