---
title: "README"
output: html_document
date: "2025-02-02"
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

All of the data was extracted from the "UCI HAR Dataset" folder. The purpose of the data cleaning
was to summarise the averages of "mean()" and "std()" signal variables by the subject and activity.

# TRANSFORMATIONS in run_analysis.R
1. Starting with the test dataset, the subjects, activities, and signal variables were extracted 
from their respective raw files.
2. The column names of the signal variables were set based on "features.txt"
3. Signal variables that calculate mean() and std() were selected while others were excluded.
4. A new data frame consisting of the subjects, activities, and selected signal variables was 
created.
5. Steps 1-4 were repeated with the train dataset.
6. After two data frames were created, they were merged vertically to combine the variables.
7. The data in the second column (corresponding to activities) was transformed to become more 
descriptive. The values were substituted to string characters describing the type of activity as
shown in "activity_labels.txt".
8. The column names in the merged data frame were transformed to become more descriptive. The first
and second column names were changed to "subject" and "activity" respectively. Regarding the signal
variables, the period symbols (.) were removed while the first letters of "mean" and "std" were
capitalised to improve readability. The typo "BodyBody" on some variables were also corrected to
"Body".
9. A new data frame is created to summarise the averages of the signal variables based on the
subjects and types of activity. This is the final data frame that is submitted for the assignment.