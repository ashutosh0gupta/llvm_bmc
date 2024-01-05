#!/bin/bash

# Helper script containing benchmarks to run, as well as their
# arguments.
#
# This script requires getopt from the util-linux package.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, you can access it online at
# http://www.gnu.org/licenses/gpl-2.0.html.
#
# Author: Michalis Kokologiannakis <mixaskok@gmail.com>

declare -A benchmarks

########################################################
#### TABLE 3
########################################################

#benchmarks["binc"]="NO_UNROLL;-DN=5"
#benchmarks["binc"]="NO_UNROLL;-DN=3" # armcbmc returns wrong result, nidhugg does not support
benchmarks["indexer"]="NO_UNROLL;-DN=12,NO_UNROLL;-DN=13,NO_UNROLL;-DN=14" # armcbmc could not run, nidhugg does not support

#benchmarks["ainc"]="NO_UNROLL;-DN=3,NO_UNROLL;-DN=4,NO_UNROLL;-DN=5"
#benchmarks["binc"]="NO_UNROLL;-DN=3"
#benchmarks["binc"]="NO_UNROLL;-DN=3,NO_UNROLL;-DN=4,NO_UNROLL;-DN=5"
#benchmarks["indexer"]="NO_UNROLL;-DN=12,NO_UNROLL;-DN=13,NO_UNROLL;-DN=14,NO_UNROLL;-DN=15"
