
#1. All data is loading in to environment

pathTest<-"Dataset\\test\\"
pathTrain<-"Dataset\\train\\"
y_test<-read.table(paste(pathTest,"y_test.txt", sep = ""))
x_test<-read.table(paste(pathTest,"x_test.txt", sep = ""))
sbj_test<-read.table(paste(pathTest,"subject_test.txt", sep = ""))
y_train<-read.table(paste(pathTrain,"y_train.txt", sep = ""))
x_train<-read.table(paste(pathTrain,"x_train.txt", sep = ""))
sbj_train<-read.table(paste(pathTrain,"subject_train.txt", sep = ""))
activity<-read.table("Dataset\\activity_labels.txt")
features<-read.table("Dataset\\features.txt")

# 2. Merge training and test sets for data (x_test(train).txt) , activity labels (y_test(train).txt) and  subject (subject_test(train).txt) by adding test set to the end of traning set.
y<-rbind(y_train,y_test)
x<-rbind(x_train,x_test)
subj<-rbind(sbj_train,sbj_test)

# 3. Then set descriptive activity names to name the activities in the data set
y[, 1] <- activity[y[, 1], 2]
names(y) <- "activity"
names(subj) <- "subject"


# 4. Extracts only the measurements on the mean and standard deviation for each measurement. 
msfeatures <- grep("-(mean|std)\\(\\)", features[, 2])
x <- x[,msfeatures]
# 5. Add labels to this data set from file features.txt
names(x) <- features[msfeatures, 2]

# 6. Merge these three kinds of data in one data set.
data <- cbind(x, y, subj)

# 7. And create another, independent tidy data set with the average of each variable for each activity and each subject.
tidy_data <- ddply(data, .(subject, activity), function(x) colMeans(x[, 1:66]))

# write result set
write.table(tidy_data, "tidy_data.txt", row.name=FALSE)
