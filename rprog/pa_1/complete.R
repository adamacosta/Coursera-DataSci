complete <- function(dir = getwd(), id = 1:332) {
     names <- paste(dir, list.files(file.path('specdata', dir),"*.csv"), sep="/")
     names <- names[id]
     frames <- lapply(lapply(names, read.csv), na.omit)
     totals <- sapply(frames, nrow)
     return(data.frame(ID = id, nobs = totals))
}
