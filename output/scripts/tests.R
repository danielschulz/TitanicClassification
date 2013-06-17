rm(list=ls())
library(randomForest)

data(iris)
set.seed(111)

taken <- sample(2, nrow(iris), replace = TRUE, prob=c(0.8, 0.2))
iris.rf <- randomForest(Species ~ ., data=iris[taken == 1,])
iris.pred <- predict(iris.rf, iris[taken == 2,])

table(observed = iris[taken==2, "Species"], predicted = iris.pred)


##########

rm(list=ls())
data(promotergene)

## create test and training set
ind <- sample(1:dim(promotergene)[1],20)
genetrain <- promotergene[-ind, ]
genetest <- promotergene[ind, ]

## train a support vector machine
gene <-  ksvm(Class~.,data=genetrain,kernel="rbfdot", 
              kpar=list(sigma=0.015),C=70,cross=4,prob.model=TRUE)

## predict gene type probabilities on the test set
genetype <- predict(gene,genetest,type="probabilities")
