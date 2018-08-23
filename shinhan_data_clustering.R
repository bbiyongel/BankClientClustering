# set the work directory and load the data 
setwd('Rwork')
data <- read.csv("Shinhan_data_ya02.csv", encoding='latin1')
head(data)
str(data)

# rename the columns
colnames(data) <- c('idx','성별','연령_10세단위','직업구분',
    '지역구분','가구소득구간','결혼여부','맞벌이','자녀수','총자산','금융자산',
    '부동산자산','기타자산','월총저축액','월저축액_적금','청약보유여부',
    '월저축액_펀드주식','월저출액_펀드','월저축액_주식','월저축액_저축성보험',
    '월저축액_청약','부채잔액','부채잔액_신용대출','부채잔액_담보대출',
    '부채잔액_아파트주책담보대출','부채잔액_전세자금대출','은퇴후필요자금',
    '노후자금융월저축액','금융상품잔액_정기예금','금용상품잔액_적금',
    '금융상품잔액_청약','금용상품잔액_펀드','금융상품잔액_ELS/DLS/ETF',
    '월총소비금액','월평균카드사용금액')
head(data)
cor(data)

# normalization
df_02 <- scale(data[,c('총자산', '부채잔액')])
head(df_02)

# nb clust 
library(NbClust)
nc <- NbClust(df_02, min.nc = 2, max.nc = 7, method = "kmeans")

# k-means / group = 3
kmeans_df_02 <- kmeans(df_02, centers = 3, iter.max = 1000)
kmeans_df_02
plot(df_02, col= kmeans_df_02$cluster)


