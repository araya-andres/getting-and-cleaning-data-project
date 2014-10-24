dataset.dir <- './UCI HAR Dataset/'

get.header <- function()
{
  file <- './UCI HAR Dataset/features.txt'
  header <- read.csv(file, header = FALSE, sep = ' ', stringsAsFactors = FALSE)
  header <- header[,2]
  c(header,"activity_id")
}

# Merges the training and the test sets to create one data set.
merge.training.and.test.sets <- function()
{
  header <- get.header()
  ncols <- length(header)-1

  file <- './UCI HAR Dataset/test/X_test_subset.txt'
  X_test <- read.fwf(file, rep.int(16,ncols), header = FALSE, colClasses = "numeric", comment.char = "")
  file <- './UCI HAR Dataset/test/y_test_subset.txt' # activity
  y_test <- read.csv(file, header = FALSE)
  X_test <- cbind(X_test,y_test)

  file <- './UCI HAR Dataset/train/X_train_subset.txt'
  X_train <- read.fwf(file, rep.int(16,ncols), header = FALSE, colClasses = "numeric", comment.char = "")
  file <- './UCI HAR Dataset/train/y_train_subset.txt'
  y_train <- read.csv(file, header = FALSE)
  X_train <- cbind(X_train,y_train)

  tbl <- rbind(X_train,X_test)
  names(tbl) <- c("id",header)
  tbl
}

# Extracts only the measurements on the mean and standard deviation
# for each measurement. 
extract.mean.and.standard.deviation <- function(tbl)
{
  tbl[,grepl("-mean()",header) | grepl("-std()",header)]
}

# Uses descriptive activity names to name the activities in the data
# set.
add.activity.labels <- function(tbl)
{
  file <- paste(dataset.dir,"activity_labels.txt",sep="/")
  activity.labels <- read.table(file,header=FALSE)
  names(activity.labels) <- c("activity_id", "activity")
  merge(tbl, activity.labels, by.x = "activity_id", by.y = "activity_id")
}

# Appropriately labels the data set with descriptive variable names. 
lable.data.set <- function(tbl)
{
}

# From the data set in step 4, creates a second, independent tidy data
# set with the average of each variable for each activity and each
# subject.
