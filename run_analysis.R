
##The data are divided into the training and test data sets. 

##subject_train/test is a list of the Subject identifiers for each row.

##y_train/test is a list list of the Activity identifiers for each row.

##X_train/test is a table filled with the measurement values and it is organized based on 
##the y_train/test activity identifiers and the subject_train/test subject identifiers

##The columns past the first two factors are values of various variables related to
##triaxial measures from a Samsung Galaxy S II Cell Phone.

##First, let's import the feature names and prepare them for use in the read.table function.

features<-read.table("./features.txt")

##Now, let's import the training data.

subject_train<-read.table("./subject_train.txt",col.names=c("Subject"))
y_train<-read.table("./y_train.txt",col.names=c("Activity"))
X_train<-read.table("./X_train.txt",col.names = as.character(features$V2))

##Next, we will bind the three tables into one called "train".

train<-cbind(subject_train,y_train,X_train)

##Let's import the test data.

subject_test<-read.table("./subject_test.txt",col.names=c("Subject"))
y_test<-read.table("./y_test.txt",col.names=c("Activity"))
X_test<-read.table("./X_test.txt",col.names = as.character(features$V2))

##Next, we will bind the three tables into one called "test".

test<-cbind(subject_test,y_test,X_test)

##Let's bind the two data sets by their rows. We will have one large data set that contains
##both the training and test observations with their factors and values.

alldata<-rbind(train,test)

##Now let's coerce Subject and Activity into the factor class so it'll be easier to summarize 
##the data.

alldata$Activity<-as.factor(alldata$Activity)
alldata$Subject<-as.factor(alldata$Subject)

##Now let's change the Activity labels to something more readable. 

levels(alldata$Activity)<-c("Walking","Walking_Upstairs","Walking_Downstairs","Sitting",
                            "Standing","Laying")

##To extract only the mean and standard deviation for each measurement, we need to see where 
##".std" and ".mean" show up in the column names of the full data set.

colnames<-colnames(alldata)

matches<-c(grep('mean', colnames),grep('std', colnames))

alldatasubset<-alldata[,c(1,2,matches)]

##After creating a list of the factors, we can aggreagte the data based on both of them. 

factorlist<-list(alldatasubset$Subject,alldatasubset$Activity)

aggregateddata<-aggregate(alldatasubset[,3:ncol(alldatasubset)],by=factorlist,FUN = mean)

##We need to relabel the first two columns and then finally write the table.

colnames(aggregateddata)[1:2]<-c("Subject","Activity")

write.table(aggregateddata,file="./finaltable.txt",row.names=FALSE)