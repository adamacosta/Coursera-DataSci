pollutantmean <- function(dir = getwd(), pol = 'sulfate', id = 1:332) {
     names <- list.files(path = file.path('specdata', dir), pattern = '.csv')
     names <- paste(dir, names, sep="/")
     unmerged <- list()
     unmerged <- lapply(names, read.csv)
     merged <- data.frame()
     for (i in id) {
          merged <- rbind(merged, unmerged[[i]])
     }
     if (pol=="sulfate") {
          result <- mean(merged$sulfate, na.rm=TRUE)
     }
     if (pol=="nitrate") {
          result <- mean(merged$nitrate, na.rm = TRUE)
     }
     result
}
