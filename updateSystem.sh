source printNewLine.sh
source printStatusMessage.sh
source printWarningMessage.sh
source checkCommandStatus.sh
source checkSudoPrivileges.sh
source executeUpdateCommand.sh
source grabSudoIfNeeded.sh
source handleHomebrew.sh
source handleMacOS.sh
source handlePIP.sh
source handleRuby.sh
source keepSudoPrivileges.sh
source parseCommandLineArguments.sh
source updateSystem.sh

initiateSystemUpdate() {
	parseCommandLineArguments
	sudoStatus=$(checkSudoPrivileges)
	grabSudoIfNeeded
	keepSudoPrivileges
	handleHomebrew
	handleMacOS
	handlePIP
	handleRuby
}

initiateSystemUpdate
