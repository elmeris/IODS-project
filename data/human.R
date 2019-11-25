#Elmeri Santala
#Exercise4 
#Data wrangling for week 5
#24.11.2019
#data source 

# reading the human data
human <- read.table("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human1.txt", sep  =",", header = T)

# the (column) names of human
names(human)

# the structure of human
str(human)

# summaries of the variables
summary(human)

# accessing the stringr package
library(stringr)

# the structure of the GNI column in 'human'
str(human$GNI)

# removing the commas from GNI and print out a numeric version of it
str_replace(human$GNI, pattern=",", replace ="") %>% as.numeric

# columns i want to keep
keep <- c("Country", "Edu2.FM", "Labo.FM", "Life.Exp", "Edu.Exp", "GNI", "Mat.Mor", "Ado.Birth", "Parli.F")

# the 'keep' columns
human <- select(human, one_of(keep))

# printing out a completeness indicator of the 'human' data
complete.cases(human)

# printing out the data along with a completeness indicator as the last column
data.frame(human[-1], comp = complete.cases(human))

# filtering out all rows with NA values
human_ <- filter(human, complete.cases(human))

# the last 10 observations
tail(human, 10)

# last indice I want to keep
last <- nrow(human) - 7

# choosing everything until the last 7 observations
human_ <- human[1:last, ]

# adding countries as rownames
rownames(human) <- human$Country

# ensure the structure
str(human)

# save data
write.csv(human, file = "data/human.csv", row.names=FALSE)
