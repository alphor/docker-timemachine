#!/bin/bash

set -e

# Need to initialize?
if [ ! -e /.initialized ]; then

    # WARNING: hard coded user with plain text file. This setup is for testing purposes ONLY!
    
    # Add the user
    useradd testuser -M
    echo testuser:easypass | chpasswd

    cp /afp/afp.conf /etc/local/etc/afp.conf

    touch /.initialized
fi

# make the personal directory.
mkdir /timemachine/testuser

# Initiate the timemachine daemons
chown -R testuser:testuser /timemachine/testuser

# Clean out old locks
/bin/rm -f /var/lock/netatalk

# Launch netatalk server
/etc/init.d/netatalk start

/bin/bash
