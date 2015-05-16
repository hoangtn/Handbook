#pdf("ReadCountRatios.pdf")
#jpeg("ReadCountRatios.jpg")
dirCoordinate <- "/home/tanhoangnguyen/HOANG/CCL3L1/DaTaMarch2013/Coordinates1917"
dirFile <- dir(dirCoordinate, pattern = "coordi")

st <- 34623842
en <- 34625731
lGene <- en - st

allCoordinate <- list()

for (ii in 1:length(dirFile)){
  allCoordinate[[ii]] <- scan(paste(dirCoordinate, "/", dirFile[ii], sep = ""))
}

NN = 100
observedRatioMatrix <- matrix(0, nrow = length(dirFile), ncol = NN + 1)

for (jj in 1:NN){
  for (ii in 1:length(dirFile)){
    
    bTemp <- allCoordinate[[ii]]
     st0 <- runif(1, 33670000, 34670000)
     en0 <- st0 + lGene

     b0bserved <- length(bTemp[(bTemp>st0) & (bTemp<=en0)])
     bExpected <- lGene*length(bTemp)/1000000

     observedRatioMatrix[ii, jj] <- b0bserved/bExpected

               }
}

observedRatioMatrix[, NN + 1] <- ccl3l1Observed

one1000R <- apply(observedRatioMatrix[, -(NN +1)], 2, median)
#pdf("ORs.pdf")
#jpeg("ORs.jpg")

par(mfrow = c(2, 1))
hist(one1000R, 100, main = '', xlab = 'Medians of ORs of 1000 random segments' )
hist(ccl3l1Observed, 100, main = '', xlab = 'ORs at CCL3L1')

text(median(observedRatioMatrix[, NN + 1]), 0, 'CCL3L1')

ccl3l1Observed <- c()

 for (ii in 1:length(dirFile)){

     
    bTemp <- allCoordinate[[ii]]
    b0bserved <- length(bTemp[(bTemp>st) & (bTemp<=en)])
    bExpected <- lGene*length(bTemp)/1000000
    ccl3l1Observed[ii] <- b0bserved/bExpected

               }

hist(ccl3l1Observed, 100, main = 'CCL3L1')
median(ccl3l1Observed)
########################################################################################################
#############################All populations################################################################
dirCoordinate <- "/home/tanhoangnguyen/HOANG/CCL3L1/DaTaMarch2013/Coordinates1917All"
dirFile <- dir(dirCoordinate, pattern = "coordi")

st <- 34623842
en <- 34625731
lGene <- en - st

allCoordinate <- list()

for (ii in 1:length(dirFile)){
  allCoordinate[[ii]] <- scan(paste(dirCoordinate, "/", dirFile[ii], sep = ""))
}

NN = 100
observedALLPOPRatioMatrix <- matrix(0, nrow = length(dirFile), ncol = NN + 1)

for (jj in 1:NN){
  for (ii in 1:length(dirFile)){
    
    bTemp <- allCoordinate[[ii]]
     st0 <- runif(1, 33670000, 34670000)
     en0 <- st0 + lGene

     b0bservedALLPOP <- length(bTemp[(bTemp>st0) & (bTemp<=en0)])
     bExpected <- lGene*length(bTemp)/1000000

     observedALLPOPRatioMatrix[ii, jj] <- b0bservedALLPOP/bExpected

               }
}

observedALLPOPRatioMatrix[, NN + 1] <- ccl3l1ObservedALLPOP

one1000RALLPOP <- apply(observedALLPOPRatioMatrix[, -(NN +1)], 2, median)
#pdf("ORs.pdf")
#jpeg("ORs.jpg")

par(mfrow = c(2, 1))
hist(one1000R, 100, main = '', xlab = 'Medians of ORs of 1000 random segments' )
hist(ccl3l1ObservedALLPOP, 100, main = '', xlab = 'ORs at CCL3L1')

text(median(observedALLPOPRatioMatrix[, NN + 1]), 0, 'CCL3L1')

ccl3l1ObservedALLPOP <- c()

 for (ii in 1:length(dirFile)){

     
    bTemp <- allCoordinate[[ii]]
    b0bservedALLPOP <- length(bTemp[(bTemp>st) & (bTemp<=en)])
    bExpected <- lGene*length(bTemp)/1000000
    ccl3l1ObservedALLPOP[ii] <- b0bservedALLPOP/bExpected

               }

hist(ccl3l1ObservedALLPOP, 100, main = 'CCL3L1')
median(ccl3l1ObservedALLPOP)

########################################################
#pdf("ObservedRCRatios.pdf")
load("calculateORCRatios.RData")
par(mfrow = c(2, 2))

hist(ccl3l1Observed, 100, main = 'European ancestry population',
     xlab = 'ORCRs')

hist(one1000R, 100, main = '', xlab = 'Medians of ORCRs of 100 random segments' )
hist(ccl3l1ObservedALLPOP, 100, main = 'All populations', 
     xlab = 'ORCRs')

hist(one1000RALLPOP, 100, main = '', xlab = 'Medians of ORCRs of 100 random segments' )


