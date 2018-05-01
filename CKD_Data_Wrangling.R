library("dplyr")
library("tidyr")
library("ggplot2")

#load the original data
patient_original <- read.csv("chronic_kidney_disease.csv")

# Create a variable to save the cleaned data
patientData <- patient_original

# View the dataset in a format that is easier to read than head(patientData)

View(patientData)

# First column is named X.  Rename to Patient to make it easier to understand
patientData <- rename(patientData, Patient = X)

# Check for mispellings
str(patientData)
# Factors and levels were as expected, with no mispellings


# look at minimum, maximum, and number of missing values via summary()
# could also do min(my_vector, na.rm = TRUE)
#               max(my_vector, na.rm = TRUE)
#               sum(is.na(my_vector))

summary(patientData)

# look at age range and number of missing values

table(patientData$age, useNA = "always")
paste("Min age:", min(patientData$age, na.rm = TRUE), "years", sep =  " ")
paste("Max age:", max(patientData$age, na.rm =  TRUE), "years", sep =  " ")
paste("Number of age missing values:", sum(is.na(patientData$age)))


# look at bp range and number of missing values
table(patientData$bp, useNA = "always")
paste("Min blood pressure:", min(patientData$bp, na.rm = TRUE), "mm/Hg", sep =  " ")
paste("Max blood pressure:", max(patientData$bp, na.rm =  TRUE), "mm/Hg", sep =  " ")
paste("Number of blood pressure missing values:", sum(is.na(patientData$bp)))

# look at unique values for sg.  Should be (1.005, 1.010, 1.015, 1.020, 1.025)
# number of missing values for sg
table(patientData$sg, useNA = "always")
paste("Number of specific gravity missing values:", sum(is.na(patientData$sg)))

# look at unique values for al.  Should be (0, 1, 2, 3, 4, 5)
table(patientData$al, useNA = "always")
paste("Number of albumin missing values:", sum(is.na(patientData$al)))

# look at unique values for su.  Should be (0, 1, 2, 3, 4, 5)
table(patientData$su, useNA = "always")
paste("Number of sugar missing values:", sum(is.na(patientData$su)))

# number of missing values for rbc
table(patientData$rbc, useNA = "always")
paste("Number of red blood cell missing values:", sum(is.na(patientData$rbc)))

# number of missing values for pc
table(patientData$pc, useNA = "always")
paste("Number of pus cell missing values:", sum(is.na(patientData$pc)))

# number of missing values for pcc
table(patientData$pcc, useNA = "always")
paste("Number of pus cell clumps missing values:", sum(is.na(patientData$pcc)))

# number of missing values for ba
table(patientData$ba, useNA = "always")
paste("Number of bacteria missing values:", sum(is.na(patientData$ba)))

# look at range and number of missing values for bgr 
table(patientData$bgr, useNA = "always")
paste("Min blood glucose random:", min(patientData$bgr, na.rm = TRUE), "mgs/dL", sep =  " ")
paste("Max blood glucose random:", max(patientData$bgr, na.rm =  TRUE), "mgs/dL", sep =  " ")
paste("Number of blood glucose random missing values:", sum(is.na(patientData$bgr)))

# look at range and number of missing values for bu
table(patientData$bu, useNA = "always")
paste("Min blood urea:", min(patientData$bu, na.rm = TRUE), "mg/dL", sep =  " ")
paste("Max blood urea:", max(patientData$bu, na.rm =  TRUE), "mg/dL", sep =  " ")
paste("Number of blood urea missing values:", sum(is.na(patientData$bu)))

# look at range and number of missing values for sc
table(patientData$sc, useNA = "always")
paste("Min serum creatinine:", min(patientData$sc, na.rm = TRUE), "mg/dL", sep =  " ")
paste("Max serum creatinine:", max(patientData$sc, na.rm =  TRUE), "mg/dL", sep =  " ")
paste("Number of serum creatinine missing values:", sum(is.na(patientData$sc)))

# look at range and number of missing values for sod
table(patientData$sod, useNA = "always")
paste("Min sodium:", min(patientData$sod, na.rm = TRUE), "mEq/L", sep =  " ")
paste("Max sodium:", max(patientData$sod, na.rm =  TRUE), "mEq/L", sep =  " ")
paste("Number of sodium missing values:", sum(is.na(patientData$sod)))

# look at range and number of missing values for pot
table(patientData$pot, useNA = "always")
paste("Min potassium:", min(patientData$pot, na.rm = TRUE), "mEq/L", sep =  " ")
paste("Max potassium:", max(patientData$pot, na.rm =  TRUE), "mEq/L", sep =  " ")
paste("Number of potassium missing values:", sum(is.na(patientData$pot)))

# look at range and number of missing values for hemo
table(patientData$hemo, useNA = "always")
paste("Min hemoglobin:", min(patientData$hemo, na.rm = TRUE), "g/dL", sep =  " ")
paste("Max hemoglogin:", max(patientData$hemo, na.rm =  TRUE), "g/dL", sep =  " ")
paste("Number of hemoglobin missing values:", sum(is.na(patientData$hemo)))

# look at range and missing values for pcv
table(patientData$pcv, useNA = "always")
paste("Min packed cell volume:", min(patientData$pcv, na.rm = TRUE), "%", sep =  " ")
paste("Max packed cell volume:", max(patientData$pcv, na.rm =  TRUE),"%", sep =  " ")
paste("Number of packed cell volume missing values:", sum(is.na(patientData$pcv)))


# look at range and number of missing values for wbcc
table(patientData$wbcc, useNA = "always")
paste("Min white blood cell count:", min(patientData$wbcc, na.rm = TRUE), "cells/cmm", sep =  " ")
paste("Max white blood cell count:", max(patientData$wbcc, na.rm =  TRUE), "cells/cmm", sep =  " ")
paste("Number of white blood cell count missing values:", sum(is.na(patientData$wbcc)))


# look at range and number of missing values for rbcc
table(patientData$rbcc, useNA = "always")
paste("Min red blood cell count:", min(patientData$rbcc, na.rm = TRUE), "million cells/cmm", sep =  " ")
paste("Max red blood cell count:", max(patientData$rbcc, na.rm =  TRUE), "million cells/cmm", sep =  " ")
paste("Number of red blood cell count missing values:", sum(is.na(patientData$rbcc)))

# missing values for htn
table(patientData$htn, useNA = "always")
paste("Number of hypertension missing values:", sum(is.na(patientData$htn)))

# missing values for dm
table(patientData$dm, useNA = "always")
paste("Number of diabetes mellitus missing values:", sum(is.na(patientData$dm)))

# missing values for cad
table(patientData$cad, useNA = "always")
paste("Number of coronary artery disease missing values:", sum(is.na(patientData$cad)))

# missing values for appet
table(patientData$appet, useNA = "always")
paste("Number of appetite missing values:", sum(is.na(patientData$appet)))

# missing values for pe
table(patientData$pe, useNA = "always")
paste("Number of pedal edema missing values:", sum(is.na(patientData$pe)))

# missing values for ane
table(patientData$ane, useNA = "always")
paste("Number of anemia missing values:", sum(is.na(patientData$ane)))

# missing values for class
table(patientData$class, useNA = "always")
paste("Number of class missing values:", sum(is.na(patientData$class)))



