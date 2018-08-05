# Getting and Cleaning Data course project

One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users.

In this project, data collected from the accelerometer and gyroscope of the Samsung Galaxy S smartphone was retrieved, worked with, and cleaned, to prepare a tidy data that can be used for later analysis.

This repository contains the following files:

- `README.md`
- `CodeBook.md`
- `run_analysis.R`
- `tidy_data.txt`

## Creating the data set <a name="creating-data-set"></a>

The R script `run_analysis.R` can be used to create the data set. It retrieves the source data set and transforms it to produce the final data set by implementing the following steps (see the Code book for details, as well as the comments in the script itself):

- Preparations: Download and unzip source data if it doesn't exist.
- step 1: Merges the training and the test sets to create one data set
- step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
- step 3: Uses descriptive activity names to name the activities in the data set
- step 4: Appropriately labels the data set with descriptive variable names.
- step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
- step last. Write the data set to the `tidy_data.txt` file.
