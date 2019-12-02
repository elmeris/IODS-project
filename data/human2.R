#Elmeri Santala
#Exercise5
#Data wrangling continues for human data
#1.12.2019

# Accessing to the packages
library(MASS)
library(tidyr)
library(dplyr)

# access the stringr package
library(stringr)

# read the human data
human <- read.table("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human1.txt", sep  =",", header = T)

# look at the (column) names of human
names(human)

# look at the structure of human
str(human)

# print out summaries of the variables
summary(human)

# print out a numeric version of GNI
human$GNI <- as.numeric(human$GNI)

# look at the structure of the GNI column in 'human'
str(human$GNI)

# columns to keep
keep <- c("Country", "Edu2.FM", "Labo.FM", "Life.Exp", "Edu.Exp", "GNI", "Mat.Mor", "Ado.Birth", "Parli.F")

# select the 'keep' columns
human <- select(human, one_of(keep))

# print out a completeness indicator of the 'human' data
complete.cases(human)

# print out the data along with a completeness indicator as the last column
data.frame(human[-1], comp = complete.cases(human))

# filter out all rows with NA values
human2 <- filter(human, complete.cases(human))

# look at the last 10 observations of human
tail(human2, 10)

# define the last indice we want to keep
last <- nrow(human2) - 7

# choose everything until the last 7 observations
human2 <- human[1:last, ]

# add countries as rownames
rownames(human2) <- human2$Country

# removing the country name column from the data.
human2 <- select(human2, -Country)

# Checking the data
str(human2)
dim(human2)

# Save the data
write.csv(human2, "~/IODS-project/Data/human2.csv")

