#!/bin/bash

#############################################################
# This script copies all files from a source to a destination
#############################################################

PATH_SOURCE_A="/home/$USER/Backups/Archive/."
PATH_DESTINATION_A="/run/media/$USER/DriveName/Backups/Archive"

PATH_SOURCE_B="/home/$USER/Backups/Secure Archive/."
PATH_DESTINATION_B="/run/media/$USER/DriveName/Backups/Secure Archive"

#############################################################
# Copying of Archives
printf "Copying Archive files from %s to %s\n" "$PATH_SOURCE_A" "$PATH_DESTINATION_A"

cp -rv "$PATH_SOURCE_A" "$PATH_DESTINATION_A"
# -r            -> copies directories recursively
# -v            -> verbose output
# -f            -> force overwrite

#############################################################
# Syncing of Secure Archives
printf "Syncing Secure Archive files from %s to %s\n" "$PATH_SOURCE_B" "$PATH_DESTINATION_B"

rsync -ah --delete --progress "$PATH_SOURCE_B" "$PATH_DESTINATION_B"
# -a            -> arhive mode (preserves permissions, ownership, timestamps, symlinks)
# -v            -> verbose output
# -h            -> show readable sizes
# --progress    -> shows a progress bar
# --delete      -> removes files from destination that does not exist in source

read -p 'Copy finished. Press enter to exit...'
