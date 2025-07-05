library(ggplot2)


setwd("green_toad_plots/snpeff/")

df <- read.csv("green_toad_mutation_load_table_filtered_per_population.txt")


ggplot(aes(x=pop, y=high_realized, fill = pop),dat=df) + geom_boxplot(show.legend = FALSE) + theme(axis.text.x = element_text(angle = 45, hjust = 1))


df <- read.csv("green_toad_mutation_load_plots/diversity_sumstats.txt", sep = "\t")


ggplot(aes(x=pop, y=theta_pi, fill = pop), dat=df) + geom_bar(stat="identity", show.legend = FALSE) + theme(axis.text.x = element_text(angle = 45, hjust = 1))
