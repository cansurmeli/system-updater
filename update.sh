#!/bin/bash

ARGUMENTS=$@

source printNewLine.sh
source printStatusMessage.sh
source printWarningMessage.sh
source checkCommandAvailability.sh
source checkCommandStatusAfterExecution.sh
source checkSudoPrivileges.sh
source executeUpdateCommand.sh
source grabSudoIfNeeded.sh
source handleHomebrew.sh
source handleMacOS.sh
source handlePIP.sh
source handleRuby.sh
source keepSudoPrivileges.sh
source parseCommandLineArguments.sh
source trapping.sh

initiateSystemUpdate() {
	parseCommandLineArguments "$ARGUMENTS"
	checkSudoPrivileges
	grabSudoIfNeeded
	keepSudoPrivileges
	handleHomebrew
	handleMacOS
	handlePIP
	handleRuby
}

initiateSystemUpdate
