Code Book
                               Assign each data to variable

X_test <- read.table("X_test.txt")   :::: ->  Reading data form X_test.txt file into X_test variable (containing 2947 rows and 561 column)

X_train <- read.table("X_train.txt") :::: -> Reading data form X_train.txt file into X_train variable(containing 7352 rows and 561 column)

Y_test <- read.table("Y_test.txt") :::::  -> Reading data form Y_test.txt file into Y_test variable(containing 2947 rows and 1 column)

Y_train <- read.table("Y_train.txt")  :::::::  -> Reading data form Y_train file into Y_train variable. (containing 7352 rows and 1 column)

features <- read.table("features.txt") :::::  -> Reading data form features.txt file into feature variable. (containing 561 rows and 2 column)

activity <- read.table("activity_labels.txt") :::::::  -> Reading data form activity_labels.txt file into activity variable(containing 6 rows and 2 column)

test_sub <- read.table("subject_test.txt") ::::::::  -> Reading data form subject_test.txt file into test_sub variable(containing 2947 rows and 1 column)

train_sub <- read.table("subject_train.txt") ::::::::  -> Reading data form subject_train.txt into train_sub variable. (containing 7352 rows and 561 column)


Merges the training and the test sets to create one data set


Sub <- rbind(test_sub,train_sub) :::::::::::  -> Merging the data of test_sub and train_sub row wise using Rbind()  and storing it in Sub variable. (containing 7352 rows and 561 column)
ydata<- rbind(Y_test,Y_train)      :::::::::::::: -> Merging the data of Y_test and Y_train row wise using Rbind() and storing it in ydata variable. ((10299 rows, 1 column))
xdata <- rbind(X_test,X_train) ::::::::::::: -> Merging the data of X_test and X_train row wise using Rbind() and storing it in xdata variable. ((10299 rows, 561 columns))
merge_sub <- cbind(Sub,ydata) :::::::: -> Merging the data of Sub and ydata column wise   using cbind and storing it in merge_sub variable. ((10299 rows, 563 column))
merged_data <- cbind(merge_sub,xdata)::::: Merging the data of merge_sub and xdata column wise   using cbind and storing it in merge_data variable. ((10299 rows, 563 column))

Sub-setting the data.

colmn_data<- grep("mean|std", features[,2]):::: Storing the needed data into colmn_data using grep

Dataset <- merged_data[,colmn_data] ::: Subsetting the data from merge_data of only needed data and storing that in data set.

f_titles <- features[,2] :::::: Subsetting only the names of features from features file.


Applying names to columns.


f_titles <- c("Subject", "Activity", f_titles) ::: Making the Subjects for titles of file.
colnames(Dataset) <- f_titles :::: Applying column names to dataset.

Taking mean for each Subject.

pre_mean <- melt(Dataset, id=c("Subject","Activity"))
tidydata <- dcast(pre_mean, Subject+Activity ~ variable, mean)

