#bfly_by_survey_data.R

# Create the ggplot2 plot
library(ggplot2)
library(scales)  # For date formatting

#use bfy3 to plot by date
butterfly_data <- bfly3

butterfly_data$Date_time <- butterfly_data$Date

butterfly_data$Date <- as.Date(butterfly_data$Date_time)

# Group by Date and count butterflies
butterfly_counts <- butterfly_data %>%
  group_by(Date) %>%
  summarise(Count = n())

ggplot(butterfly_counts, aes(x = Date, y = Count)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  # scale_x_date(labels = date_format("%Y-%b"), breaks = "1 month") +
  ylab("Butterfly Count") +
  xlab("Survey Date") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
