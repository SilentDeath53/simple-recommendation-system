install.packages("recommenderlab")
library(recommenderlab)

rating_matrix <- as(ratings, "realRatingMatrix")

set.seed(123)
data_split <- sample(1:3, nrow(rating_matrix), replace = TRUE, prob = c(0.6, 0.2, 0.2))
train_data <- rating_matrix[data_split == 1, ]
test_data <- rating_matrix[data_split == 2, ]

cf_model <- Recommender(train_data, method = "UBCF")

user_id <- 1
recommendations <- predict(cf_model, test_data[1:5, ], n = 5)

print(recommendations)
