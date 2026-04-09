install.packages("vcd")
library(vcd)
library(dplyr)
data(Arthritis)
# remove ID because it's a unique identifier
arth_data <- Arthritis %>% select(-ID)
str(arth_data)

# ======================================================
# Question 2 — Exploratory Analysis
# Question 2 (a) — Frequency distribution of Improved
library(janitor)
# Overall distribution of Improved
overall_table <- arth_data %>%
  tabyl(Improved) %>%                     # frequency table
  adorn_pct_formatting(digits = 1) %>%    # format as percent
  print()

# Improved by Treatment (row-wise %)
percent_table <- arth_data %>%
  tabyl(Treatment, Improved) %>%          # cross-tabulation
  adorn_percentages("row") %>%            # row-wise percentages
  adorn_pct_formatting(digits = 1) %>%   # format as percent
  print()

# Question 2(b) - Summary statistics for Age
library(psych)
describe(arth_data$Age)
# Frequency and percentage
arth_data %>% tabyl(Treatment) %>% adorn_pct_formatting(digits = 1)
arth_data %>% tabyl(Sex) %>% adorn_pct_formatting(digits = 1)

# Question 2(c) — Mosaic plot
# Mosaic plot: Improved by Treatment
mosaic(~Treatment + Improved, data = arth_data,
       shade = TRUE, legend = TRUE,
       main = "Distribution of Improvement by Treatment",
       xlab = "Treatment Group", ylab = "Improvement Level")

# Mosaic plot: Improved by Sex
mosaic(~Sex + Improved, data = arth_data,
       shade = TRUE, legend = TRUE,
       main = "Distribution of Improvement by Sex",
       xlab = "Sex", ylab = "Improvement Level")

# Question 2(d) —  box plot
library(ggplot2)
describe(arth_data$Age)

# Boxplot of Age by Improved
ggplot(arth_data, aes(x = Improved, y = Age, fill = Improved)) +
  geom_boxplot() +
  scale_fill_manual(values = c("None" = "lightcoral", 
                               "Some" = "khaki", 
                               "Marked" = "skyblue")) +
  labs(title = "Distribution of Age by Improvement Level",
       x = "Improvement Level",
       y = "Age (years)") +
  theme_minimal() +
  theme(legend.position = "none")
# ======================================================
# Question 3 — Fitting and Interpreting the Model
# Question 3 (a) (b) 
library(MASS)
arth_data$Treatment <- relevel(arth_data$Treatment, ref = "Placebo")
arth_data$Sex <- relevel(arth_data$Sex, ref = "Female")
model_polr <- polr(Improved ~ Treatment + Sex + Age, 
                   data = arth_data,
                   Hess = TRUE)

summary(model_polr)

# Question 3 (c) 
coef(model_polr)
exp(coef(model_polr))

# Question 3 (d) 
library(lmtest)
coeftest(model_polr)

# ======================================================
# Question 4 — Checking the Proportional Odds Assumption
# Question 4 (a)
install.packages("brant")
library(brant)
brant(model_polr)

# Question 4 (c)
model_null <- polr(Improved ~ 1, data = arth_data, Hess = TRUE)
model_null$deviance
model_polr$deviance

# Likelihood ratio test
anova(model_null, model_polr)
