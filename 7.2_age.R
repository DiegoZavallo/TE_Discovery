install.packages("devtools")
library(devtools)
devtools::install_github('TickingClock1992/RIdeogram')

require(RIdeogram)

setwd("/Users/juan/Documents/manu/dev/vms/bio/TEs_papa/data")
#data(human_karyotype, package="RIdeogram")
data(gene_density, package="RIdeogram")
#data(Random_RNAs_500, package="RIdeogram")
potato_karyotype <- read.table("karyotype.csv",sep="\t", header = T, stringsAsFactors = F)
potato_karyotype$CE_start = potato_karyotype$CE_start - 1000000
potato_karyotype$CE_end = potato_karyotype$CE_end + 1000000
head(potato_karyotype)

potato_gene_density <- read.table("lrx_ages.csv", sep = "\t", header = T, stringsAsFactors = F)
nrow(potato_gene_density)
head(potato_gene_density)
potato_gene_density = potato_gene_density[complete.cases(potato_gene_density), ]
nrow(potato_gene_density)

head(potato_gene_density)

ideogram(karyotype = potato_karyotype, overlaid = potato_gene_density)
convertSVG("chromosome.svg", device = "png")

