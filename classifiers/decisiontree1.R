p=read.csv("A:/sem8/final year project/g1.csv")
library('rpart')
library('rpart.plot')
p[,'train']=ifelse(runif(nrow(p))<0.75,1,0)
trainData=p[p$train==1,]
testData=p[p$train==0,]
traincol=grep('train',names(trainData))
trainData=trainData[,-traincol]
testData=testData[,-traincol]
treefit=rpart(t~.,data=(trainData),method='class')
print(treefit)
rpart.plot(treefit,box.col=c("red","green"))
prediction1=predict(treefit,newdata=testData[-1],type='class')
library('caret')
confusionMatrix(prediction1,testData$t)
