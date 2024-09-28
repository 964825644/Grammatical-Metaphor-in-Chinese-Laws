#多重对应分析Multiple Correspondence analysis,adapted from Xu (2023)许家金(2023)语料库研究方法
#隐喻与语义交联多重对应分析模板

library(FactoMineR)

file_path <- "E:/111/all mca.csv"

# Read the data
data2 <- read.table(file_path, header = TRUE, sep = ",")
colnames(data2)

data2[c("gm1","gm2","gm4","gm5","gm6","gm7","gm9","gm10","gm12","gm13",
        "gm13ii","polarity","clause",
        "ls")]<-lapply(data2[c("gm1","gm2","gm4","gm5","gm6","gm7","gm9","gm10","gm12","gm13",
                               "gm13ii","polarity","clause",
                               "ls")], factor)

#data2[c("gm1","gm2","gm5","gm6","gm10","gm12","gm13","gm13ii","clause",
#"X10gm","X11gm","X12gm","X13gm", "X13iigm","clause","modality",
#"polarity","seman")]<-lapply(data2[c("X1gm","X2gm","X3gm","X4gm",
#"X5gm","X6gm","X7gm","X8gm","X9gm","X10gm","X11gm","X12gm",
#"X13gm", "X13iigm","clause","modality","polarity","seman")], factor)

str(data2)

head(data2)

ca.data2<-MCA(data2[,c(1:13)], graph = FALSE)

#plot(ca.data2, cex = 0.7, col.var = "black", col.ind = "grey")
plot(ca.data2, cex = 0.3, col.var = "black", invisible = "ind")

ca.data3<-MCA(data2, quali.sup = 14, graph = FALSE)

plot(ca.data3, cex = 0.3, invisible = "ind", col.var = "darkgrey", col.quali.sup = "black")

dimdesc(ca.data2)


#plotellipses(ca.data3, keepvar = L, label = "quali")
plotellipses(ca.data3, keepvar = 14, label = "quali")

png("E:/111/ca_plot2.png", width = 2000, height = 2000, res = 300)
plotellipses(ca.data3, cex = 1, xlim = c(-1.5, 1.5), ylim = c(-1.5, 1.5), 
             means = FALSE, keepvar = 14, label = "quali")
dev.off()

library(ca)
#ca.data4<-mjca(data2[,c(1:9)])
ca.data4<-MCA(data2[,c(1:13)])
summary(ca.data4)
