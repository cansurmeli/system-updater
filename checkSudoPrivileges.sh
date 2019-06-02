# https://superuser.com/questions/553932/how-to-check-if-i-have-sudo-access
checkSudoPrivileges() {
	local prompt

	prompt=$(sudo -nv 2>&1)

	if [ $? -eq 0 ]; then
		echo "has_sudo__pass_set"
	elif echo $prompt | grep -q '^sudo:'; then
		echo "has_sudo__needs_pass"
	else
		echo "no_sudo"
	fi
}
