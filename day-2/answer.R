rm(list=ls())
library(RMySQL)
con <- dbConnect(RMySQL::MySQL(),
                    dbname='belanja',
                    host='127.0.0.1',
                    port=3306,
                    user='root',
                    password='')

dbListTables(con)
order <- dbReadTable(con, 'orders')
order_detail <- dbReadTable(con, 'orderdetails')

# Summary / Agregat
summary(order_detail)
order_detail$orderNumber <- as.factor(order_detail$orderNumber)

ggplot(order_detail, aes(x=as.numeric(orderNumber), y=quantityOrdered)) +
  geom_point(aes(alpha=.1,
                 color=orderNumber),
             position=position_jitter(width=10,height=1)) +
  guides(color=FALSE,
         alpha=FALSE,
         size=FALSE)

ggplot(order_detail, aes(x=priceEach, y=quantityOrdered)) +
  geom_point(aes(alpha=.1),
             position=position_jitter(width=10,height=1)) +
  guides(color=FALSE,
         alpha=FALSE)

ggplot(order_detail, aes(x=priceEach)) +
  geom_histogram(bins=nclass.scott(order_detail$priceEach),
                 colour="black", fill="white") +
  geom_vline(aes(xintercept=mean(priceEach, na.rm=TRUE)),
             color='red',
             linetype='dashed',
             size=1) +
  geom_vline(aes(xintercept=median(priceEach, na.rm=TRUE)),
             color='blue',
             linetype='dashed',
             size=1)

