# Part 0: Import Data + Create Variable 
    # 1. Read the file
my_data <- read.csv("your_file.csv")
    # 2. View the data
View(my_data)

X <- hotels[, c("Service", "Cleanliness", "Amenities", "Value", "Loyalty")]

# Part 1: Standardize Each Variable with scale(X)
X_scaled <- scale(X)  

# Part 2: Standardized Euclidean Distances (Computing Pairwise Distances)
D <- dist(X_scaled, method = "euclidean") 
  # Output: The 3 smallest distances are the 3 most similar pairs

# Part 3: Pick 1 Pair, Compare To Find Biggest Gap, Hotel With Highest Score Is The Benchmark
