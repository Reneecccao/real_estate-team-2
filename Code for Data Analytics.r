---
title: "R Notebook"
output: html_notebook
---

```{r}
# Plan for real_estate data analytics
# 1. Establish connection with shared host su19server.apan5310.com
# 2. Import data tables that were normalized from original train data
# 3. Unnormalize tables and build data
# 4. Run analytics
```

```{r}
#R packages
require(RPostgreSQL)
library(stringr)
library(tidyverse)
library(DescTools)
```


```{r}
# database connection
drv<-dbDriver('PostgreSQL')
re_conn<- dbConnect(drv, dbname = 'real_estate',
                 host = 'su19server.apan5310.com', port = 50202,
                 user = 'postgres', password = '64ddswmi')

```

```{r}
#we create a view to return the data in tables to original unnormalized data form
#to do so we collect all tables, turn into dataframes and merge
#we start with units
units<-dbGetQuery(re_conn, "select * from units")
str(units)
```
```{r}
# units does not require further transformation
#we import tables associated with basements
base_unit<-dbGetQuery(re_conn, "select * from basemt_unit")
str(base_unit)
basements<-dbGetQuery(re_conn, "select * from basements")
str(basements)
base_finish<-dbGetQuery(re_conn, "select * from basemt_finish")
str(base_finish)
```
```{r}
#merge three tables into 1 by basement id
basement_data<-merge(base_unit,basements, by="basemt_id")
basement_data<-merge(basement_data,base_finish,by="basemt_id")
str(basement_data)
```
```{r}
#unnormalize basement to have 3 columns for finishtype and 3 for their corresponding sqft
#combine finish_type with sqft
basement_data$temp<-paste(basement_data$basemt_finish_type,"_",basement_data$basemt_finish_sqft)
basement_data<-basement_data[,c(1,2,3,4,5,6,7,10)]
str(basement_data)
```
```{r}
# spread values
basement_data<-basement_data%>%spread(basemt_finish_no,temp)
str(basement_data)
```
```{r}
#separate 1,2,3
basement_data<-basement_data%>%separate('1',c('basemt_finish1','basemt_finish1_sqft'),sep='_',remove=TRUE)%>%
  separate('2',c('basemt_finish2','basemt_finish2_sqft'),sep='_',remove=TRUE)%>%
  separate('3',c('basemt_unfinish','basemt_unfinish_sqft'),sep='_',remove=TRUE)
str(basement_data)
```
```{r}
#we drop basemt_unfinish
basement_data<-basement_data[,-11]
str(basement_data)
```
```{r}
#convert data types
basement_data$basemt_finish1_sqft<-as.numeric(basement_data$basemt_finish1_sqft)
basement_data$basemt_finish2_sqft<-as.numeric(basement_data$basemt_finish2_sqft)
basement_data$basemt_unfinish_sqft<-as.numeric(basement_data$basemt_unfinish_sqft)
str(basement_data)
```
```{r}
#merge to units
data<-merge(units,basement_data,by="unit_id",all.x=TRUE)
str(data)
```

```{r}
#we import tables associated with bathrooms
bathrooms<-dbGetQuery(re_conn, "select * from bathrooms")
str(bathrooms)
```
```{r}
#unnormalize bathroom to have 4 columns for bm_full, bm_half, ag_full, ag_half
#combine bathrm_loc with bathrm_type
bathrooms$col_name<-paste(bathrooms$bathrm_loc,"_",bathrooms$bathrm_type)
#drop original columns
bathrooms<-bathrooms[,-c(2,3)]
#spread col_names
bathrooms<-bathrooms%>%spread(col_name,bathrm_quant)
#column names
colnames(bathrooms)<-c("unit_id","ag_full","ag_half","bm_full","bm_half")
#replace NA counts with 0
bathrooms$ag_full[is.na(bathrooms$ag_full)]<-0
bathrooms$ag_half[is.na(bathrooms$ag_half)]<-0
bathrooms$bm_full[is.na(bathrooms$bm_full)]<-0
bathrooms$bm_half[is.na(bathrooms$bm_half)]<-0
str(bathrooms)
```
```{r}
#merge to data
data<-merge(data,bathrooms,by="unit_id",all.x=TRUE)
str(data)
```


```{r}
#we import tables associated with ext_cover
ext_cover<-dbGetQuery(re_conn, "select * from ext_cover")
str(ext_cover)
```
```{r}
#unnormalize ext_cover to have 2 columns for ext_cover1, ext_cover2
#spread ext_cover_no
ext_cover<-ext_cover%>%spread(ext_cover_no,ext_cover)
#column names
colnames(ext_cover)<-c("unit_id","ext_cover1","ext_cover2")
str(ext_cover)
```
```{r}
#merge to data
data<-merge(data,ext_cover,by="unit_id",all.x=TRUE)
str(data)
```


```{r}
#we import tables associated with feat_value
feat_value<-dbGetQuery(re_conn, "select * from feat_value")
str(feat_value)
```
```{r}
#merge to data
data<-merge(data,feat_value,by="unit_id",all.x=TRUE)
str(data)
```


```{r}
#we import tables associated with garage
garage_unit<-dbGetQuery(re_conn, "select * from garage_unit")
str(garage_unit)
garage<-dbGetQuery(re_conn, "select * from garage")
str(garage)

```
```{r}
#merge two tables into 1 by garage id
garage_data<-merge(garage,garage_unit, by="garage_id")
str(garage_data)
```
```{r}
#merge to data
data<-merge(data,garage_data,by="unit_id",all.x=TRUE)
str(data)
```


```{r}
#we import tables associated with sales
sale_unit<-dbGetQuery(re_conn, "select * from sale_unit")
str(sale_unit)
sales<-dbGetQuery(re_conn, "select * from sales")
str(sales)
```
```{r}
#merge two tables into 1 by sale id
sale_data<-merge(sales,sale_unit, by="sale_id")
str(sale_data)
```
```{r}
#merge to data
data<-merge(data,sale_data,by="unit_id",all.x=TRUE)
str(data)
```


```{r}
#we import tables associated with fireplace
fireplace<-dbGetQuery(re_conn, "select * from fireplace")
str(fireplace)
```
```{r}
#merge to data
data<-merge(data,fireplace,by="unit_id",all.x=TRUE)
str(data)
```


```{r}
#we import tables associated with floor_area
floor_area<-dbGetQuery(re_conn, "select * from floor_area")
str(floor_area)
```
```{r}
#unnormalize floor_area to have 2 columns for floor1, floor1
#spread floor_no
floor_area<-floor_area%>%spread(floor_no,floor_sqft)
#column names
colnames(floor_area)<-c("unit_id","floor1_sqft","floor2_sqft")
str(floor_area)
```
```{r}
#merge to data
data<-merge(data,floor_area,by="unit_id",all.x=TRUE)
str(data)
```


```{r}
#we import tables associated with heat_qual
heat_qual<-dbGetQuery(re_conn, "select * from heat_qual")
str(heat_qual)
```
```{r}
#merge to data
data<-merge(data,heat_qual,by="unit_id",all.x=TRUE)
str(data)
```


```{r}
#we import tables associated with kitchen
kitchen<-dbGetQuery(re_conn, "select * from kitchen")
str(kitchen)
```
```{r}
#merge to data
data<-merge(data,kitchen,by="unit_id",all.x=TRUE)
str(data)
```


```{r}
#we import tables associated with masonry
masonry<-dbGetQuery(re_conn, "select * from masonry")
str(masonry)
```
```{r}
#merge to data
data<-merge(data,masonry,by="unit_id",all.x=TRUE)
str(data)
```


```{r}
#we import tables associated with pools
pool_unit<-dbGetQuery(re_conn, "select * from pool_unit")
str(pool_unit)
pools<-dbGetQuery(re_conn, "select * from pools")
str(pools)
```
```{r}
#merge two tables into 1 by pool id
pool_data<-merge(pools,pool_unit, by="pool_id")
str(pool_data)
```
```{r}
#merge to data
data<-merge(data,pool_data,by="unit_id",all.x=TRUE)
str(data)
```


```{r}
#we import tables associated with porch
porch<-dbGetQuery(re_conn, "select * from porch")
str(porch)
```
```{r}
#merge to data
data<-merge(data,porch,by="unit_id",all.x=TRUE)
str(data)
```


```{r}
#we import tables associated with str_condition
str_condition<-dbGetQuery(re_conn, "select * from str_condition")
str(str_condition)
```
```{r}
#unnormalize str_condition to have 2 columns for str_cond1, str_cond2
#spread cond_no
str_condition<-str_condition%>%spread(cond_no,cond_type)
#column names
colnames(str_condition)<-c("unit_id","str_cond1","str_cond2")
str(str_condition)
```
```{r}
#merge to data
data<-merge(data,str_condition,by="unit_id",all.x=TRUE)
str(data)
```


```{r}
#lets build few charts to see the impact of different features on pricing
library(ggplot2)

#Location
ggplot(data,aes(factor(c(reorder(neighborhood,sale_price,mean))),sale_price))+geom_boxplot()
```
```{r}
#Size
ggplot(data,aes(abovegr_live_sqft,sale_price))+geom_point()
```
```{r}
#age
ggplot(data,aes(year_built,sale_price))+geom_point()
```
```{r}
#lets turn all character variables into numeric dummies (factor)
chars<-sapply(data,is.character)
data[chars]<-lapply(data[chars],function(x) as.numeric(factor(x)))
str(data)
```
```{r}
#lets turn logical variable for central air into numeric
data$central_air<-as.numeric(data$central_air)
str(data)
```
```{r}
#lets see what columns contain NAs
colnames(data)[colSums(is.na(data)) > 0]
```
```{r}
#lot_front_length,basemt_sqft,basemt_finish1_sqft,basemt_finish2_sqft,basemt_unfinish_sqft,feat_value,garage_cap,garage_sqft,firepl_count,mason_sqft,pool_sqft,porch_sqft we change to 0 since NAs represents same value in these cases
data[,c('lot_front_length','basemt_sqft','basemt_finish1_sqft','basemt_finish2_sqft','basemt_unfinish_sqft','feat_value','garage_cap','garage_sqft','firepl_count','mason_sqft','pool_sqft','porch_sqft')][is.na(data[,c('lot_front_length','basemt_sqft','basemt_finish1_sqft','basemt_finish2_sqft','basemt_unfinish_sqft','feat_value','garage_cap','garage_sqft','firepl_count','mason_sqft','pool_sqft','porch_sqft')])]<-0
colnames(data)[colSums(is.na(data)) > 0]
```

```{r}
#for remaining columns we replace missing values by -1 as unique identifier
data[,c("el_system", "basemt_id","basemt_qual","basemt_cond","basemt_exp","basemt_finish1","basemt_finish2",
        "feat_type","garage_id","garage_type","garage_year_built","garage_finish_type","garage_qual",
        "garage_cond","drvway_pave","firepl_qual","mason_type","pool_id","pool_qual","porch_type")][is.na(data[,c("el_system", "basemt_id","basemt_qual","basemt_cond","basemt_exp","basemt_finish1","basemt_finish2",
        "feat_type","garage_id","garage_type","garage_year_built","garage_finish_type","garage_qual",
        "garage_cond","drvway_pave","firepl_qual","mason_type","pool_id","pool_qual","porch_type")])]<--1
colnames(data)[colSums(is.na(data)) > 0]
```

```{r}
#select top variables by correlation higher than 0.4 to the sales price (0.4 selected as minimum criteria for medium correlation strength)
corr<-data.frame(abs(cor(data,data$sale_price)))
corr<-tibble::rownames_to_column(corr,"name")
colnames(corr)<-c("name","q")
corr[corr$q>0.4,]
```
```{r}
#subset data for higher correlations
subset_columns<-unlist(c(filter(corr,abs(q)>0.4)[,1]))
data_sub<-data[,subset_columns]
head(data_sub)
```
```{r}
#split datat into train and test
library(caret)
set.seed(82)
sample<-createDataPartition(data_sub$sale_price,p=0.8,list=F,groups=20)
train<-data_sub[sample,]
test<-data_sub[-sample,]
```


```{r}
#lets run linear model
model<-lm(sale_price~.,train)
summary(model)
```

```{r}
pred<-predict(model,newdata=test)
rmse<-sqrt(mean((pred-test$sale_price)^2))
rmse
```

```{r}
#Pretty solid performance with R squared at 0.82 and RMSE accuracy at 40K
```





