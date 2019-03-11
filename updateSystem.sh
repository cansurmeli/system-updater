updateSystem() {
	# Grab sudo
	echo -e "\e[34mSTATUS: Later on when updating PIP, sudo privileges will be required. Grant it now so that you can leave these processes on their own.\033[0m"
	sudo cat /dev/null			# execute a dummy command to grab it
	echo ""

	# Homebrew
	echo -e "\e[34mSTATUS: Updating Homebrew...\033[0m"
	brew update
	echo -e "\e[34mDONE\033[0m"
	echo ""

	echo -e "\e[34mSTATUS: Upgrading Homebrew...\033[0m"
	brew upgrade
	echo -e "\e[34mDONE\033[0m"
	echo ""

	echo -e "\e[34mSTATUS: Cleaning up Homebrew...\033[0m"
	brew cleanup
	echo -e "\e[34mDONE\033[0m"
	echo ""

	# macOS
	echo -e "\e[34mSTATUS: Upgrading outdated App Store apps via mas...\033[0m"
	mas upgrade
	echo -e "\e[34mDONE\033[0m"
	echo ""

	# PIP
	echo -e "\e[34mSTATUS: Upgrading the PIP itself...\033[0m"
	sudo pip install --upgrade pip
	echo -e "\e[34mDONE\033[0m"
	echo ""

	echo -e "\e[34mSTATUS: Updating the installed packages...\033[0m"
	echo -e "\e[31mFULL DISCLOSURE: Due to PIP's nature, you might have to deal with environment errors.\033[0m"
	sudo pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
	echo -e "\e[34mDONE\033[0m"
	echo ""

	# RUBY
	echo -e "\e[34mSTATUS: Updating the RubyGems itself...\033[0m"
	gem update --system
	echo -e "\e[34mDONE\033[0m"
	echo ""

	echo -e "\e[34mSTATUS: Updating the installed gems...\033[0m"
	echo -e "\e[31mFULL DISCLOSURE: It might(most probably will) take a while so take a break(you've been warned)!\033[0m"
	gem update
	echo -e "\e[34mDONE\033[0m"
	echo ""

	echo -e "\e[34mSTATUS: Cleaning up the installed gems...\033[0m"
	gem cleanup
	echo -e "\e[34mDONE\033[0m"
	echo ""
}
