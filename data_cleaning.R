# ----------------------------------------
# Step 1: Data cleaning and preparation
# Description: Imported dataset, selected required columns, removed NA,
# and prepared data for visual and statistical analysis.
# ----------------------------------------

data <- read.csv("Air_Traffic_Passenger_Statistics.csv")

# Keep only required columns
df <- data[, c("Passenger.Count", "GEO.Summary")]
df <- na.omit(df)

library(ggplot2)
# ----------------------------------------
# Step 2: Added visualizations (Histogram + Boxplot)
# Description: Created histogram with density overlay and boxplot
# to visually compare passenger counts between flight categories.
# ----------------------------------------

#Histogram with bell curve
ggplot(df, aes(x = Passenger.Count, fill = GEO.Summary)) +
  geom_histogram(aes(y = ..density..), bins = 40, alpha = 0.45, position = "identity", color = "black") +
  geom_density(alpha = 0.7, linewidth = 0.9) +
  scale_x_log10() +
  labs(
    title = "Histogram with Density Overlay of Passenger Counts for Domestic and International Flights",
    subtitle = "Log scale used to clearly display skewed flight passenger volume distribution",
    x = "Passenger Count (Log Scale)",
    y = "Density",
    fill = "Flight Category"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 15, face = "bold"),
    plot.subtitle = element_text(size = 11),
    axis.title = element_text(size = 12),
    legend.position = "right"
  ) +
  scale_fill_manual(values = c("steelblue", "darkred"))

#Boxplot for comparing means
ggplot(df, aes(x = GEO.Summary, y = Passenger.Count, fill = GEO.Summary)) +
  geom_boxplot() +
  labs(
    title = "Comparison of Passenger Count Between Domestic and International Flights",
    x = "Flight Category",
    y = "Passenger Count (Number of Passengers)"
  ) +
  theme_minimal() +
  scale_fill_manual(values = c("steelblue", "darkred"), name = "Flight Category")
