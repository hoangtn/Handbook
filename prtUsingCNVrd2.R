library("CNVrd2")
dirBamFile = "Bam/"

windows = 500
objectCNVrd2 <- new("CNVrd2", windows = windows, chr = "chr1", st = 161100001,
                    en = 162100000, dirBamFile = dirBamFile,
                    #genes = c(161592986, 161601753),
                    genes = c(161511551, 161519818),
                    geneNames = "FCGR3B")

st <- objectCNVrd2@st
en <- objectCNVrd2@en
chr <- objectCNVrd2@chr
gene <- objectCNVrd2@genes

cnOut <- pseudoPRTusingReadDepth(st = st, en = en, chr = chr, gene = gene,
                                 Nposition = 500, nSample = 100000,
                                 dirCoordinate = "137Sample/" ,
                                 smallGCdifference = 0.05)


write.table(round(cnOut, 0), "ResultFCGRABusingPseudoPRT.txt", quote = FALSE)

write.table(round(cnOut, 0), "ResultFCGR3BusingPseudoPRT.txt", quote = FALSE)

pseudoPRTusingReadDepth <- function(st, en, chr, gene, Nposition, dirCoordinate= "TempAll", nSample = 100,
                                    referenceGenome = "BSgenome.Hsapiens.UCSC.hg19", smallGCdifference = 0.1){

    library(referenceGenome, character.only=TRUE)

    ######Calculate the GC-content of the gene
    chr <- chr
    stGene <- gene[1]
    enGene <- gene[2]

    ####Get the fasta sequence of the chromosome
    chrSequence <- unmasked(Hsapiens[[chr]])

    geneSequence <- chrSequence[(stGene):enGene]
    gcGene <- 100*sum((alphabetFrequency(geneSequence))[2:3])/sum(alphabetFrequency(geneSequence))

    ####Randomly take Nposition between st and (en - length(gene))
    sequenceTheSameGC <- c()

    message("GC-content of the gene: ", gcGene)
    
    while (length(sequenceTheSameGC) < Nposition){

        seqST <- sample(st:(en - (enGene - stGene + 1)), nSample)
        seqEN <- seqST + (enGene - stGene + 1)


        gcSegment <- Views(chrSequence, seqST, seqEN)
       
       gcContentInSegment <- apply(letterFrequency(gcSegment, letters = c("G", "C")), 1, sum)
       gcContentInSegment <- ifelse(is.na(gcContentInSegment), 0, gcContentInSegment)

        listGC <- gcContentInSegment/(enGene - stGene + 1)

        names(listGC) <- seqST
        listGC <- 100*listGC 

        listGC1 <- listGC[abs(listGC - gcGene) <= smallGCdifference]

        sequenceTheSameGC <- c(sequenceTheSameGC, listGC1)
        message(length(sequenceTheSameGC), " positions have been chosen")
       } 
        
    

########################################
    ####Obtain all positions having similar GC-content
    finalPos <- as.numeric(names(sequenceTheSameGC))

    finalPosG <- data.frame(finalPos, finalPos + (enGene - stGene + 1))

    finalPosG <- rbind(c(stGene, enGene), finalPosG)
 ########Read coordinates

    allFile <- dir(path = dirCoordinate, pattern = "coordinate")

  ######Count reads in these positions
       
outCount <- lapply(allFile, function(YY) {

    posTemp <- scan(paste(dirCoordinate, YY, sep= ""))

    countPos <- apply(finalPosG, 1, function(x) {
        return(length(posTemp[(posTemp >= x[1]) & (posTemp <= x[2])]))
    })

    return(countPos)
   

})

    outCountMatrix <- do.call(rbind, outCount)


    cnOut <- apply(outCountMatrix, 1, function(x) {
        median(2*x[1]/x[-1], na.rm = TRUE)
        })

    

    names(cnOut) <- allFile


    return(cnOut)
    
}
