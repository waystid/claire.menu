#!/bin/bash
######################################################################
# Title   : Benchmark - Network Performance
# By      : DiscDuck, Taos15
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh
source /opt/claire/claire.menu/claire.func/sauce.sh

logo
msgbox "Benchmark - Network Performance"
curl -sL yabs.sh | bash -s -- -fg