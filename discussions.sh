#!/bin/bash

# Tony Silva
# CS 5970 Text Analytics
# Duplicate Detection Assignment

# Replace the newlines that are in some of the comments 
# Makes it easier to read in
tr '\n' ' ' < discussions.thorn > discussions.txt

#Since there are 41 comments and the file doesnt end with
#a thorn, add a thorn to mark the final comment
echo 'þ' >> discussions.txt

#Create some files that will be used later
touch x.txt
touch y.txt
touch complete.txt
touch complete2.txt

# Counter for first comment
let first=1
while read -r -d 'þ' i; do
	# counter for second comment being compared to first comment
	let second=1
	# Split the comment into 4 character strings into a file
	echo $i | fold -w4 > x.txt
	# Loop through the file again to perform comparisons
	while read -r -d 'þ' j; do

		# Split up the file being compared to the first
		#Split the file into 4 character strings
		echo $j | fold -w4 > y.txt

		#Sort each of the comments 5 character strings
		#Then sort and put them together in a file
		sort < x.txt > complete.txt
		sort < y.txt >> complete.txt
		sort < complete.txt > complete2.txt
		
		# Jaccard similarity = x intersection y / x union y
		# Set theory.
		inter=$(uniq -d complete2.txt | wc -l)
		dis=$(uniq -u complete2.txt | wc -l)
		union=$[$inter + $dis]

		# Doing divisions so we cannot have division by zero
		if [ union != "0" ]; 
		 then
			#Output the comment numbers being compared
			#Output the calculation to 3 decimal places
			#Print a line if the denominator is zero.
			echo -n "$first" "$second" ""			
			printf "%0.3f\n" $(bc -q <<< scale=3\;$inter/$union)
			printf "\n"
		else
			printf "\n"
		fi
		let second++
	done < discussions.txt
	let first++	
done < discussions.txt

#Clear up the directory of the files used
rm x.txt
rm y.txt
rm discussions.txt
rm complete.txt
rm complete2.txt

