
# Clearing the Environment
  rm(list = ls(all = TRUE))

# NB classifier algrithm
  naiveBayes_classifier <- function(y,trainingData,data){
    
    # Loading the Library
    library(psych)
    
    # Process
    if (missing(y) |missing(trainingData) |missing(data)) {
      print("Please spefcify Class vector and or training data")
    }
    y = data[,y]
    trainSet = data[,trainingData]
    dummy = dummy.code(y)
    data = cbind(data,dummy)
    temp <- apply(X = trainSet,MARGIN = 2,function(x) aggregate(dummy,by = list(x),FUN="sum"))
    temp <- do.call("rbind", temp)
    temp$Features <- do.call("rbind",strsplit(x = rownames(temp),split = ""))[,1]
    return(temp)
  }
  
# Creating a Dataset

  train = data.frame(A = sample(c("yes","no"),100,replace = T),B = sample(c("Ok","NA","Bad"),100,replace = T),C =sample(c("play","sleep","eat"),100,replace = T), Y = sample(c("cool","hot"),100,replace = T))
  test = data.frame(A = sample(rep(c("yes","no"),each = 10),4),B = sample(rep(c("Ok","NA","Bad"),each = 10),4),Y = sample(rep(c("cool","hot"),each = 10),4))

  View(train)
  View(test)

# Implementation of Naive Bayes Classifier
  df <- naiveBayes_classifier(y = "Y",trainingData = colnames(train)[-4],data = train)
  View(df)










