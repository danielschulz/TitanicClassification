
# SETUP WORKSPACE

library(e1071)
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



rm(list = c("a", "b", "dataLocation"))


# svm classification
formula = data$survived ~ .
svm = svm(formula, data = data, decision.values = train, type="C-classification", probability=TRUE)
pr = predict(svm, newdata = test, probability=TRUE, decision.values=TRUE)

