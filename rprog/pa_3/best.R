best <- function(state, outcome) {
     options(warn=-1)  
     ## read outcome data
     ## data[,7] gives the state
     ## data[,2] gives the hospital name
     ## data[,11] gives 30-day death rate from heart attack
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
     
     ## return hospital name in that state with lowest 30-day death
     ## rate
     data <- data[,c(2,7,ind)]
     data[,3] <- as.numeric(data[,3])
     data <- na.omit(data)
     data <- data[data[,2]==state,]
     return(as.character(data[which.min(data[,3]),1]))
}