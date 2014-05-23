<h1>Coursera Data Science Specialization</h1>
<h2>"Getting and Cleaning Data" — Course Project Week 3</h2>


An R script called run_analysis.R that does the following:

<ol>
<li>Merges the training and the test sets to create one data set.</li>
<li>Extracts only the measurements on the mean and standard deviation for each measurement.</li>
<li>Uses descriptive activity names to name the activities in the data set.</li>
<li>Appropriately labels the data set with descriptive activity names.</li>
<li>Creates a second, independent tidy data set with the average of each variable for each activity and each subject.</li>
</ol>

Use the steps below to follow the code in the "run.analysis.R" code file

<ol>
<li>Download the dataset if not present</li> 
<li>rbind two data files to merge the training and the test sets to create one data set.</li>
<li>Take only std() and mean() features, subset the dataset to extract only the measurements on the mean and standard deviation for each measurement.; the result is in mean_and_stddev</li>
<li>Load the activity labels, and use the sqldf() library to combine the activity with activity label.</li>
<li>Combines the labels and the data set using cbind; doing that for both mean_and_stddev and X_combined. This labels the data set with descriptive activity names.</li>
<li>Using the X_combined dataset, calculate mean for for each activity and eachsubject; then save the result to a file to get the independent, tidy dataset.</li>
</ol>