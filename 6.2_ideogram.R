install.packages("devtools")
library(devtools)
devtools::install_github('TickingClock1992/RIdeogram')

require(RIdeogram)

data(human_karyotype, package="RIdeogram")
data(gene_density, package="RIdeogram")
data(Random_RNAs_500, package="RIdeogram")

head(human_karyotype)
head(gene_density)
head(Random_RNAs_500)

human_karyotype <- read.table("karyotype.txt", sep = "\t", header = T, stringsAsFactors = F)
gene_density <- read.table("data_1.txt", sep = "\t", header = T, stringsAsFactors = F)
Random_RNAs_500 <- read.table("data_2.txt", sep = "\t", header = T, stringsAsFactors = F)

ideogram(karyotype = human_karyotype)
convertSVG("chromosome.svg", device = "png")


ideogram(karyotype = human_karyotype, overlaid = gene_density, label = Random_RNAs_500)
convertSVG("chromosome.svg", device = "png")
