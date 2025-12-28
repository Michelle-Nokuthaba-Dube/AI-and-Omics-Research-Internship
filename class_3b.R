#---------------------------------------------------------------------------------------------------
# AI AND OMICS RESEARCH INTERNSHIP #
### Class 3B Preprocessing and Normalization of Microarray Data in R  ###
#---------------------------------------------------------------------------------------------------

# ASSIGNMENT 4

# Organizing Project Class 3B
#File menu > New Project > New Directory > New Project > Class 3B
  
# Checking working directory
getwd()
[1] "C:/Users/User/Desktop/AI_Omics_Internship_2025/Class 3B"

# Setup directories
dir.create("Raw_Data")
dir.create("Scripts")
dir.create("Plots")
dir.create("Results")


# Load packages
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install(c("GEOquery","limma"))
install.packages(c("dplyr","matrixStats"))

library(GEOquery)
library(limma)
library(dplyr)
library(matrixStats)

# Create folders
dir.create("Plots", showWarnings = FALSE)
dir.create("Results", showWarnings = FALSE)

# Download GEO dataset (ExpressionSet)
gse_data <- getGEO("GSE3292", GSEMatrix = TRUE)
eset <- gse_data[[1]]

# Extract expression and phenotype data
expression_data <- exprs(eset)
phenotype_data <- pData(eset)

# QC: Boxplot
png("Plots/raw_boxplot.png", width = 1200, height = 800)
boxplot(expression_data, outline = FALSE, las = 2,
        main = "Expression Distribution")
dev.off()

# QC: Density plot
png("Plots/density_plot.png", width = 1200, height = 800)
plotDensities(expression_data, main = "Density Plot")
dev.off()

# PCA
pca <- prcomp(t(expression_data), scale. = TRUE)
pdf("Plots/pca_plot.pdf", width = 12, height = 8)
plot(pca$x[,1], pca$x[,2],
     xlab = "PC1", ylab = "PC2",
     main = "PCA of GEO data",
     pch = 19)
grid()
dev.off()

# Filtering by row median
row_median <- rowMedians(expression_data)
threshold <- 3.5
filtered_data <- expression_data[row_median > threshold, ]
dim(filtered_data)

# Define groups
groups <- factor(phenotype_data$source_name_ch1,
                 levels = c(" normal mucosa", "tumor"),
                 labels = c("normal","cancer"))

# Boxplot of filtered data
png("Plots/filtered_boxplot.png", width = 1200, height = 800)
boxplot(filtered_data, outline = FALSE, las = 2,
        main = "Filtered Expression Data")
dev.off()

# PCA of filtered expression data
pca <- prcomp(t(filtered_data), scale. = TRUE)

# Save PCA plot
pdf("Plots/pca_plot.pdf", width = 12, height = 8)
plot(pca$x[,1], pca$x[,2],
     xlab = "PC1", ylab = "PC2",
     main = "PCA of Filtered Expression Data",
     pch = 19,
     col = ifelse(groups == "normal", "blue", "red"))
legend("topright", legend = levels(groups), col = c("blue","red"), pch = 19)
grid()
dev.off()

# Density plot
png("Plots/filtered_density.png", width = 1200, height = 800)
plotDensities(filtered_data, main = "Density Plot of Filtered Expression Data")
dev.off()

# Save filtered data for downstream use
write.csv(filtered_data, "Results/filtered_expression_data.csv")

# Histogram of row medians
png("Plots/row_median_hist.png", width = 1200, height = 800)
hist(rowMedians(filtered_data),
     breaks = 100,
     freq = FALSE,
     main = "Row Median Distribution of Filtered Data",
     xlab = "Median Expression")
abline(v = 3.5, col = "red", lwd = 2)
dev.off()



