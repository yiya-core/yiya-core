Sample init scripts and service configuration for yiyad
==========================================================

Sample scripts and configuration files for systemd, Upstart and OpenRC
can be found in the contrib/init folder.

    contrib/init/yiyad.service:    systemd service unit configuration
    contrib/init/yiyad.openrc:     OpenRC compatible SysV style init script
    contrib/init/yiyad.openrcconf: OpenRC conf.d file
    contrib/init/yiyad.conf:       Upstart service configuration file
    contrib/init/yiyad.init:       CentOS compatible SysV style init script

Service User
---------------------------------

All three Linux startup configurations assume the existence of a "yiya" user
and group.  They must be created before attempting to use these scripts.
The OS X configuration assumes yiyad will be set up for the current user.

Configuration
---------------------------------

At a bare minimum, yiyad requires that the rpcpassword setting be set
when running as a daemon.  If the configuration file does not exist or this
setting is not set, yiyad will shutdown promptly after startup.

This password does not have to be remembered or typed as it is mostly used
as a fixed token that yiyad and client programs read from the configuration
file, however it is recommended that a strong and secure password be used
as this password is security critical to securing the wallet should the
wallet be enabled.

If yiyad is run with the "-server" flag (set by default), and no rpcpassword is set,
it will use a special cookie file for authentication. The cookie is generated with random
content when the daemon starts, and deleted when it exits. Read access to this file
controls who can access it through RPC.

By default the cookie is stored in the data directory, but it's location can be overridden
with the option '-rpccookiefile'.

This allows for running yiyad without having to do any manual configuration.

`conf`, `pid`, and `wallet` accept relative paths which are interpreted as
relative to the data directory. `wallet` *only* supports relative paths.

For an example configuration file that describes the configuration settings,
see `contrib/debian/examples/yiya.conf`.

Paths
---------------------------------

### Linux

All three configurations assume several paths that might need to be adjusted.

Binary:              `/usr/bin/yiyad`  
Configuration file:  `/etc/yiya/yiya.conf`  
Data directory:      `/var/lib/yiyad`  
PID file:            `/var/run/yiyad/yiyad.pid` (OpenRC and Upstart) or `/var/lib/yiyad/yiyad.pid` (systemd)  
Lock file:           `/var/lock/subsys/yiyad` (CentOS)  

The configuration file, PID directory (if applicable) and data directory
should all be owned by the yiya user and group.  It is advised for security
reasons to make the configuration file and data directory only readable by the
yiya user and group.  Access to yiya-cli and other yiyad rpc clients
can then be controlled by group membership.

### Mac OS X

Binary:              `/usr/local/bin/yiyad`  
Configuration file:  `~/Library/Application Support/Yiya/yiya.conf`  
Data directory:      `~/Library/Application Support/Yiya`  
Lock file:           `~/Library/Application Support/Yiya/.lock`  

Installing Service Configuration
-----------------------------------

### systemd

Installing this .service file consists of just copying it to
/usr/lib/systemd/system directory, followed by the command
`systemctl daemon-reload` in order to update running systemd configuration.

To test, run `systemctl start yiyad` and to enable for system startup run
`systemctl enable yiyad`

### OpenRC

Rename yiyad.openrc to yiyad and drop it in /etc/init.d.  Double
check ownership and permissions and make it executable.  Test it with
`/etc/init.d/yiyad start` and configure it to run on startup with
`rc-update add yiyad`

### Upstart (for Debian/Ubuntu based distributions)

Drop yiyad.conf in /etc/init.  Test by running `service yiyad start`
it will automatically start on reboot.

NOTE: This script is incompatible with CentOS 5 and Amazon Linux 2014 as they
use old versions of Upstart and do not supply the start-stop-daemon utility.

### CentOS

Copy yiyad.init to /etc/init.d/yiyad. Test by running `service yiyad start`.

Using this script, you can adjust the path and flags to the yiyad program by
setting the YIYAD and FLAGS environment variables in the file
/etc/sysconfig/yiyad. You can also use the DAEMONOPTS environment variable here.

### Mac OS X

Copy org.yiya.yiyad.plist into ~/Library/LaunchAgents. Load the launch agent by
running `launchctl load ~/Library/LaunchAgents/org.yiya.yiyad.plist`.

This Launch Agent will cause yiyad to start whenever the user logs in.

NOTE: This approach is intended for those wanting to run yiyad as the current user.
You will need to modify org.yiya.yiyad.plist if you intend to use it as a
Launch Daemon with a dedicated yiya user.

Auto-respawn
-----------------------------------

Auto respawning is currently only configured for Upstart and systemd.
Reasonable defaults have been chosen but YMMV.
