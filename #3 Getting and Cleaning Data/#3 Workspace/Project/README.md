# Getting and Cleaning Data Course Project
Course Project for Getting and Cleaning Data, part of Data Science Specialization by John Hopkins University on Coursera. The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set.

### How does this repo work?
 * Download the entire repo
 * Open the R Markdown file run_analysis.Rmd
 * Run all chunks of R code in run_analysis.Rmd
 * Cleaning Data Analysis Report is run_analysis.pdf
 
### Step-by-Step Analysis (run_analysis.Rmd)
 * <a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">Downloading raw data</a> to the **data** folder
 * Loading subject data (test + train)
 * Loading features data (test + train)
 * Loading activity data (test + train)
 * Combining subject data (test + train)
 * Combining features data (test + train)
 * Combining activity data (test + train)
 * Factoring activity levels
 * Naming variables: subject & activity
 * Naming variables: features
 * Subsetting features data
 * Combining to a final data frame
 * Explicitly naming time and frequency variables
 * Extracting mean and standard deviation
 * Write the clean dataset to a text file
