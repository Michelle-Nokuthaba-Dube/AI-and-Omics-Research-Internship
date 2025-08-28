#-------------------------------------------------------------------------------
### MODULE 1 BASIC SYNTAX CLASS 1C R ###
#-------------------------------------------------------------------------------

#Checking working directory
getwd()
"C:\Users\User\Documents"

#Setting working directory
setwd("C:\\Users\\User\\Desktop\\AI_Omics_Internship_2025")

#Organizing Project
# File menu > New Project > New Directory > New Project > class_1c.R

#-------------------------------------------------------------------------------
### EXERCISE 1: if & else: Logical Conditions ###

# 1.Checking Cholesterol level (using if)
cholesterol <- 230
if (cholesterol > 240){
  print("High Cholesterol")
  }

# 2. Blood Pressure Status (using if...else)
Systolic_bp <- 130
if (Systolic_bp < 120){
  print("Blood Pressure is normal")
}else {
  print("Blood Pressure is high")
}
[1] "Blood Pressure is high"

#-------------------------------------------------------------------------------
### EXERCISE 3: Automating Data Type Conversion with for loop ###

##-------WORKING WITH patient_info.csv------------------------------------------
# Loading datasets patient_info.csv data into the R environment
patient_data <- read.csv(file.choose())

View(patient_data)

# Check structure of patient_data
str(patient_data)
'data.frame':	20 obs. of  6 variables:
$ patient_id: chr  "P001" "P002" "P003" "P004" ...
$ age       : int  34 28 45 39 50 30 41 36 55 29 ...
$ gender    : chr  "Male" "Female" "Female" "Male" ...
$ diagnosis : chr  "Cancer" "Normal" "Cancer" "Normal" ...
$ bmi       : num  22.5 20.3 26.7 23.8 27.1 21.9 25.4 24.2 28.6 19.8 ...
$ smoker    : chr  "Yes" "No" "Yes" "No" ...

# Creating a copy to avoid modifying the original data
copy_patient_data <- patient_data

str(copy_patient_data)
'data.frame':	20 obs. of  6 variables:
$ patient_id: chr  "P001" "P002" "P003" "P004" ...
$ age       : int  34 28 45 39 50 30 41 36 55 29 ...
$ gender    : chr  "Male" "Female" "Female" "Male" ...
$ diagnosis : chr  "Cancer" "Normal" "Cancer" "Normal" ...
$ bmi       : num  22.5 20.3 26.7 23.8 27.1 21.9 25.4 24.2 28.6 19.8 ...
$ smoker    : chr  "Yes" "No" "Yes" "No" ...

#Identifying categorical columns (excluding patient_id)
factor_cols <- c("gender", "diagnosis", "smoker")


# Converting all character columns to factors
for (col in factor_cols) {
copy_patient_data[[col]] <- as.factor(copy_patient_data[[col]])
}

#Checking data structure
str(copy_patient_data)
'data.frame':	20 obs. of  6 variables:
$ patient_id: chr  "P001" "P002" "P003" "P004" ...
$ age       : int  34 28 45 39 50 30 41 36 55 29 ...
$ gender    : Factor w/ 2 levels "Female","Male": 2 1 1 2 1 2 1 1 2 1 ...
$ diagnosis : Factor w/ 2 levels "Cancer","Normal": 1 2 1 2 1 2 1 2 1 2 ...
$ bmi       : num  22.5 20.3 26.7 23.8 27.1 21.9 25.4 24.2 28.6 19.8 ...
$ smoker    : Factor w/ 2 levels "No","Yes": 2 1 2 1 2 1 2 1 2 1 ...

View(copy_patient_data)

#Comparing the original and modified metadata sets 
str(copy_patient_data)
'data.frame':	20 obs. of  6 variables:
$ patient_id: chr  "P001" "P002" "P003" "P004" ...
$ age       : int  34 28 45 39 50 30 41 36 55 29 ...
$ gender    : Factor w/ 2 levels "Female","Male": 2 1 1 2 1 2 1 1 2 1 ...
$ diagnosis : Factor w/ 2 levels "Cancer","Normal": 1 2 1 2 1 2 1 2 1 2 ...
$ bmi       : num  22.5 20.3 26.7 23.8 27.1 21.9 25.4 24.2 28.6 19.8 ...
$ smoker    : Factor w/ 2 levels "No","Yes": 2 1 2 1 2 1 2 1 2 1 ...

str(patient_data)
'data.frame':	20 obs. of  6 variables:
$ patient_id: chr  "P001" "P002" "P003" "P004" ...
$ age       : int  34 28 45 39 50 30 41 36 55 29 ...
$ gender    : chr  "Male" "Female" "Female" "Male" ...
$ diagnosis : chr  "Cancer" "Normal" "Cancer" "Normal" ...
$ bmi       : num  22.5 20.3 26.7 23.8 27.1 21.9 25.4 24.2 28.6 19.8 ...
$ smoker    : chr  "Yes" "No" "Yes" "No" ...

## --------Working with metadata.csv--------------------------------------------------------------------------------------------------------

# Loading metadata.csv dataset into the R environment
metadata <- read.csv(file.choose())

View(metadata)

# Check structure of metadata
str(metadata)
'data.frame':	10 obs. of  5 variables:
$ name  : chr  "Ali" "Sana" "Ahmed" "Fatima" ...
$ height: chr  "Tall" "Short" "Tall" "Medium" ...
$ gender: chr  "Male" "Female" "Male" "Female" ...
$ age   : int  25 22 28 24 30 21 27 23 26 20
$ weight: num  68.5 54.7 76.7 59.5 20.7 62.4 74.5 56.4 56.4 78.5

# Creating a copy to avoid modifying the original data
copy_metadata <- metadata

str(copy_metadata)
'data.frame':	10 obs. of  5 variables:
$ name  : chr  "Ali" "Sana" "Ahmed" "Fatima" ...
$ height: chr  "Tall" "Short" "Tall" "Medium" ...
$ gender: chr  "Male" "Female" "Male" "Female" ...
$ age   : int  25 22 28 24 30 21 27 23 26 20
$ weight: num  68.5 54.7 76.7 59.5 20.7 62.4 74.5 56.4 56.4 78.5

#Identifying categorical columns (excluding name)
factor_cols <- c("gender", "height")


# Converting all character columns to factors
for (col in factor_cols) {
  copy_metadata[[col]] <- as.factor(copy_metadata[[col]])
}

#Checking data structure
str(copy_metadata)
'data.frame':	10 obs. of  5 variables:
$ name  : chr  "Ali" "Sana" "Ahmed" "Fatima" ...
$ height: Factor w/ 3 levels "Medium","Short",..: 3 2 3 1 3 1 1 2 1 2
$ gender: Factor w/ 2 levels "Female","Male": 2 1 2 1 2 1 2 1 2 1
$ age   : int  25 22 28 24 30 21 27 23 26 20
$ weight: num  68.5 54.7 76.7 59.5 20.7 62.4 74.5 56.4 56.4 78.5

View(copy_metadata)

#Comparing the original and modified metadata sets 
str(copy_metadata)
'data.frame':	10 obs. of  5 variables:
$ name  : chr  "Ali" "Sana" "Ahmed" "Fatima" ...
$ height: Factor w/ 3 levels "Medium","Short",..: 3 2 3 1 3 1 1 2 1 2
$ gender: Factor w/ 2 levels "Female","Male": 2 1 2 1 2 1 2 1 2 1
$ age   : int  25 22 28 24 30 21 27 23 26 20
$ weight: num  68.5 54.7 76.7 59.5 20.7 62.4 74.5 56.4 56.4 78.5

str(metadata)
'data.frame':	10 obs. of  5 variables:
$ name  : chr  "Ali" "Sana" "Ahmed" "Fatima" ...
$ height: chr  "Tall" "Short" "Tall" "Medium" ...
$ gender: chr  "Male" "Female" "Male" "Female" ...
$ age   : int  25 22 28 24 30 21 27 23 26 20
$ weight: num  68.5 54.7 76.7 59.5 20.7 62.4 74.5 56.4 56.4 78.5

#-------------------------------------------------------------------------------
### EXERCISE 4: Converting Factors to Numeric codes ###

# For patient_info.csv
# Choose binary factor columns

(Yes/No)
binary_cols <- c("smoker")
for (col in binary_cols) {
  copy_patient_data[[col]] <- ifelse (copy_patient_data[[col]] == "Yes", 1,0)
}
(Female/Male)
binary_cols <- c("gender")
for (col in binary_cols) {
  copy_patient_data[[col]] <- ifelse(copy_patient_data[[col]] == "Female", 1, 0)
}

(Cancer/Normal)
binary_cols <- c("diagnosis")
for (col in binary_cols) {
  copy_patient_data[[col]] <- ifelse(copy_patient_data[[col]] == "Cancer", 1, 0)
}

#Checking structure
str(patient_data)
'data.frame':	20 obs. of  6 variables:
$ patient_id: chr  "P001" "P002" "P003" "P004" ...
$ age       : int  34 28 45 39 50 30 41 36 55 29 ...
$ gender    : chr  "Male" "Female" "Female" "Male" ...
$ diagnosis : chr  "Cancer" "Normal" "Cancer" "Normal" ...
$ bmi       : num  22.5 20.3 26.7 23.8 27.1 21.9 25.4 24.2 28.6 19.8 ...
$ smoker    : chr  "Yes" "No" "Yes" "No" ...

str(copy_patient_data)
'data.frame':	20 obs. of  6 variables:
$ patient_id: chr  "P001" "P002" "P003" "P004" ...
$ age       : int  34 28 45 39 50 30 41 36 55 29 ...
$ gender    : num  0 1 1 0 1 0 1 1 0 1 ...
$ diagnosis : num  1 0 1 0 1 0 1 0 1 0 ...
$ bmi       : num  22.5 20.3 26.7 23.8 27.1 21.9 25.4 24.2 28.6 19.8 ...
$ smoker    : num  1 0 1 0 1 0 1 0 1 0 ...

# For metadata.csv
# Choose binary factor columns

(Female/Male)
binary_cols <- c("gender")
for (col in binary_cols) {
  copy_metadata[[col]] <- ifelse (copy_metadata[[col]] == "Female", 1, 0)
}

#Checking structure
str(metadata)
'data.frame':	10 obs. of  5 variables:
$ name  : chr  "Ali" "Sana" "Ahmed" "Fatima" ...
$ height: chr  "Tall" "Short" "Tall" "Medium" ...
$ gender: chr  "Male" "Female" "Male" "Female" ...
$ age   : int  25 22 28 24 30 21 27 23 26 20
$ weight: num  68.5 54.7 76.7 59.5 20.7 62.4 74.5 56.4 56.4 78.5

str(copy_metadata)
'data.frame':	10 obs. of  5 variables:
$ name  : chr  "Ali" "Sana" "Ahmed" "Fatima" ...
$ height: Factor w/ 3 levels "Medium","Short",..: 3 2 3 1 3 1 1 2 1 2
$ gender: num  0 1 0 1 0 1 0 1 0 1
$ age   : int  25 22 28 24 30 21 27 23 26 20
$ weight: num  68.5 54.7 76.7 59.5 20.7 62.4 74.5 56.4 56.4 78.5
