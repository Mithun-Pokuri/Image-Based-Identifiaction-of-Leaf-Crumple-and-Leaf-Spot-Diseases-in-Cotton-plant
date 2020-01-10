y=read.csv("A:/sem8/final year project/g1.csv")
View(y)
round(prop.table(table(y$t))*100,digits=1)
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x))) }
y_n <- as.data.frame(lapply(y[2:38], normalize))
summary(y_n)
n <- nrow(y_n)
train_indices <- 1:round(0.87 * n)
trainData <- y_n[train_indices, ]
test_indices <- (round(0.87 * n) + 1):n
testData <- y_n[test_indices, ]
View(trainData)
View(testData)
y_train_labels=y[train_indices,1]
y_test_labels=y[test_indices,1]
library(class)
y_test_pred<-knn(train=trainData,test=testData,cl=y_train_labels,k=3)
print(y_test_pred)
library(rminer)
mmetric(factor(y_test_labels),y_test_pred,c("ACC","PRECISION","F1","TPR"))
library(gmodels)
CrossTable(x=factor(y_test_labels),y=y_test_pred,chisq =FALSE)
table(y_test_pred,factor(y_test_labels))
library(caret)
confusionMatrix(y_test_pred,factor(y_test_labels))
levels(factor(y_test_labels))
class(y_test_pred)
