datazip <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if (file.exists("run.zip")) {
    cat("File already exists")
} else {
    download.file(datazip,"run.zip",method="curl")
}

dateDownloaded <- date()
dateDownloaded

unzip("run.zip")

# 1. Merges the training and the test sets to create one data set.
features <- read.table("./UCI HAR Dataset/features.txt")
X_test_data <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names=features[,2])
X_train_data <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names=features[,2])
X_combined <- rbind(X_test_data, X_train_data)


# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
extractFeatures <- features[grep("(mean|std)\\(", features[,2]),]
mean_and_stddev <- X_combined[,extractFeatures[,1]]


# 3. Uses descriptive activity names to name the activities in the data set
y_test_data <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = c('activity_code'))
y_train_data <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = c('activity_code'))
y_combined <- rbind(y_test_data, y_train_data)

labels <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names=c('activity_code','activity_name'))

library(sqldf) 

y_combined <- sqldf("select a.activity_code, b.activity_name from
y_combined a, labels b where a.activity_code=b.activity_code")

# 4. Appropriately labels the data set with descriptive activity names. 
X_with_labels <- cbind(y_combined, X_combined)
mean_and_stddev_with_labels <- cbind(y_combined, mean_and_stddev)

# 5. Creates a second, independent tidy data set with the average of each variable 
#    for each activity and each subject. 
subject_test_data <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = c('subject'))
subject_train_data <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = c('subject'))
subject <- rbind(subject_test_data, subject_train_data)
averages <- aggregate(X_combined, by = list(activity_code = y_combined[,1], subject = subject[,1]), mean)

write.csv(averages, file='tidy_data.txt', row.names=FALSE)