library(ggplot2)
library(dplyr)


#### Plot median trajectories of recent effective population size estimated by 10 independent runs of gone2 for different subsets of the results


setwd("/home/prm/Desktop/green_toad_PCA/gone2")


ne <- read.csv("gone_results_viridis.csv", sep = "\t")


ne <- ne %>% rowwise() %>% mutate(min_ne = min(c(run1,run2,run3,run4,run5,run6,run7,run8,run9,run10)), 
                            max_ne = max(c(run1,run2,run3,run4,run5,run6,run7,run8,run9,run10)), 
                            Ne = median(c(run1,run2,run3,run4,run5,run6,run7,run8,run9,run10)))

ne_no_hamn <-subset(ne, ne$pop!='Norra_hamnen')
ne_no_hamn_pol <-subset(ne_no_hamn, ne_no_hamn$pop!='Poland')
ne_no_hamn_pol_50gen <-ne_no_hamn_pol[ne_no_hamn_pol$generation <= 50, ]
ne_all_50gen <-ne[ne$generation <= 50, ]

ggplot(data=ne, aes(x=generation, y=Ne, color=pop)) +
  geom_line() + theme_bw()
                        

ggplot(data=ne_no_hamn, aes(x=generation, y=Ne, color=pop)) +
  geom_line() + theme_bw()

ggplot(data=ne_no_hamn_pol, aes(x=generation, y=Ne, color=pop)) +
  geom_line() + theme_bw()

ggplot(data=ne_all_50gen, aes(x=generation, y=Ne, color=pop)) +
  geom_line() + theme_bw()

ggplot(data=ne_no_hamn_pol_50gen, aes(x=generation, y=Ne, color=pop)) +
  geom_line() + theme_bw()
