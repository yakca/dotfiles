# General aliases
alias b='~/blender-git/build/bin/blender'
alias e="emacs -nw"
alias g="git"
alias v="vim"
alias pu="vim +PluginUpdate +qall"
alias mkdir="mkdir -pv"
alias df="df -h"

# vagrant aliases
alias vs="vagrant ssh"
alias vu="vagrant up"
alias vus="vagrant up; and vagrant ssh"
alias vh="vagrant halt"
alias vg="vagrant global-status"
alias vr="vagrant reload"
alias vrp="vagrant reload --provision"

# Pacman alias
alias pacupg='sudo pacman -Syu'		# Synchronize with repositories and then upgrade packages that are out of date on the local system.
alias pacdl='pacman -Sw'		# Download specified package(s) as .tar.xz ball
alias pacin='sudo pacman -S'		# Install specific package(s) from the repositories
alias pacins='sudo pacman -U'		# Install specific package not from the repositories but from a file
alias pacre='sudo pacman -R'		# Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacrem='sudo pacman -Rns'		# Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacrep='pacman -Si'		# Display information about a given package in the repositories
alias pacreps='pacman -Ss'		# Search for package(s) in the repositories
alias pacloc='pacman -Qi'		# Display information about a given package in the local database
alias paclocs='pacman -Qs'		# Search for package(s) in the local database
alias paclo="pacman -Qdt"		# List all packages which are orphaned
alias pacc="sudo pacman -Scc"		# Clean cache - delete all the package files in the cache
alias paclf="pacman -Ql"		# List all files installed by a given package
alias pacown="pacman -Qo"		# Show package(s) owning the specified file(s)
alias pacexpl="pacman -D --asexp"	# Mark one or more installed packages as explicitly installed
alias pacimpl="pacman -D --asdep"	# Mark one or more installed packages as non explicitly installed

# Additional pacman alias
alias pacupd='sudo pacman -Sy; and sudo abs'         # Update and refresh the local package and ABS databases against repositories
alias pacinsd='sudo pacman -S --asdeps'            # Install given package(s) as dependencies
alias pacmir='sudo pacman -Syy'                    # Force refresh of all package lists after updating /etc/pacman.d/mirrorlist

set -gx LANG en_GB.UTF-8
set -gx LC_TIME en_GB.UTF-8
set -gx LC_COLLATE C

# eval (python3 -m virtualfish compat_aliases auto_activation global_requirements)
