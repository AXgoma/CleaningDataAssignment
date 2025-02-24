---
title: "Getting and Cleaning Data Project CODE BOOK"
output: html_document
date: "2025-02-02"
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# DESCRIPTION OF VARIABLES
## Identification
|Variable |Description|
|:---:    |-----------|
|subject     |Idenfication of the subject who generated the data for the signal variables based on the activity, taken from "subject_test.txt" and "subject_train.txt".|
|activity    |The type of activity performed by each subject, taken from "y_test.txt" and "y_train.txt". The data was transformed from values into descriptive characters based on "activity_labels.txt".|

## Signal Variables
The data for the summary are averages derived from the data extracted from the files "X_test.txt" and 
"X_train.txt", with each column corresponding to the features listed in "features.txt". The
information related to the naming of the variables are explained in "features_info.txt". However,
names of the variables were transformed in the process of cleaning and tidying the data, with the steps outlined in "README.rmd"

|Tokens |Description|
|:---:    |-----------|
|t prefix |Denotes the time of capture at at a constant rate of 50 Hz which is then filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.|
|f prefix |Denotes the Fast Fourier Transform (FFT) applied to signals with this prefix.|
|BodyAcc |The body acceleration signal filtered from the raw signal using another low pass Butterworth filter with a corner frequency of 0.3 Hz.|
|GravityAcc |The gravity acceleration signal filtered from the raw signal using another low pass Butterworth filter with a corner frequency of 0.3 Hz.|
|BodyGyro |The body gyroscope signal filtered from the raw signal using another low pass Butterworth filter with a corner frequency of 0.3 Hz.|
|GravityGyro |The gravity gyroscope signal filtered from the raw signal using another low pass Butterworth filter with a corner frequency of 0.3 Hz.|
|Jerk |Jerk signals calculated from the linear acceleration and angular velocity derived in time.|
|Mag |Magnitude of the signals calculated using the Ecludian norm.|
|Mean |Average of the variable.|
|Std |Standard deviation of the variable.|
|X suffix |Denotes the axial signals in direction X.|
|Y suffix |Denotes the axial signals in direction Y.|
|Z suffix |Denotes the axial signals in direction Z.|