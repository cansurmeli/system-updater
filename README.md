# macOS System Updater

A simple-to-use CLI utility to properly update your macOS system all at once.

## What's Updated

- Homebrew
- App Store apps
- Python 2
- PIP
- Ruby
- RVM

> Python 3 and PIP 3 are updated by Homebrew if you've installed them from Homebrew which is mostly the case.

## Why Properly Updated

Once you want to do a full update of your macOS installation, there occurs various struggles:

1. Even though some commands are easy to type, others can be more elaborate,
2. These commands fill up their caches that needs to be cleaned regularly which is another thing for you to keep track of,
3. If you're manually entering these commands, you're going to have to wait in between them; losing time.

This script goes through whatever is needed so that you don't have to deal with it.

## Requirements

- Homebrew
- `mas`: required for updating the App Store apps from the CLI:
	- `brew install mas`

## Usage

`updateSystem [OPTIONS] [ENV]`

## Command Line Argument Options

- **-d, --debug:** enable debug mode.
- **-h, --help:** See a synopsis.
- **-o, --output:** Output the logs to a given file.
- **-v, --verbose:** While updating, be verbose & output what's being generated by each and every command. The default is that merely the main command entrances and exits will de displayed.

## Available Update Environments

- macos
- homebrew
- ruby
- rvm
- python2
- pip
- system(all of the above combined)

## Usage Examples

Updating everything:

	update system

Update everything and log to the given location:

	update -o ~/Desktop/update.log -v system

Just update `Ruby` & `PIP`:

	update ruby pip

Be verbose and show what's going on while updating:

	update -v
