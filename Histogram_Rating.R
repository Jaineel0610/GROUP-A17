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
