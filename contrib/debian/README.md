
Debian
====================
This directory contains files used to package yiyad/yiya-qt
for Debian-based Linux systems. If you compile yiyad/yiya-qt yourself, there are some useful files here.

## yiya: URI support ##


yiya-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install yiya-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your yiya-qt binary to `/usr/bin`
and the `../../share/pixmaps/yiya128.png` to `/usr/share/pixmaps`

yiya-qt.protocol (KDE)

