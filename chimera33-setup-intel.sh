#!/bin/bash

sudo pacman -Sy base-devel gcc-libs glibc libcap.so=2-64 libdrm libliftoff.so=0-64 libpipewire-0.3.so=0-64 libvulkan.so=1-64 libwlroots.so=10-64 libx11 libxcomposite libxdamage libxext libxkbcommon.so=0-64 libxrender libxres libxtst libxxf86vm sdl2 vulkan-icd-loader wayland wayland-protocols wlroots xorg-server-xwayland git glslang meson ninja vulkan-headers pixman linux-api-headers mesa udev seatd libinput libxfixes libxcb xcb-util-wm libxi xcb-util-errors libglvnd xorgproto
git clone -b oxp-90-intel https://github.com/ruineka/gamescope-onexplayer ~/gamescope-onexplayer/oxp-90-intel
cd ~/gamescope-onexplayer/oxp-90-intel
meson build/
ninja -C build/
sudo meson install -C build/ --skip-subprojects
killall -9 gamescope 
sudo cp ~/gamescope-onexplayer/oxp-90-intel/build/gamescope /usr/bin
sudo cp /usr/local/bin /usr/bin

git clone https://github.com/ShadowBlip/HandyGCCS.git ~/HandyGCCS
cd ~/HandyGCCS
sudo make install
chimera-session gamepadui
reboot