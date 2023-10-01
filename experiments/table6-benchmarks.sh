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
#### TABLE 6
########################################################

#benchmarks["workstealingqueue"]="NO_UNROLL;-DN=2"
#benchmarks["workstealingqueue"]="NO_UNROLL;-DN=2,NO_UNROLL;-DN=4,NO_UNROLL;-DN=8"
#benchmarks["stack_true"]="NO_UNROLL;-DN=1,NO_UNROLL;-DN=2,NO_UNROLL;-DN=3"
#benchmarks["queue_ok"]="NO_UNROLL;-DN=1,NO_UNROLL;-DN=2,NO_UNROLL;-DN=3"
#benchmarks["sigma"]="NO_UNROLL;-DN=3,NO_UNROLL;-DN=4,NO_UNROLL;-DN=5"
#benchmarks["fibonacci"]="NO_UNROLL;-DN=3,NO_UNROLL;-DN=4,NO_UNROLL;-DN=5"
#benchmarks["circular_buffer"]="NO_UNROLL;-DN=3,NO_UNROLL;-DN=4,NO_UNROLL;-DN=5"
#benchmarks["airline"]="NO_UNROLL;-DN=3,NO_UNROLL;-DN=4,NO_UNROLL;-DN=5"
#benchmarks["bubblesort"]="NO_UNROLL;-DN=3,NO_UNROLL;-DN=4,NO_UNROLL;-DN=5"
#benchmarks["account"]="NO_UNROLL;-DN=2,NO_UNROLL;-DN=3,NO_UNROLL;-DN=4"
#benchmarks["poke"]="NO_UNROLL;-DN=1,NO_UNROLL;-DN=2,NO_UNROLL;-DN=3"
#benchmarks["multiprodcon"]="NO_UNROLL;-DN=2,NO_UNROLL;-DN=3,NO_UNROLL;-DN=4"
#benchmarks["multiprodcon"]="NO_UNROLL;-DN=2,NO_UNROLL;-DN=3,NO_UNROLL;-DN=4"
#benchmarks["dispatcher"]="NO_UNROLL;-DN=2,NO_UNROLL;-DN=3,NO_UNROLL;-DN=4"
#benchmarks["exponential_bug"]="NO_UNROLL;-DN=3,NO_UNROLL;-DN=4,NO_UNROLL;-DN=5"
#benchmarks["dijkstra"]="--unroll=3;-DN=2,--unroll=4;-DN=2,--unroll=5;-DN=2"
#benchmarks["pgsql"]="--unroll=3;-DN=3,--unroll=4;-DN=4,--unroll=5;-DN=5"
#benchmarks["dekker"]="--unroll=2;-DN=2,--unroll=3;-DN=2,--unroll=4;-DN=2"
benchmarks["dekker"]="--unroll=2;-DN=2"

