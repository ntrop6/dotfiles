#!/bin/bash

if systemctl --user is-active NetworkManager
then systemctl --user stop NetworkManager
else systemctl --user start NetworkManager
fi
