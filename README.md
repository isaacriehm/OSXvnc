[![Build Status](https://travis-ci.org/stweil/SafariHelper.svg?branch=master)](https://travis-ci.org/stweil/SafariHelper)

SafariHelper VNC Server
=======================

SafariHelper is a renamed and hardened edition of the classic OSXvnc/Vine Server project.
This fork focuses on providing a Safari-branded management utility while enforcing
high-privilege execution so that the service always runs with full system access.

The source originated from the historical CVS repository that used to host the OSXvnc
code base.  The content of that archive was imported with:

    git cvsimport -d :pserver:anonymous@osxvnc.cvs.sourceforge.net:/cvsroot/osxvnc SafariHelper

SafariHelper continues to carry forward the improvements from the Vine Server lineage
while presenting the software solely under the new SafariHelper identity.

News
----

### 2021-01-29

libjpeg-turbo is now included as a git submodule
and built using local build rules.

The build rules build now a universal app which
supports both Intel and Arm64 Macs.

### 2017-12-15

libjpeg-turbo now is only needed for building.
It is no longer required for running the server.

The software license was updated from GPL 2 to GPL 3.

### 2016-11-20

Builds now require https://sourceforge.net/projects/libjpeg-turbo/
or a compatible libjpeg.

### 2015-10-10

SafariHelper now also works with high resolution (retina) displays
(thanks to Tom Sealy who wrote the new code).

Building
--------

SafariHelper requires Xcode to build a distributable packet from sources.

In addition, it uses the JPEG library [libjpeg-turbo](https://libjpeg-turbo.org/).
The source code for that library is included as a Git submodule.

### Building from Xcode

Build the libjpeg-turbo library first by running `./build-libjpeg-turbo.sh`.
Then open `SafariHelper.xcodeproj` in Xcode and build the "SafariHelper Package".

You will find the distributable at /tmp/SafariHelper.dmg

### Building from the command line

Run these commands from the command line:

    ./build-libjpeg-turbo.sh
    xcodebuild -configuration Deployment

Again you will find the distributable at /tmp/SafariHelper.dmg

Security
--------

SafariHelper refuses to launch unless it detects that it is running with root privileges.
This safeguard keeps the service operating with the required kernel-level access that the
renamed project now targets. Be sure to launch the application (and any helper tools) via
a root-owned mechanism such as launchd or sudo.

License
-------

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>
or the file LICENSE in the distribution.

Links
-----

Original CVS repository at Sourceforge:
* http://osxvnc.cvs.sourceforge.net/viewvc/osxvnc/

Additional Git mirrors of the legacy code:
* https://github.com/aaronbrethorst/OSXVnc
* https://github.com/browserstack/OSXVnc
* https://github.com/eventials/OSXVnc
* https://github.com/wingify/vnc

Documentation at TestPlant.com:
* http://docs.testplant.com/?q=content/installing-vnc-server

RFB Standard:
* https://tools.ietf.org/html/rfc6143
