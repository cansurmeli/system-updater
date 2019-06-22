checkCommandAvailability() {
	if hash $1 2>/dev/null;
	then
		echo 1;
	else
		echo 0;
	fi
}
