#!/bin/sh
sleep 5 # give network time to come up on OpenRC
echo "Mounting Unraid shares..."
mount -a -t cifs || true
