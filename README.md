# AI-and-Omics-Research-Internship-2025
# Module 1 - Class 1b
Introduction to R Programming and Data Preparation

# 📝 Overview
This session introduced basic R programming, data handling, and factor conversion techniques.

# ✅ Key Learning Outcomes
1. Set the working directory for project organisation.
2. Loaded the dataset patient_info.csv.
3. Checked data structure and data types.
4. Converted gender and diagnosis into factors (categorical variables).
5. Created a binary variable smoker (1 = Yes, 0 = No).
6. Saved the cleaned dataset.
7. Stored the R Script in class_Ib.R.

# Module I – Class Ic
Conditional Statements & Automated Data Type Conversion

# 📝 Overview
This session built upon Class Ib, adding conditional logic and automated factor conversion.

# ✅ Key Learning Outcomes
1. Used if statements to check cholesterol levels.
2. Applied if...else statements for blood pressure status.
3. Automated categorical column detection and conversion in patient_info.csv and metadata.csv.
4. Converted Yes/No binary factors (e.g., smoker) to numeric codes.
5. Compared original vs modified dataset structures.
6. Saved the workspace as clean_Ic.RData.

# Module I – Class II
Differential Gene Expression (DGE) Analysis with R

# 📝 Overview
This session introduced real-world data handling using gene expression datasets.
The focus was on automating classification of genes as Upregulated, Downregulated, or Not Significant.

# ✅ Key Learning Outcomes
1. Processed multiple files (DEGs_Data_1.csv, DEGs_Data_2.csv).
2. Defined a custom R function classify_gene() to classify genes:
3. Upregulated if logFC > 1 & padj < 0.05
4. Downregulated if logFC < -1 & padj < 0.05
5. Not_Significant otherwise
6. Handled missing values (padj replaced with 1 if NA).
7. Stored results in an R list and exported processed CSV files.
8. Generated summary counts for Upregulated, Downregulated, and Not Significant genes.
9. Stored the work in class_2.R.

# Module II – Class 3B
Preprocessing and Normalization of Microarray Data in R

# 📝 Overview
This session focused on preprocessing and normalizing GEO microarray datasets to ensure high-quality data for downstream analysis. Emphasis was placed on reproducible workflows and exploratory data analysis (EDA).

# ✅ Key Learning Outcomes

1. Loaded and explored GEO ExpressionSet data (GSE3292).
2. Performed quality control using boxplots and density plots.
3. Applied filtering based on median gene expression to remove low-intensity genes.
4. Conducted normalization using RMA (Robust Multi-array Average) to standardize expression levels.
5. Visualized sample clustering using Principal Component Analysis (PCA).
6. Exported filtered and normalized expression data for downstream analysis.
7. Organized scripts, plots, and results into structured project directories.

# Resources
- Script: class_3b.R
- Data: filtered_expression_data.csv
- Plots: Boxplots, density plots, PCA plots
