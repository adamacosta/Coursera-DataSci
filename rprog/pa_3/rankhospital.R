rankhospital <- function(state, outcome, num = "best") {
     options(warn=-1)    
     ## read outcome data
     data <- read.csv("outcome-of-care-measures.csv",stringsAsFactors=F)
     
     ## check that state and outcome are valid
     if (sum(data[,7]==state) == 0) {
          stop("invalid state")
     }
     ind <- 0
     if (outcome == "heart attack" || outcome == "Heart Attack") {
          ind <- 11
     } else if (outcome == "heart failure" || outcome == "Heart Failure") {
          ind <- 17
     } else if (outcome == "pneumonia" || outcome == "Pneumonia") {
          ind <- 23
     }
     if (ind == 0) {
          stop("invalid outcome")
     }
     
     ## return hospital name in that state with the given rank
     ## 30-day death rate
     data <- data[,c(2,7,ind)]
     data[,3] <- as.numeric(data[,3])
     data <- data[data[,2]==state,]
     data <- na.omit(data)
     data <- data[order(data[,1]),]
     data <- data[order(data[,3]),]
     if (num=="best") {
          return(data[1,1])
     }
     if (num=="worst") {
          return(data[length(data[,1]),1])
     }
     return(data[num,1])
}