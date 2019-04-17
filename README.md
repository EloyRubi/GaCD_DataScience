

## Course Project

This is the course project for the Getting and Cleaning Data course. The run_analysis.R does the following.

1. Downloads the dataset and unzips it.
2. Loads the train and test datasets into R, keeping the columns with a mean or a std measure
3. Loads activity and subject datasets
4. Merges the datasets
5. Produces a tidy dataset of the mean value of each variable, previously reshaped through the _melt_ and _dcast_ functions.

The result is shown in *tidyData.txt*
