#Elmeri Santala
#Exercise4 
#Data wrangling for week 5
#24.11.2019

# accessing to the packages
library(MASS)
library(tidyr)
library(dplyr)
library(stringr)

# Reading two datasets
humandev <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)
gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")

# Exploring the datasets
str(humandev)
dim(humandev)
summary(humandev)
colnames(humandev)
str(gii)
dim(gii)
summary(gii)
colnames(gii)

# Renaming humandev data variables shorter
names(humandev)[names(humandev) == "Human.Development.Index..HDI."] <- "HDI"
names(humandev)[names(humandev) == "Life.Expectancy.at.Birth"] <- "Life.Exp"
names(humandev)[names(humandev) == "Expected.Years.of.Education"] <- "Edu.Exp"
names(humandev)[names(humandev) == "Mean.Years.of.Education"] <- "Edu.Mean"
names(humandev)[names(humandev) == "Gross.National.Income..GNI..per.Capita"] <- "GNI"
names(humandev)[names(humandev) == "GNI.per.Capita.Rank.Minus.HDI.Rank"] <- "GNI.Minus.Rank"

# Renaming gii data variables shorter
names(gii)[names(gii) == "Gender.Inequality.Index..GII."] <- "GII"
names(gii)[names(gii) == "Maternal.Mortality.Ratio"] <- "Mat.Mor"
names(gii)[names(gii) == "Adolescent.Birth.Rate"] <- "Ado.Birth"
names(gii)[names(gii) == "Percent.Representation.in.Parliament"] <- "Parli.F"
names(gii)[names(gii) == "Population.with.Secondary.Education..Female."] <- "Edu2.F"
names(gii)[names(gii) == "Population.with.Secondary.Education..Male."] <- "Edu2.M"
names(gii)[names(gii) == "Labour.Force.Participation.Rate..Female."] <- "Labo.F"
names(gii)[names(gii) == "Labour.Force.Participation.Rate..Male."] <- "Labo.M"

# Create 2 new variables in gii data
gii <- mutate(gii, Edu2.FM = Edu2.F / Edu2.M)
gii<- mutate(gii, Labo.FM = Labo.F / Labo.M)

# Join the two datasets
join_by <- c("Country")
human <- inner_join(humandev, gii, by = join_by, suffix = c(".humandev", ".gii"))

# Checking the data
dim(human)
colnames(human)

# Joined data has now 195 observations with 19 variables.

# Save the data
write.csv(human, "~/IODS-project/Data/human.csv")

