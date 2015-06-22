#Code Book
This script run_analysis.R contains code to perform operations from course project.
1. All data is loading in to environment
2. Data is divided into multiple files. At first we must merge data in one data set.
2.1. Merge training and test sets for data (x_test(train).txt) , activity labels (y_test(train).txt) and  subject (subject_test(train).txt) by adding test set to the end of traning set.
2.2. Merge these three kinds of data in one data set.
3. Extracts only the measurements on the mean and standard deviation for each measurement. 
4. Add labels to this data set from file features.txt
5. Then set descriptive activity names to name the activities in the data set
6. And create another, independent tidy data set with the average of each variable for each activity and each subject.
