X_test <- read.table("X_test.txt")


X_test


Y_test <- read.table("Y_test.txt")

X_train <- read.table("X_train.txt")

Y_train <- read.table("Y_train.txt")
features <- read.table("features.txt")


activity <- read.table("activity_labels.txt")
test_sub <- read.table("subject_test.txt")
test_sub
train_sub <- read.table("subject_train.txt")
train_sub


Sub <- rbind(test_sub,train_sub)

Sub

ydata<- rbind(Y_test,Y_train)

ydata

xdata <- rbind(X_test,X_train)

merge_sub <- cbind(Sub,ydata)

merge_sub

merged_data <- cbind(merge_sub,xdata)

merged_data

colmn_data<- grep("mean|std", features[,2])


colmn_data

colmn_data <- colmn_data + 2

colmn_data

colmn_data <- c(1,2,colmn_data)

colmn_data

Dataset <- merged_data[,colmn_data]

Dataset

dim(Dataset)

colmn_data <- grep("mean|std", features[,2])


colmn_data

f_titles <- features[,2]



f_titles

f_titles <- f_titles[colmn_data]

f_titles

f_titles <- lapply(f_titles,as.character)



f_titles

f_titles <- c("Subject", "Activity", f_titles)


f_titles

colnames(Dataset) <- f_titles

Dataset

activity_labels <- activity[,2]

activity_labels

Dataset <- within(Dataset, Activity <- factor(Activity, labels = activity_labels))

Dataset

library(reshape)

pre_mean <- melt(Dataset, id=c("Subject","Activity"))


pre_mean

library(reshape2)

tidydata <- dcast(pre_mean, Subject+Activity ~ variable, mean)


tidydata

write.table(tidydata, "tidydata.txt", row.names= FALSE,sep = " ")



