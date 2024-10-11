#!/bin/sh

# Prevent Crackling with PipeWire/WirePlumber
#sudo sed -i 's/--\["session.suspend-timeout-seconds"\] = 5/\["session.suspend-timeout-seconds"\] = 0/' /usr/share/wireplumber/main.lua.d/50-alsa-config.lua
#systemctl restart --user pipewire.service
