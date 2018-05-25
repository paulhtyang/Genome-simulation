
#Visualization
library(ggplot2)

# read output data into "dataframe"
setwd("C:/Northwell/Research/Projects/GoldSTD")
dat <- read.table(file="ggplot_cov.input", sep="\t", header=TRUE)

## Scatter plot showing relationship between AD & DP
# Build up the base for ggplot2
p1 <- ggplot(dat, aes(x=DP,y=AD))
# additional components
p1 + geom_point(aes(color=CHROM)) + theme_gray(base_size = 14)
p1 + geom_point(aes(color=VAF)) + theme_gray(base_size = 14)
p1 + geom_point(aes(color=FILTER)) + theme_gray(base_size = 14)

# sum with barplot by different categories
## set the levels in order we want
dat1 <- within(dat, CHROM <- factor(CHROM,
                                   levels=names(sort(table(CHROM),
                                                     decreasing=TRUE))))
p2 <- ggplot(dat1, aes(CHROM, fill=FILTER))
p2 + geom_bar() + theme_gray(base_size = 14) + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

# scatter plot
p3 <- ggplot(dat1, aes(y=VAF, x=CHROM)) 
p3 + geom_jitter(width = 0.2, aes(colour = FILTER)) + 
  theme_gray(base_size = 14) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

## Distribution of VAF
ggplot(dat, aes(x = VAF)) + geom_freqpoly() + geom_histogram()
ggplot(dat, aes(VAF, fill = FILTER)) + geom_histogram(binwidth = 0.01) + 
  theme_gray(base_size = 14)
