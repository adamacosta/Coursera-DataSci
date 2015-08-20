rankall <- function(outcome, num = "best") {
     options(warn=-1)    
     ## read outcome data
     data <- read.csv("outcome-of-care-measures.csv",stringsAsFactors=F)
     
     ## check that outcome is valid
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
     data <- na.omit(data)
     data <- split(data,data$State)
     data <- lapply(data,function(x) x <- x[order(x[,1]),])
     data <- lapply(data,function(x) x <- x[order(x[,3]),])
     if (num=="best") {
          data <- sapply(data,function(x) return(x[1,1]))
          hospitals <- unname(data)
          states <- names(data)
          result <- data.frame(hospital=hospitals,state=states)
          row.names(result) <- states
          return(result)
     }
     if (num=="worst") {
          data <- sapply(data,function(x) return(x[nrow(x),1]))
          hospitals <- unname(data)
          states <- names(data)
          result <- data.frame(hospital=hospitals,state=states)
          row.names(result) <- states
          return(result)
     }
     data <- sapply(data,function(x) return(x[num,1]))
     hospitals <- unname(data)
     states <- names(data)
     result <- data.frame(hospital=hospitals,state=states)
     row.names(result) <- states
     return(result)
}