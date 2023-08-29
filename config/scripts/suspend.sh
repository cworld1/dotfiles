#!/bin/bash

mpc -q pause
amixer set Master mute
swaylock
systemctl suspend
