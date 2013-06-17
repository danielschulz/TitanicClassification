
# SETUP WORKSPACE

library(e1071)
library(randomForest)
library(kernlab)

set.seed(4711)

# clean
rm(list = ls()[!(ls() %in% PERSISTENT_CONSTANTS)])


# constants
PERSISTENT_CONSTANTS = c("PERSISTENT_CONSTANTS")



# INIT DATA

# load trainings data: data
dataLocation = "output\\data\\train.RData"
a = load(dataLocation)


# load test data: test
dataLocation = "output\\data\\test.RData"
b = load(dataLocation)


names = names(test)
test$survived = "0"
test = test[c("survived", names)]

rm(list=c("a", "b", "dataLocation", "names"))

# x = lapply(data$survived, FUN= function (x) {return (x == "1")})
# data$survived = FALSE
# data$survived = as.factor(data$survived)
# data$survived = c(x)


# svm classification
formula = survived ~ .
svm = ksvm(formula, data = data.frame(data), kernel="rbfdot", kpar=list(sigma=0.015), C=70, cross=4, prob.model=TRUE)


pr = predict(svm, newdata = test)


