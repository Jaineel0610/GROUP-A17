# 4. Correlation test
cor_test <- cor.test(data_clean$price, data_clean$rating, method = "pearson")
cat("\nPearson Correlation Test:\n")
cat("Correlation coefficient (r):", round(cor_test$estimate, 4), "\n")
cat("p-value:", round(cor_test$p.value, 4), "\n") 
