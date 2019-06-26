#!/bin/bash

# Taken from:
# https://cowboyprogrammer.org/2016/09/reboot_machine_on_wrong_password/



# Do not add -eu, you need to allow empty variables here!

# To be used with PAM. Look in /etc/pam.d for the script that your
# screensaver etc uses. Typically it references common-account and common-auth.
#
# In common-auth, add this as the first line
#auth       optional     pam_exec.so debug /path/to/wrongpassword.sh
#
# In common-account, add this as the first line
#account    required     pam_exec.so debug /path/to/wrongpassword.sh
#

# Quite a dirty hack
PATH="/run/current-system/sw/bin"

echo "Current user: "$(whoami)

COUNTFILE="/var/log/failed_login_count"

# Make sure file exists
if [ ! -f "${COUNFILE}" ];then
  touch "${COUNTFILE}"
  chmod 777 "${COUNTFILE}"
fi


# Read value in it
COUNT=$(cat "${COUNTFILE}")
# Increment it
COUNT=$((COUNT+1))
echo "${COUNT}" > "${COUNTFILE}"

# if authentication
if [ "${PAM_TYPE}" == "auth" ]; then
  # The count will be at 4 after 3 wrong tries
  if [ "${COUNT}" -ge 4 ]; then
    # Shutdown in 1 min
    #/usr/bin/shutdown --no-wall -h +1
    # This is a hack because the line above gives a segfault in logind
    echo "0" > "${COUNTFILE}"
    echo "Initiating poweroff due to the auth failure"
    systemctl poweroff
  fi
# If authentication succeeded, and we are now in account phase
elif [ "${PAM_TYPE}" == "account" ]; then
  echo "0" > "${COUNTFILE}"
  # Cancel shutdown which was just issued
  echo "Successfull login, account pam type, resetting counter"
  shutdown -c
fi

exit 0
