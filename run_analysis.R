
#Load and merge data

pathTest<-"Dataset\\test\\"
pathTrain<-"Dataset\\train\\"

y_test<-read.table(paste(pathTest,"y_test.txt", sep = ""))
x_test<-read.table(paste(pathTest,"x_test.txt", sep = ""))
sbj_test<-read.table(paste(pathTest,"subject_test.txt", sep = ""))
y_train<-read.table(paste(pathTrain,"y_train.txt", sep = ""))
x_train<-read.table(paste(pathTrain,"x_train.txt", sep = ""))
sbj_train<-read.table(paste(pathTrain,"subject_train.txt", sep = ""))
y<-rbind(y_train,y_test)
x<-rbind(x_train,x_test)
subj<-rbind(sbj_train,sbj_test)
activity<-read.table("Dataset\\activity_labels.txt")
features<-read.table("Dataset\\features.txt")
# Naming data
y[, 1] <- activity[y[, 1], 2]
names(y) <- "activity"
names(subj) <- "subject"


#Extract only mean and std
msfeatures <- grep("-(mean|std)\\(\\)", features[, 2])
x <- x[,msfeatures]
names(x) <- features[msfeatures, 2]

#Create single dataset
data <- cbind(x, y, subj)

#create data set with the average of each variable for each activity and each subject
tidy_data <- ddply(data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(tidy_data, "tidy_data.txt", row.name=FALSE)