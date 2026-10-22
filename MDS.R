# Part 0: Import Data + Create Variable 
X <- hotels[, c("Service", "Cleanliness", "Amenities", "Value", "Loyalty")]

# Part 1: Standardize Each Variable with scale(X)
X_scaled <- scale(X)  

# Part 2: Standardized Euclidean Distances (Computing Pairwise Distances)
D <- dist(X_scaled, method = "euclidean") 
  # Output: The 3 smallest distances are the 3 most similar pairs

# Part 3: 
