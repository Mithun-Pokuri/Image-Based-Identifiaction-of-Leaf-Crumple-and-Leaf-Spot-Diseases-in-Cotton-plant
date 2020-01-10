y=read.csv("A:/sem8/final year project/g1.csv")
y1=read.csv("A:/sem8/final year project/m3.csv")
View(y)
round(prop.table(table(y$t))*100,digits=2)
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x))) }
y_n <- as.data.frame(lapply(y[2:38], normalize))
summary(y_n)
trainData <- y_n
testData <- y1[-1]
View(trainData)
View(testData)
y_train_labels=y$t
library(class)
y_test_pred<-knn(train=trainData,test=testData,cl=y_train_labels,k=3)
print(y_test_pred)
if(y_test_pred=='a'){
  print("The disease is Alternaria leaf spot")
}else if(y_test_pred=='m'){
  print("The disease is Myrothecium leaf spot")
}else if(y_test_pred=='c'){
  print("The disease is Cercospora leaf spot")
} else {
  print("The disease is not identified")
}

