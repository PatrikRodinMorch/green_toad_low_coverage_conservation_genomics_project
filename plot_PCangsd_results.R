library(ggplot2)
library(viridis)
library(RColorBrewer)
library(readr)
library(RcppCNPy)
library(qvalue)


#### Plots PCA from PCAngsd and a manhattan plot of the PCAngsd selection scan.

setwd("green_toad_PCA/selection/")


pop<-read.table("popmap_swe_no_bornholm.txt")
C <- as.matrix(read.table("green_toad_swe.cov"))
e <- eigen(C)

## Calculate percent variance explained by each axis
pca1_pve <- round(e$values[1]/sum(e$values)*100,2)
pca2_pve <- round(e$values[2]/sum(e$values)*100,2)
pca3_pve <- round(e$values[3]/sum(e$values)*100,2)
pca4_pve <- round(e$values[4]/sum(e$values)*100,2)

pcaData <- as.data.frame(e$vectors[, 1:4]) # extract first four PCs
pcaData <- cbind(pcaData, pop$V2) # add species to df
colnames(pcaData) <- c("PC1", "PC2","PC3","PC4", "Pop") # change column names

ggplot(pcaData) +
  aes(PC1, PC2, color = Pop) + # define plot area
  geom_point(size = 2) + # adding data points
  coord_fixed()+ 
  scale_color_viridis(discrete = TRUE, option = "turbo")+
  scale_fill_viridis(discrete = TRUE) +
  xlab(paste0("PC1: ",pca1_pve, "%"))+ 
  ylab(paste0("PC2: ",pca2_pve, "%")) + theme_bw()


ggplot(pcaData) +
  aes(PC2, PC3, color = Pop) + # define plot area
  geom_point(size = 2) + # adding data points
  coord_fixed()+ 
  scale_color_viridis(discrete = TRUE, option = "turbo")+
  scale_fill_viridis(discrete = TRUE) +
  xlab(paste0("PC2: ",pca2_pve, "%"))+ 
  ylab(paste0("PC3: ",pca3_pve, "%")) + theme_bw()


## Load the PCangsd selection scan numpy array and SNP positions
D <- npyLoad("green_toad_swe.selection.npy")
ps <- read.csv("green_toad_swe_no_bornholm_no_hybrid_positions.txt", sep = "\t", header = F)

### Calculate p-values for sign.
pvals.pc1 <- pchisq(D[,1], 1, lower.tail=F)
qvals.pc1 <- qvalue(p = pvals.pc1)
length(qvals.pc1$qvalues[qvals.pc1$qvalues < 0.1])

pvals.pc2 <- pchisq(D[,2], 1, lower.tail=F)
qvals.pc2 <- qvalue(p = pvals.pc2)
length(qvals.pc2$qvalues[qvals.pc2$qvalues < 0.05])

### Correct for multiple testing using the q-value method
pc2_df <- cbind(ps, qvals.pc2$qvalues)
pc2_df["SNP"] <- seq(from=1,to=length(pc2_df$V1))
pc2_df["CHR"] <- as.integer(gsub("scaffold_", "", pc2_df$V1))
pc2_df <- pc2_df[pc2_df["CHR"] <= 11,]
pc2_df_outliers <- pc2_df[pc2_df$`qvals.pc2$qvalues` <= 0.1,]



### Extract significant SNPs for gff intersect and gene ontology enrichment
write_tsv(pc2_df_outliers, "outliers_pc2.txt")


### Extract necessary columns to create a manhattan plot with CMplot
cm_df <- data.frame(pc2_df$SNP, pc2_df$CHR, pc2_df$V2, pc2_df$`qvals.pc2$qvalues`)
colnames(cm_df) <- c("SNP", "CHR", "POS", "q-value")

CMplot(cm_df, plot.type="m", band=0.5, LOG10=TRUE, ylab="-log10(q-value)",threshold=c(0.05, 0.1),
       threshold.lty=2, threshold.lwd=2, threshold.col=c("red", "blue"), amplify=TRUE, width=14,height=6,
       signal.col=NULL, chr.den.col=NULL, file="jpg",file.name="test",dpi=300,file.output=TRUE,
       verbose=TRUE,cex=0.8)
