#!/bin/bash

install_dir="/usr/local/bin"
exec_name="fast_deilabs"
daemon_name="fast_deilabsd"
script_name="$exec_name.sh"
daemon_script_name="$daemon_name.sh"

if [ "$EUID" -ne 0 ]; then
	echo "Please run as root"
	exit
else
	echo "Running as root"
fi

if [ $# -gt 0 ]; then
	if [ $1 = "clean" ]; then
		# Disable daemon
		systemctl disable fast_deilabs.service
		rm /etc/systemd/system/fast_deilabs.service

		unlink "$install_dir/$exec_name"
		unlink "$install_dir/$daemon_name"
		if [ $? -eq 0 ]; then
			echo "Removed link in $install_dir"
		fi
		exit
	fi
fi

chmod ugo+x $script_name
chmod ugo+x $daemon_script_name

if [ $? -ne 0 ]; then
	echo "Errors changing $script_name permissions"
	echo "Installation failed"
	exit
fi

ln -s $(pwd)/$script_name $install_dir/$exec_name
if [ $? -ne 0 ]; then
	echo "Errors linking script to $install_dir/$exec_name"
	echo "Installation failed"
	exit
fi
echo "Created link in $install_dir/$exec_name"

ln -s $(pwd)/$daemon_script_name $install_dir/$daemon_name
if [ $? -ne 0 ]; then
	echo "Errors linking script to $install_dir/$daemon_name"
	echo "Installation failed"
	exit
fi
echo "Created link in $install_dir/$daemon_name"

# Install daemon
cp ./fast_deilabs.service /etc/systemd/system/
echo "Copied service in /etc/systemd/system/fast_deilabs.service"
#systemctl enable --now fast_deilabs.service

# Install dependencies
apt-get install wget network-manager

echo "Insert username @dei"
read username

fast_deilabs -l "417 DEI/G" -n $username -p
