checkSudoPrivileges() {
	local prompt

	prompt=$(sudo -nv 2>&1)
	if [ $? -eq 0 ]; then
		sudoStatus="has_sudo__pass_set"
	elif echo $prompt | grep -q '^sudo:'; then
		sudoStatus="has_sudo__needs_pass"
	else
		sudoStatus="no_sudo"
	fi
}
