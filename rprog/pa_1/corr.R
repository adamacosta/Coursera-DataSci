corr <- function(dir = getwd(), thresh = 0) {
     names <- list.files(dir, '*.csv', full.names = TRUE)
     frames <- lapply(lapply(names, read.csv), na.omit)
     bigEnough <- lapply(frames, nrow)
     frames <- frames[bigEnough > thresh]
     return(sapply(frames, function(x) cor(x$sulfate, x$nitrate)))
}
