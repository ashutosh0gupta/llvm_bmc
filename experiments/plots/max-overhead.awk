/usr/bin/awk -v col1="$2" -v col2="$3" -v threshold="$4" '

# Calculates the maximal difference (in percentage) given a file that contains
# two columns with measurements

BEGIN {
	if (col1 <= 0 || col2 <= 0 || ARGC != 2) {
		print "Usage: max-overhead.awk <input_file> <column1 #> <column2 #> [time threshold]" > "/dev/stderr";
		exit 1;
	}

	if (threshold <= 0)
		threshold = 0;

	max_overhead = 0;
	benchmark = "";
}

!/time/ {
	if ($col1 > threshold || $col2 > threshold) {
		max = ($col1 > $col2) ? $col1 : $col2;
		min = ($col1 < $col2) ? $col1 : $col2;
		overhead = max / min;
		if (overhead > max_overhead) {
			max_overhead = overhead;
			benchmark = $1;
		}
	}
}

END {
	print benchmark,max_overhead
}
' $1
