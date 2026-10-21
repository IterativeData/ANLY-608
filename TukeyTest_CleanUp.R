# Part 7: TukeyHSD() Which Groups Differ?  
  # Use Decision Tree to decide which variables to run Tukey on

tukey <- TukeyHSD(two.way_interaction, "supp:dose")
view(tukey)

# Convert to a data frame
tukey_df <- as.data.frame(tukey$`supp:dose`)
tukey_df$comparison <- rownames(tukey_df)


# Keep the important columns and tidy them up
tukey_df <- tukey_df[, c("comparison", "diff", "lwr", "upr", "p adj")]
tukey_df$`p adj` <- round(tukey_df$`p adj`, 4)
tukey_df[, c("diff", "lwr", "upr")] <- round(tukey_df[, c("diff", "lwr", "upr")], 2)
rownames(tukey_df) <- NULL

# Keep only significant pairs, sorted from most to least significant
sig_pairs <- tukey_df[tukey_df$`p adj` < 0.05, ]
sig_pairs <- sig_pairs[order(sig_pairs$`p adj`), ]

print(sig_pairs)
