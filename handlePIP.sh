handlePIP() {
	printStatusMessage "Upgrading the PIP itself..."
	executeUpdateCommand "pip install -U pip"

	printStatusMessage "Updating the installed packages..."
	printWarningMessage "FULL DISCLOSURE: Due to PIP's nature, you might have to deal with environment errors."
	executeUpdateCommand "sudo pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"
}
