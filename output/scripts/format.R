
# SETUP WORKSPACE

library(e1071)
set.seed(4711)

# clean
rm(list = ls()[!(ls() %in% PERSISTENT_CONSTANTS)])


# constants
PERSISTENT_CONSTANTS = c("PERSISTENT_CONSTANTS")



# INIT DATA

# load data
dataLocation = "input\\data\\train.csv"
rawData = read.csv2(dataLocation, header=TRUE, encoding="ANSI", sep=",", strip.white=TRUE, na.strings=c(""))


isGuessedAge = function (x) {

  return (x != floor(x))
}


# format given columns
rawData$pclass = as.numeric(as.character(rawData$pclass))
rawData$name = as.character(rawData$name)
rawData$sex = as.factor(rawData$sex)
rawData$age = as.numeric(as.character(rawData$age))
rawData$sibsp = as.numeric(as.character(rawData$sibsp))
rawData$parch = as.numeric(as.character(rawData$parch))
rawData$ticket = as.character(rawData$ticket)
rawData$fare = as.numeric(as.character(rawData$fare))
rawData$cabin = as.character(rawData$cabin)
rawData$embarked = as.factor(rawData$embarked)


# add secondary values
rawData$guessedAge = isGuessedAge(rawData$age)
rawData$guessedAge = as.factor(rawData$guessedAge)
rawData$age = floor(rawData$age)

