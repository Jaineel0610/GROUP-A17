
# 1. Load data

data <- read.csv("smartphone_cleaned_v5.csv")
# Remove rows with missing values in price or rating
data_clean <- na.omit(data[, c("price", "rating")])

cat("Cleaned data has", nrow(data_clean), "observations\n")

