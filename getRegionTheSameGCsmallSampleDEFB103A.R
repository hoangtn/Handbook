referenceGenome = "BSgenome.Hsapiens.UCSC.hg19"
library(referenceGenome, character.only=TRUE)

ST = 4500000
EN = 10500000

listGC <- NULL

#stGene <-  c(6829298, 6837591)
#stGene <-  c(6848458, 6856701)
stGene <-  c(6867561, 6875800)
chr = "chr8"

st = stGene[1]
en = stGene[2]
reference_fasta = NULL
tempG <- unmasked(Hsapiens[[chr]])[(st):en]

gcGene <- sum((alphabetFrequency(tempG))[2:3])/sum(alphabetFrequency(tempG))

windows = 500

seqST <- sample(ST:(EN - (en - st + 1)), 20000)
seqEN <- seqST + (en - st + 1)

listGC <- apply(data.frame(seqST, seqEN), 1, function(x){
    tempG <- unmasked(Hsapiens[[chr]])[(x[1]):x[2]]
    return(sum((alphabetFrequency(tempG))[2:3])/sum(alphabetFrequency(tempG)))

})

names(listGC) <- seqST

listGC0 <- 100*(listGC - gcGene)

listGC1 <- listGC0[abs(listGC0) < 0.1]

finalPos <- as.numeric(names(listGC1))

finalPosG <- data.frame(c(stGene[1], finalPos),
                        c(stGene[2], finalPos + (stGene[2] - stGene[1] + 1)))

write.table(finalPosG, "ThesameGCwithDEFB103A.txt", col.names = FALSE,
            row.names = FALSE, quote = FALSE)

##################Read files
dirFile = "TempAllPublish"
allFile <- dir(path = dirFile, pattern = "coordinate")


outCount <- lapply(allFile, function(YY) {

    posTemp <- scan(paste(dirFile, "/", YY, sep= ""))

    countPos <- apply(finalPosG, 1, function(x) {
        return(length(posTemp[(posTemp >= x[1]) & (posTemp <= x[2])]))
    })

    return(countPos)
   

})

outCountMatrix <- do.call(rbind, outCount)

cnOut <- apply(outCountMatrix, 1, function(x) {
    median(2*x[1]/x[-1])

})

names(cnOut) <- substr(allFile, 1, 7)

cnOut1 <- round(cnOut, 0)

names(cnOut1) <- substr(allFile, 1, 7)

write.table(cnOut1, "Publish.CountMedianDEFA1A3_3.txt", quote = FALSE,
            row.names = TRUE, col.names = FALSE)

write.table(cnOut1, "Publish.CountMedianDEFA1A3_2.txt", quote = FALSE,
            row.names = TRUE, col.names = FALSE)

write.table(cnOut1, "Publish.CountMedianDEFA1A3_1.txt", quote = FALSE,
            row.names = TRUE, col.names = FALSE)




############################################################
############################################################
############################################################

referenceGenome = "BSgenome.Hsapiens.UCSC.hg19"
library(referenceGenome, character.only=TRUE)

ST = 161100000
EN = 162100000

listGC <- NULL

stGene <-  c(6848458, 6856701 )

chr = "chr1"

st = stGene[1]
en = stGene[2]
reference_fasta = NULL
tempG <- unmasked(Hsapiens[[chr]])[(st):en]

gcGene <- sum((alphabetFrequency(tempG))[2:3])/sum(alphabetFrequency(tempG))

windows = 500

seqST <- sample(ST:(EN - (en - st + 1)), 20000)
seqEN <- seqST + (en - st + 1)*10

listGC <- apply(data.frame(seqST, seqEN), 1, function(x){
    tempG <- unmasked(Hsapiens[[chr]])[(x[1]):x[2]]
    return(sum((alphabetFrequency(tempG))[2:3])/sum(alphabetFrequency(tempG)))

})

names(listGC) <- seqST

listGC0 <- 100*(listGC - gcGene)

listGC1 <- listGC0[abs(listGC0) < 0.1]

#listGC1 <- sample(listGC0, 200)

finalPos <- as.numeric(names(listGC1))

finalPosG <- data.frame(c(stGene[1], finalPos),
                        c(stGene[2], finalPos + (stGene[2] - stGene[1] + 1)))

write.table(finalPosG, "ThesameGCwithFCGR3A.txt", col.names = FALSE,
            row.names = FALSE, quote = FALSE)

##################Read files
dirFile = "TempAllPublish"
allFile <- dir(path = dirFile, pattern = "coordinate")


outCount <- lapply(allFile, function(YY) {

    posTemp <- scan(paste(dirFile, "/", YY, sep= ""))

    countPos <- apply(finalPosG, 1, function(x) {
        return(length(posTemp[(posTemp >= x[1]) & (posTemp <= x[2])]))
    })

    return(countPos)
   

})

outCountMatrix <- do.call(rbind, outCount)

cnOut <- apply(outCountMatrix, 1, function(x) {
    median(2*x[1]/x[-1])

})

names(cnOut) <- substr(allFile, 1, 7)

cnOut1 <- round(cnOut, 0)

names(cnOut1) <- substr(allFile, 1, 7)

write.table(cnOut1, "Publish.CountMedianFCGR3A.txt", quote = FALSE,
            row.names = TRUE, col.names = FALSE)

