# author:Elmeri Santala
# date:9.11.2019
# Exercise2: task and instructions

## reading data

lrn14 <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=TRUE)
dim(lrn14)
str(lrn14)

#So data has 183 rows and 60 colums and structure of data looks correct.

## creating analysis dataset
# Access the dplyr library
install.packages("dplyr")
library(dplyr)

# questions related to deep, surface and strategic learning
deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")

# select the columns related to deep learning and create column 'deep' by averaging
deep_columns <- select(lrn14, one_of(deep_questions))
lrn14$deep <- rowMeans(deep_columns)

# select the columns related to surface learning and create column 'surf' by averaging
surface_columns <- select(lrn14, one_of(surface_questions))
lrn14$surf <- rowMeans(surface_columns)

# select the columns related to strategic learning and create column 'stra' by averaging
strategic_columns <- select(lrn14, one_of(strategic_questions))
lrn14$stra <- rowMeans(strategic_columns)

# only observations >0 included
# create column 'attitude' by scaling the column "Attitude"
# rename variables
learning2014 <- lrn14 %>% filter(Points>0) %>%
  mutate(age=Age, points=Points, attitude=Attitude/10) %>%
  select(gender, age, attitude, deep, stra, surf, points)

# set working directory
setwd("~/IODS-project")

# save data
write.csv(learning2014, file = "data/learning2014.csv", row.names=FALSE)

# reading data
learning2014test <- read.csv("data/learning2014.csv")
str(learning2014test)
head(learning2014test)
