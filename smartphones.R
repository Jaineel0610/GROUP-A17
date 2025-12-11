# Load required library
library(ggplot2)

# 1. Load data

data <- read.csv("smartphone_cleaned_v5.csv")
# Remove rows with missing values in price or rating
data_clean <- na.omit(data[, c("price", "rating")])

cat("Cleaned data has", nrow(data_clean), "observations\n")

# 2. Scatter plot with regression line
ggplot(data_clean, aes(x = price, y = rating)) +
  geom_point(alpha = 0.5, color = "blue") +
  geom_smooth(method = "lm", color = "red", se = TRUE) +
  labs(title = "Relationship Between Smartphone Price and Rating",
       x = "Price",
       y = "Rating (out of 5)") +
  theme_minimal()

# Save plot
ggsave("scatter_plot.png", width = 8, height = 6)

# 3. Histograms
# Create side-by-side histograms
par(mfrow = c(1, 2))

# Price histogram
hist(data_clean$price, 
     main = "Distribution of Prices",
     xlab = "Price",
     col = "lightblue",
     border = "black")

# Rating histogram
hist(data_clean$rating,
     main = "Distribution of Ratings",
     xlab = "Rating",
     col = "lightgreen",
     border = "black")

# Save histogram
png("histograms.png", width = 800, height = 400)
par(mfrow = c(1, 2))
hist(data_clean$price, main = "Price Distribution", xlab = "Price", col = "lightblue")
hist(data_clean$rating, main = "Rating Distribution", xlab = "Rating", col = "lightgreen")
dev.off()

# Reset plot layout
par(mfrow = c(1, 1))


# 4. Correlation test
cor_test <- cor.test(data_clean$price, data_clean$rating, method = "pearson")
cat("\nPearson Correlation Test:\n")
cat("Correlation coefficient (r):", round(cor_test$estimate, 4), "\n")
cat("p-value:", round(cor_test$p.value, 4), "\n")

# 5. Linear regression
model <- lm(rating ~ price, data = data_clean)
cat("\nLinear Regression Results:\n")
cat("Regression equation: Rating =", 
    round(coef(model)[1], 4), "+", 
    round(coef(model)[2], 4), "* Price\n")
cat("R-squared:", round(summary(model)$r.squared, 4), "\n")

# 6. Hypothesis decision
cat("\nHypothesis Test Conclusion:\n")
if (cor_test$p.value < 0.05) {
  cat("We REJECT the null hypothesis (p < 0.05)\n")
  cat("There is a significant correlation between price and rating\n")
  if (cor_test$estimate > 0) {
    cat("The correlation is positive\n")
  } else {
    cat("The correlation is negative\n")
  }
} else {
  cat("We FAIL TO REJECT the null hypothesis (p > 0.05)\n")
  cat("No significant correlation found between price and rating\n")
}


