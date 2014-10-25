dataset.dir <- './UCI HAR Dataset'
dir.sep <- '/'

get.header <- function()
{
  file <- paste(dataset.dir, 'features.txt', sep = dir.sep)
  header <- read.csv(file, header = FALSE, sep = ' ', stringsAsFactors = FALSE)
  header <- header[,2]
  c("subject_id", "activity_id", header)
}


# 1. Merges the training and the test sets to create one data set.

merge.training.and.test.sets <- function()
{
  header <- get.header()
  ncols <- length(header)

  dataset <- c("train", "test")
  for (ds in dataset) {
      file <- sprintf("%s/%s/subject_%s.txt", dataset.dir, ds, ds)
      subject <- read.table(file, header = FALSE)
      file <- sprintf("%s/%s/y_%s.txt", dataset.dir, ds, ds)
      y <- read.csv(file, header = FALSE)
      file <- sprintf("%s/%s/X_%s.txt", dataset.dir, ds, ds)
      X <- read.fwf(file, rep.int(16, ncols - 2), header = FALSE, colClasses = "numeric", comment.char = "")
      assign(x = ds, value = cbind(subject, y, X))
  }
  ans <- rbind(train, test) # there must be a better way
  names(ans) <- header
  ans
}


# 2. Extracts only the measurements on the mean and standard deviation
# for each measurement. 

extract.mean.and.standard.deviation <- function(tbl)
{
  header <- get.header()
  tbl[, grepl("_id$", header) | grepl("-mean[(]", header) | grepl("-std[(]", header)]
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


