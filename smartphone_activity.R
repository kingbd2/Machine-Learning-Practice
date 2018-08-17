library(tidyverse)

library(randomForest)
library(gmodels)
library(neuralnet)
library(RSNNS)
library(Rcpp)
library(lattice)
library(ggplot2)
library(caret)
set.seed(123)

train_data<-read.table("UCI HAR Dataset/train/X_train.txt")
train_labels<-read.table("UCI HAR Dataset/train/y_train.txt")

test_data<-read.table("UCI HAR Dataset/test/X_test.txt")
test_labels<-read.table("UCI HAR Dataset/test/y_test.txt")

col_names <- readLines("UCI HAR Dataset/features.txt")
colnames(train_data)<-make.names(col_names)
colnames(test_data)<-make.names(col_names)
colnames(train_lables)<-"label"
colnames(test_lables)<-"label"

train_final<-cbind(train_lables,train_data)
test_final<-cbind(test_lables,test_data)
final_data<-rbind(train_final,test_final)
final_data$lable<-factor(final_data$lable)


train_data_tibble <- as.tibble(train_data)
train_labels_tibble <- as.tibble(train_labels)
test_data_tibble <- as.tibble(test_data)
test_labels_tibble <- as.tibble(test_labels)


#Sample histogram
ggplot(data = train_data_tibble) + geom_histogram(aes(x=train_data_tibble$X3.tBodyAcc.mean...Z))


