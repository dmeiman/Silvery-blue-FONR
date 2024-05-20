#bfly_by_survey_data.R

# Create the ggplot2 plot
library(tidyverse)
library(ggplot2)
library(scales)  # For date formatting

#use bfy3 to plot by date
butterfly_data <- bfly3

#rename variable to be more descriptive
butterfly_data$Date_time <- butterfly_data$Date

#now make the Date variable just a day
butterfly_data$Date <- as.Date(butterfly_data$Date_time)

# Group by Date and count butterflies
butterfly_counts <- butterfly_data %>%
  group_by(Date, Sex) %>%
  summarise(Count = n())

# Plot it
ggplot(butterfly_counts, aes(x = Date, y = Count)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  # scale_x_date(labels = date_format("%Y-%b"), breaks = "1 month") +
  ylab("Butterfly Count") +
  xlab("Survey Date") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#fix extra spaces in the Sex dataset
butterfly_counts$Sex[butterfly_counts$Sex == unique(butterfly_counts$Sex)[4]]<-"F"
butterfly_counts$Sex[butterfly_counts$Sex == unique(butterfly_counts$Sex)[4]]<-"M"

#break out the counts by number for each sex
butterfly_counts$Sex <- ifelse(butterfly_counts$Sex == "M", "Male",
                                    ifelse(butterfly_counts$Sex == "F", "Female", "Unknown"))

ggplot(butterfly_counts, aes(x = Date, y = Count, fill = Sex)) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = c("Male" = "blue", "Female" = "pink", "Unknown" = "gray")) +
  ylab("Butterfly Count") +
  xlab("Survey Date") +
  ggtitle("Butterflies at Fort Ord Natural Reserve") +  # Add the title
  labs(subtitle = "Spring 2024") +  # Subtitle
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(subtitle = "Spring 2024") +  # Subtitle
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 40, hjust = 1),
        plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5))  # Center the subtitle

