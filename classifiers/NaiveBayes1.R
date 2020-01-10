p=read.csv("A:/sem8/final year project/g2.csv")
View(p)
str(p)
summary(p)
colnames(p)
library(e1071)
#partition=sample(2,nrow(pulsarstar),replace=TRUE,prob=c(0.8,0.2))
#Training=pulsarstar[partition==1,]
#Testing=pulsarstar[partition==2,]
n <- nrow(p)
train_indices <- 1:round(0.9* n)
Training <- p[train_indices, ]
test_indices <- (round(0.9*n) + 1):n
Testing <- p[test_indices, ]
Testing_labels=Testing$t
nrow(Training)
nrow(Testing)
View(Training)
View(Testing)
library(rminer)
Classifier_1=naiveBayes(t~.,Training)
print(Classifier_1)
Bayes_Prediction_1=predict(Classifier_1,Testing)
table(Testing$t,Bayes_Prediction_1)
print(Bayes_Prediction_1)
mmetric(Testing$t,Bayes_Prediction_1,c("ACC","PRECISION","TPR"))
confusionMatrix(Bayes_Prediction_1,factor(Testing$t))
class(Classifier_1)
class(Testing)
