Tony Silva
Text Analytics - CS 5970
Discussions Comparisons

In order to run the bash script please use the file "discussions.sh". 

How to run:

To run the bash script that was developed please do the following.


1) cd to the directory containing the discussions.sh file
2) Give permissions to the .sh file to be "runnable": chmod +x ./discussions.sh or add sudo in front of that.
3) Ensure that the discussions.thorn file is located in current directory
4) Run the statement ./discussions.sh
5) Be amazed.


File Adjustments:

The file received for the assignment was a "þ" - thorn delimited file. The file contains disscusion comments from our class. The comments were segmented by the thorn delimiter but some also contained empty newlines. So to process the file better, the .sh file I wrote adjusts the file to remove newlines.

Duplicate Processing;

The bash file loops through the discussion comments, it then has a nested loop that also loops through the discussion comments.
The code will split each discussion comment into a set of 4-character long strings and save the set into a file. Then the program will calculate the similarity metric between the two discussions and then continue the loop.
As the similarity is calculated, the id of both discussion comments being compared are outputted onto a line with the similarity metric next to them on the same line.


Similarity Metric:

The similarity metric that was used in this assignment was the Jaccard Similarity of 4-character long strings of the discussions. The Jaccard similarity is calculated by taking the intersection of two sets and then dividing the union of the two sets.
Essentially the metric is the percentage of elements in both sets.

Adjustables:

You can adjust how long the x-character long strings are by adjusting the code where the x.txt and y.txt are being adjusted. Change w4 to w5 if you want 5-character long strings.
