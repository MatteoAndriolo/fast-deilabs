# Fast DEI-labs
Immediately register your entrance or exit from one of the DEI labs.

## Installation
To install the script to path:
`./install.sh`

To clean the installation run:
`./install.sh clean`

## Usage

The script will automatically register your entrance or exit from one of the DEI labs.

If you want to manually register your entrance or exit from one of the DEI labs, you can use the following command:
`fast_deilabs [options] <in| out>`

where:
* `in`: Register entry with current configuration
* `out`: Register exit with current configuration

## Configuring

During the installation, the tool will ask for the user's DEI account name and password. 
It assumes that you will be in lab "417 DEI/G" by default.

Manual configuration can be done either by modifying the configuration file `~/.config/fast_deilabs/setup.config`, or by running the command "fast_deilabs" with the following options:
* `-n NAME`: Set DEI account name
* `-l LAB `: Set current lab name, format e.g.: 330 DEI/A.
* `-p PSW `: Set user psw. WARNING: saved unencrypted. If you don't save the psw you will be prompted each time
* `-r` : Reset password
* `-h` : Show an help
