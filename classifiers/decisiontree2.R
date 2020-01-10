p=read.csv("A:/sem8/final year project/g1.csv")
y1=read.csv("A:/sem8/final year project/m3.csv")
library('rpart')
library('rpart.plot')
trainData=p
testData=y1[-1]
View(trainData)
View(testData)
treefit=rpart(t~.,data=(trainData),method='class')
print(treefit)
prediction1=predict(treefit,newdata=testData,type='class')
print(prediction1)
class(prediction1)
if(prediction1=='a'){
  print("The disease is Alternaria leaf spot")
}else if(prediction1=='m'){
  print("The disease is Myrothecium leaf spot")
}else if(prediction1=='c'){
  print("The disease is Cercospora leaf spot")
} else {
  print("The disease is not identified")
}