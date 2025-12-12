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