#简单对应分析 Simple Correspondence analysis，adapted from Xu (2023)(许家金. 2023. 语料库研究方法[M]. 北京:外语教学与研究出版社)
library(ca)

# Specify the file path
file_path <- "E:/111/xianfa.txt"

# Read the data
data1 <- read.table(file_path, header = TRUE, sep = "\t", row.names = 1)

# Print the data
print(data1)

# Perform correspondence analysis
ca.data1 <- ca(data1)

# Display the summary
summary(ca.data1)

#如想要看第2、3个维度，则变为c(2,3)
#plot(ca.data1, dim = c(1,2))
png("E:/111/宪法 简单对应分析2.png", width = 4000, height = 4000, res = 500)  # Adjust width, height, and resolution as needed
plot(ca.data1, dim = c(1,2), cex = 2000, xlim = c(-1, 0.6), ylim = c(-0.6, 0.6), main = "Correspondence Analysis")
dev.off()  # Close the PNG device

# Plot the Correspondence Analysis results with smaller scale and font
# plot(ca.data1, dim = c(1,2), cex = 0.2, xlim = c(-0.3, 0.3), ylim = c(-0.3, 0.3), main = "Correspondence Analysis")

# Optional: Save the plot to a file
# png(filename = "ca_plot.png", width = 800, height = 600)
# plot(ca.data1, dim = c(1,2), cex = 0.8, xlim = c(-0.5, 0.5), ylim = c(-0.5, 0.5), main = "Correspondence Analysis")
# dev.off()
