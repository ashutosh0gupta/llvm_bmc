/usr/bin/awk -v cola="$2" -v colb="$3" -v threshold="$4" '

# Calculate the geometric mean given a file that contains a column with measurements

BEGIN {
	if (cola <= 0 || colb <=0 || ARGC != 2) {
		print "Usage: geo-mean.awk <input_file> <normalizing column #> <overhead column #> [time threshold]" > "/dev/stderr";
		exit 1;
	}

	if (threshold <= 0)
		threshold = 0;

	logs = 0;
	counter= 0;
}

!/time/ {
	if ($cola > threshold) {
		logs += log($colb + 0);
		logs -= log($cola + 0);
		++counter;
	}
}

END {
	if (counter != 0)
		print exp(logs/counter);
}
' $1
