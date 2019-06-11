if [ "$sudoStatus" != "has_sudo__pas_set" ]; then
	printStatusMessage "Later on, while updating PIP, sudo privileges will be required. Grant it now so that you can leave these processes on their own."
	printNewLine
	sudo -v
fi
