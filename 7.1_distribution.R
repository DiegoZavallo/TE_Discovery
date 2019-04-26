install.packages("dplyr")
if(!require(devtools)) install.packages("devtools")
devtools::install_github("kassambara/ggpubr")
install.packages("ggpubr")
install.packages("car")

library("dplyr")
library("ggpubr")


data("ToothGrowth")
head(ToothGrowth)
my_data = ToothGrowth
ggdensity(my_data$len, 
          main = "Density plot of tooth length",
          xlab = "Tooth length")

ggqqplot(my_data$len)
library("car")
qqPlot(my_data$len)
shapiro.test(my_data$len)
