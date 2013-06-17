
# SETUP WORKSPACE

library(e1071)
# library(randomForest)
# library(kernlab)


set.seed(4711)

# clean
rm(list = ls()[!(ls() %in% PERSISTENT_CONSTANTS)])


# constants
PERSISTENT_CONSTANTS = c("PERSISTENT_CONSTANTS")



# INIT DATA

# load data
dataLocation = "input\\data\\train.csv"
rawData = read.csv2(dataLocation, header=TRUE, encoding="ANSI", sep=",", strip.white=TRUE, na.strings=c(""))

rm(list=c("dataLocation"))
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

# DROP COLUMNS
dropColumns = c("ticket", "cabin")
rawData = rawData[,!(names(rawData) %in% dropColumns)]

data = rawData
rm(list=c("dropColumns", "rawData"))


# guess missing ages
# takenIndex = is.na(data$guessedAge)
# agePredictionModel = ksvm(guessedAge ~ ., data=data[FALSE == takenIndex, ],kernel="rbfdot", 
#                           kpar=list(sigma=0.015), C=70, cross=4, prob.model=TRUE)
# agePredictionModel = svm(guessedAge ~ ., data=data[FALSE == takenIndex,])
# agesPredicted = predict(agePredictionModel, newdata=data[FALSE == takenIndex,])

# table(observed = data[FALSE == takenIndex, "survived"], predicted = c(agesPredicted, NA, NA))

save(data, file="output\\data\\train.RData")
