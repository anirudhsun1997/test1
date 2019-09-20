# Last class
# Data Types, coercing datatypes 
# Data structures (vector, matrix, dataframe). Have not covered lists
# Reading data

# Read Data-----------------------------------------------------
# Using read.table() function
mydata<-read.table("mydata.csv")
mydata<-read.table("mydata.csv",sep=",")
mydata<-read.table("mydata.csv",sep=",",header = TRUE)
mydata1<-read.table("mydata1.csv",sep=",",header = TRUE)

# Using read.csv() function
# Point to note set stringsAsFactors = FALSE
mydata<-read.csv("mydata.csv",sep=",")
mydata<-read.csv("mydata.csv",sep=",", stringsAsFactors = FALSE)

# Write Data----------------------------------------------------------
df <- data.frame(var1 = c(10, 25, 8), 
                 var2 = c("a", "b", "c"), 
                 var3 = c(TRUE, TRUE, FALSE),
                 row.names = c("Billy", "Alice", "Jamal"))

# using write.csv()
write.csv(df,"sampledata.csv")

# using write.table()
write.table(df,"sampledata.csv")
write.table(df,"sampledata.txt", sep=",")

# Control Structures--------------------------------------------------
# if statement
if (test_expression) {
  statement
}

# Examples
x<-1
y<-1

if (x==y) {
  print("Yes")
}

#------------------------------------------------------
x<-1:10
y<-1:10

if (x==y) {
  print("Yes")
}

#------------------------------------------------------
x<-"a"
y<-"a"

if (x==y) {
  print("Yes")
}
#------------------------------------------------------
var<-c(10,20,30)

if (any(var>10)) {
  print("Yes")
}
#------------------------------------------------------
if (TRUE) {
  print("Yes")
}

# if else---------------------------------------------------------------
if (test_expression) {
  print("statement 1")
} else {
  print("statement 2")
}
# Examples
if (TRUE) {
  print("Yes")
}else {
  print("No")
}

ifelse(any(var>10),"There are values greater than 10","There are no values greater than 10")

ifelse(any(var<10),"There are values greater than 10","There are no values less than 10")

# else if----------------------------------------------------
x <- 6
if(x >= 10){
  print("x is greater than 10")
} else if(x >= 5 & x < 10){
  print("x is between 5 and 10")
} 


# for loop-------------------------------------------
for (i in 1:10){
  print(i)
}

names<-letters[1:10]

for (i in names){
  print(i)
}

# while loop-----------------------------------------------

index<-1

while(index <= 10) {
  print(index)
  index<-index+1
}

# when to use while and when to use for loop?
counter <- 1
x <- 5
set.seed(3)

while(x >= 3 & x <= 8 ) {
  coin <- rbinom(1,1, 0.5)
  
  if(coin == 1) { ## random walk
    x <- x + 1
  } else {
    x <- x - 1
  }
  cat("On iteration", counter, ", x =", x, '\n')
  counter <- counter + 1
}

# use of break statement
x <- 1:5
for (i in x) {
  if (i == 3){
    break
  }
  print(i)
}


# Custom functions. How to create your own functions.---------------


# Data frame based coding approaches-----------------------------


# Read data
# Explore data
head(sample_crime)
summary(sample_crime)

# Data Cleaning-----------------------

# Change case
sample_crime$OFFENSE_CODE_GROUP<-tolower(sample_crime$OFFENSE_CODE_GROUP)

# Check data type of columns-----------------
typeof(sample_crime$OFFENSE_CODE)

# Check for missing values
is.na(sample_crime$SHOOTING)
which(is.na(sample_crime$SHOOTING))

# Take help of data quality package
library(dataQualityR)
num.file <- paste("/Users/Sri/Documents/Teaching/IE 6600 Fall 2019/Lecture 3", "/numerical.csv", sep= "")
cat.file <- paste("/Users/Sri/Documents/Teaching/IE 6600 Fall 2019/Lecture 3", "/categorical.csv", sep= "")
checkDataQuality(data= sample_crime, out.file.num= num.file, out.file.cat= cat.file)

# Data Wrangling-------------------------------------------------------

# Select Columns
# Selecting columns with numerical values
sample_crime$REPORTING_AREA
sample_crime$REPORTING_AREA[1:10]
sample_crime$REPORTING_AREA[sample_crime$REPORTING_AREA>300]


# Selecting columns with string values
sample_crime$OFFENSE_CODE_GROUP
sample_crime$OFFENSE_CODE_GROUP[1:10]
sample_crime$OFFENSE_CODE_GROUP[sample_crime$OFFENSE_CODE_GROUP!="Medical Assistance"]

# Select rows based on column condition
ind<-which(sample_crime$OFFENSE_CODE_GROUP=="Medical Assistance")
temp<-sample_crime[ind,]
temp<-subset(sample_crime, sample_crime$OFFENSE_CODE_GROUP=="Medical Assistance")
temp<-subset(sample_crime, sample_crime$OFFENSE_CODE_GROUP=="Medical Assistance" & sample_crime$OFFENSE_CODE==3006)

# Common Issue
ind<-which(sample_crime$OFFENSE_CODE_GROUP=="Assistance")

# We take help of stringr package

library(stringr)


# Find matching strings

str_which(sample_crime$OFFENSE_CODE_GROUP, "Medical Assistance")
str_detect(sample_crime$OFFENSE_CODE_GROUP, "Medical Assistance")
str_match(sample_crime$OFFENSE_CODE_GROUP, "Medical")
str_extract(sample_crime$OFFENSE_CODE_GROUP, "Medical")
str_count(sample_crime$OFFENSE_CODE_GROUP, "Medical Assistance")
str_locate(sample_crime$OFFENSE_CODE_GROUP, "Medical")

# Length of strings
str_length(sample_crime$OFFENSE_CODE_GROUP)

# Replace
str_replace("Northeastern University","Northeastern","Harvard")
str_to_lower("Northeastern University")
str_to_upper("Northeastern University")
str_to_title("northeastern university")
str_replace(sample_crime$OFFENSE_CODE_GROUP,"Medical","med")

# Join strings
str_c("Northeastern","University")
str_c("Northeastern"," ","University")
str_c(sample_crime$DISTRICT,sample_crime$REPORTING_AREA)

# Split strings
str_split("northeastern university boston"," ",3)

# Sort strings
str_sort(sample_crime$OFFENSE_DESCRIPTION)
str_sort(sample_crime$REPORTING_AREA)



# Create new variables ----------------------------------------------
crime$classification<-"a"










