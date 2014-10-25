dataset.dir <- './UCI HAR Dataset'
dir.sep <- '/'

get.header <- function()
{
  file <- paste(dataset.dir, 'features.txt', sep = dir.sep)
  header <- read.csv(file, header = FALSE, sep = ' ', stringsAsFactors = FALSE)
  header <- header[,2]
  c("activity_id", header)
}


# 1. Merges the training and the test sets to create one data set.

merge.training.and.test.sets <- function()
{
  header <- get.header()
  ncols <- length(header) - 1

  file <- paste(dataset.dir, "train", "X_train.txt", sep = dir.sep)
  X_train <- read.fwf(file, rep.int(16, ncols), header = FALSE, colClasses = "numeric", comment.char = "")
  file <- paste(dataset.dir, "train", "y_train.txt", sep = dir.sep)
  y_train <- read.csv(file, header = FALSE)
  train <- cbind(y_train, X_train)

  file <- paste(dataset.dir, "test", "X_test.txt", sep = dir.sep)
  X_test <- read.fwf(file, rep.int(16, ncols), header = FALSE, colClasses = "numeric", comment.char = "")
  file <- paste(dataset.dir, "test", "y_test.txt", sep = dir.sep)
  y_test <- read.csv(file, header = FALSE)
  test <- cbind(y_test, X_test)

  tbl <- rbind(train, test)
  names(tbl) <- header
  tbl
}


# 2. Extracts only the measurements on the mean and standard deviation
# for each measurement. 

extract.mean.and.standard.deviation <- function(tbl)
{
  header <- get.header()
  tbl[, grepl("activity_id", header) | grepl("-mean[(]", header) | grepl("-std[(]", header)]
}


# 3. Uses descriptive activity names to name the activities in the data
# set.

add.activity.labels <- function(tbl)
{
  file <- paste(dataset.dir, "activity_labels.txt", sep = dir.sep)
  activity.labels <- read.table(file, header = FALSE)
  names(activity.labels) <- c("activity_id", "activity")
  merge(tbl, activity.labels, by.x = "activity_id", by.y = "activity_id")
}


# 4. Appropriately labels the data set with descriptive variable names. 

# This was done during the first step.


# 5. From the data set in step 4, creates a second, independent tidy data
# set with the average of each variable for each activity and each
# subject.
