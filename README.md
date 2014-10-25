# Getting and Cleaning Data Project

This is the final project for the 'Getting Cleaning Data' course. It contains a single script (```run_analysis.R```), the code book and this ```README``` file.
The script assumes that the dataset was unzipped on the same directory. After 'sourcing' the file on R, the script will create the file ```database.txt``` on the working directory with the new tidy dataset :)

## Steps to work on this cource project
1. Download and unzip the datasource file.
2. Download the script ```run_analysis.R``` in the parent folder.
3. Start RStudio or R. Set the working directory properly using ```setwd()``` if required.
4. Type ```source("run_analysis.R")``` and hit ```ENTER```. The file ```database.txt``` will be created on the working directory.

## Dependencies

This projects depends on the library ```reshape```.
