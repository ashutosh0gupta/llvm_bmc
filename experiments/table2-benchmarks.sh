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
#### TABLE 2
########################################################

#benchmarks["parker"]="-unroll=5;-DN=5"
benchmarks["lamport"]="NO_UNROLL;-DN=3"

#benchmarks["peterson"]="-unroll=20;-DN=20" #context = 4
#benchmarks["szymanski"]="NO_UNROLL;-DN=1,NO_UNROLL;-DN=2"  #context = 3
#benchmarks["lamport"]="NO_UNROLL;-DN=2"
#benchmarks["parker"]="-unroll=3;-DN=3"

#benchmarks["peterson"]="-unroll=10;-DN=10,-unroll=20;-DN=20,-unroll=30;-DN=30"
#benchmarks["parker"]="-unroll=3;-DN=3,-unroll=4;-DN=4,-unroll=5;-DN=5"
#benchmarks["szymanski"]="NO_UNROLL;-DN=1,NO_UNROLL;-DN=2,NO_UNROLL;-DN=3"
#benchmarks["lamport"]="NO_UNROLL;-DN=2,NO_UNROLL;-DN=3,NO_UNROLL;-DN=4"
