
# Loading the data sets
BPRS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt", sep  =" ", header = T)
RATS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/rats.txt", header = TRUE, sep = '\t')

# Taking a look at the BPRS data
colnames(BPRS)
str(BPRS)
summary(BPRS)

# Taking a look at the RATS data
colnames(RATS)
str(RATS)
summary(RATS)

# Converting the categorical variables of BPRS data set to factors.
library(dplyr)
library(tidyr)
BPRS$treatment <- factor(BPRS$treatment)
BPRS$subject <- factor(BPRS$subject)
BPRSL <-  BPRS %>% gather(key = weeks, value = bprs, -treatment, -subject)
BPRSL <-  BPRSL %>% mutate(week = as.integer(substr(weeks,5,5)))

# Lets check
glimpse(BPRSL)
str(BPRSL)
dim(BPRSL)
names(BPRSL)

# Converting the categorical variables of BPRS data set to factors.
RATS$ID <- factor(RATS$ID)
RATS$Group <- factor(RATS$Group)
RATSL <- RATS %>%
  gather(key = WD, value = Weight, -ID, -Group) %>%
  mutate(Time = as.integer(substr(WD,3,4))) 

# Lets check 
glimpse(RATSL)
str(RATSL)
dim(RATSL)
names(RATSL)

