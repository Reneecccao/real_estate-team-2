---
title: "R Notebook"
output: html_notebook
---

```{r}
# Plan for real_estate database population
# 1. Establish connection with shared host su19server.apan5310.com
# 2. Import data description .txt file
# 3. Transpose data to fit into database schemas
# 4. Prepare dictionary datasets, pass data into real_estate tables
# 5. Import train data in .csv format
# 6. Break columns as per 3NF design of the real_estate database.
# 7. Transpose and summarize data to fit into database schemas
# 8. Prepare datasets, pass data into real_estate tables
# 9. Test if imports performed correctly (inside sql, run few queries)
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
#import data 

descr<-read.delim('data_description.txt',header=FALSE,stringsAsFactor = FALSE,strip.white = TRUE)
```

```{r}
#inspect data
str(descr)
head(descr,n=20)
```

```{r}
#file imported correctly now its we separate each dictionary into a stand alone dataset per database design
#for convenience we maintain same names as targeted table
# data for subclass_lookup
subclass_lookup<-descr[c(2:17),]
#rename columns
colnames(subclass_lookup)<-c('subclass_no','subclass_desc')
#convert datatypes
subclass_lookup$subclass_no<-as.integer(subclass_lookup$subclass_no)
#review results
subclass_lookup

```

```{r}
# insert subclass_lookup data
dbWriteTable(re_conn, "subclass_lookup", subclass_lookup, row.names=FALSE, append=TRUE)
```


```{r}
#before each next table dataset we clear original descr from the data that was used for previous datasets
descr<-descr[-c(1:17),]
head(descr,n=20)
```

```{r}
# data for zoning_lookup
zoning_lookup<-descr[c(3:10),]
#rename columns
colnames(zoning_lookup)<-c('zoning_code','zoning_desc')
#review results
zoning_lookup
```

```{r}
# insert zoning_lookup data
dbWriteTable(re_conn, "zoning_lookup", zoning_lookup, row.names=FALSE, append=TRUE)
```

```{r}
#before each next table dataset we clear original descr from the data that was used for previous datasets or unnecessary rows
descr<-descr[-c(1:13),]
head(descr,n=20)
```

```{r}
# data for street_type_lookup
street_type_lookup<-descr[c(2:3),]
#rename columns
colnames(street_type_lookup)<-c('str_type','str_type_desc')
#review results
street_type_lookup
```

```{r}
# insert street_type_lookup data
dbWriteTable(re_conn, "street_type_lookup", street_type_lookup, row.names=FALSE, append=TRUE)
```

```{r}
#before each next table dataset we clear original descr from the data that was used for previous datasets or unnecessary rows
descr<-descr[-c(1:4),]
head(descr,n=20)
```

```{r}
# data for alley_type_lookup
alley_type_lookup<-descr[c(2:4),]
#rename columns
colnames(alley_type_lookup)<-c('alley_type','alley_type_desc')
#we change last line data
alley_type_lookup[3,1]<-"None"
alley_type_lookup[3,2]<-"No alley"
#review results
alley_type_lookup
```

```{r}
# insert alley_type_lookup data
dbWriteTable(re_conn, "alley_type_lookup", alley_type_lookup, row.names=FALSE, append=TRUE)
```

```{r}
#before each next table dataset we clear original descr from the data that was used for previous datasets or unnecessary rows
descr<-descr[-c(1:5),]
head(descr,n=20)
```

```{r}
# data for lot_shape_lookup
lot_shape_lookup<-descr[c(2:5),]
#rename columns
colnames(lot_shape_lookup)<-c('lot_shape','lot_shape_desc')
#review results
lot_shape_lookup
```

```{r}
# insert lot_shape_lookup data
dbWriteTable(re_conn, "lot_shape_lookup", lot_shape_lookup, row.names=FALSE, append=TRUE)
```

```{r}
#before each next table dataset we clear original descr from the data that was used for previous datasets or unnecessary rows
descr<-descr[-c(1:5),]
head(descr,n=20)
```

```{r}
# data for land_contour_lookup
land_contour_lookup<-descr[c(2:5),]
#rename columns
colnames(land_contour_lookup)<-c('land_cont','land_cont_desc')
#review results
land_contour_lookup
```

```{r}
# insert land_contour_lookup data
dbWriteTable(re_conn, "land_contour_lookup", land_contour_lookup, row.names=FALSE, append=TRUE)
```

```{r}
#before each next table dataset we clear original descr from the data that was used for previous datasets or unnecessary rows
descr<-descr[-c(1:6),]
head(descr,n=20)
```

```{r}
# data for utilities_lookup
utilities_lookup<-descr[c(3:6),]
#rename columns
colnames(utilities_lookup)<-c('utilities','utilities_desc')
#review results
utilities_lookup
```

```{r}
# insert utilities_lookup data
dbWriteTable(re_conn, "utilities_lookup", utilities_lookup, row.names=FALSE, append=TRUE)
```

```{r}
#before each next table dataset we clear original descr from the data that was used for previous datasets or unnecessary rows
descr<-descr[-c(1:7),]
head(descr,n=20)
```

```{r}
# data for lot_config_lookup
lot_config_lookup<-descr[c(2:6),]
#rename columns
colnames(lot_config_lookup)<-c('lot_conf','lot_conf_desc')
#review results
lot_config_lookup
```

```{r}
# insert lot_config_lookup data
dbWriteTable(re_conn, "lot_config_lookup", lot_config_lookup, row.names=FALSE, append=TRUE)
```

```{r}
#before each next table dataset we clear original descr from the data that was used for previous datasets or unnecessary rows
descr<-descr[-c(1:7),]
head(descr,n=20)
```

```{r}
# data for land_slope_lookup
land_slope_lookup<-descr[c(3:5),]
#rename columns
colnames(land_slope_lookup)<-c('land_slope','land_slope_desc')
#review results
land_slope_lookup
```

```{r}
# insert land_slope_lookup data
dbWriteTable(re_conn, "land_slope_lookup", land_slope_lookup, row.names=FALSE, append=TRUE)
```

```{r}
#before each next table dataset we clear original descr from the data that was used for previous datasets or unnecessary rows
descr<-descr[-c(1:6),]
head(descr,n=30)
```

```{r}
# data for neighborhood_lookup
neighborhood_lookup<-descr[c(2:26),]
#rename columns
colnames(neighborhood_lookup)<-c('neighborhood','neighborhood_name')
#review results
neighborhood_lookup
```

```{r}
# insert neighborhood_lookup data
dbWriteTable(re_conn, "neighborhood_lookup", neighborhood_lookup, row.names=FALSE, append=TRUE)
```

```{r}
#before each next table dataset we clear original descr from the data that was used for previous datasets or unnecessary rows
descr<-descr[-c(1:28),]
head(descr,n=20)
```

```{r}
# data for street_cond_lookup
street_cond_lookup<-descr[c(3:11),]
#rename columns
colnames(street_cond_lookup)<-c('cond_type','cond_desc')
#review results
street_cond_lookup
```

```{r}
# insert street_cond_lookup data
dbWriteTable(re_conn, "street_cond_lookup", street_cond_lookup, row.names=FALSE, append=TRUE)
```

```{r}
#before each next table dataset we clear original descr from the data that was used for previous datasets or unnecessary rows
descr<-descr[-c(1:24),]
head(descr,n=20)
```

```{r}
# data for build_type_lookup
build_type_lookup<-descr[c(3:7),]
#rename columns
colnames(build_type_lookup)<-c('build_type','build_type_desc')
#review results
build_type_lookup
```

```{r}
# insert build_type_lookup data
dbWriteTable(re_conn, "build_type_lookup", build_type_lookup, row.names=FALSE, append=TRUE)
```

```{r}
#before each next table dataset we clear original descr from the data that was used for previous datasets or unnecessary rows
descr<-descr[-c(1:8),]
head(descr,n=20)
```

```{r}
# data for house_style_lookup
house_style_lookup<-descr[c(3:10),]
#rename columns
colnames(house_style_lookup)<-c('house_style','house_style_desc')
#review results
house_style_lookup
```

```{r}
# insert house_style_lookup data
dbWriteTable(re_conn, "house_style_lookup", house_style_lookup, row.names=FALSE, append=TRUE)
```

```{r}
#before each next table dataset we clear original descr from the data that was used for previous datasets or unnecessary rows
descr<-descr[-c(1:11),]
head(descr,n=20)
```

```{r}
# data for rating_lookup
rating_lookup<-descr[c(2:11),]
#rename columns
colnames(rating_lookup)<-c('rating','rating_desc')
#convert datatypes
rating_lookup$rating<-as.integer(rating_lookup$rating)
#review results
rating_lookup
```

```{r}
# insert rating_lookup data
dbWriteTable(re_conn, "rating_lookup", rating_lookup, row.names=FALSE, append=TRUE)
```

```{r}
#before each next table dataset we clear original descr from the data that was used for previous datasets or unnecessary rows
descr<-descr[-c(1:26),]
head(descr,n=20)
```

```{r}
# data for roof_style_lookup
roof_style_lookup<-descr[c(2:7),]
#rename columns
colnames(roof_style_lookup)<-c('roof_style','roof_style_desc')
#review results
roof_style_lookup
```

```{r}
# insert roof_style_lookup data
dbWriteTable(re_conn, "roof_style_lookup", roof_style_lookup, row.names=FALSE, append=TRUE)
```

```{r}
#before each next table dataset we clear original descr from the data that was used for previous datasets or unnecessary rows
descr<-descr[-c(1:8),]
head(descr,n=20)
```

```{r}
# data for roof_mat_lookup
roof_mat_lookup<-descr[c(2:9),]
#rename columns
colnames(roof_mat_lookup)<-c('roof_mat','roof_mat_desc')
#review results
roof_mat_lookup
```

```{r}
# insert roof_mat_lookup data
dbWriteTable(re_conn, "roof_mat_lookup", roof_mat_lookup, row.names=FALSE, append=TRUE)
```

```{r}
#before each next table dataset we clear original descr from the data that was used for previous datasets or unnecessary rows
descr<-descr[-c(1:10),]
head(descr,n=20)
```

```{r}
# data for exterior_cover_lookup
exterior_cover_lookup<-descr[c(2:18),]
#rename columns
colnames(exterior_cover_lookup)<-c('ext_cover','ext_cover_desc')
#review results
exterior_cover_lookup
```

```{r}
# insert exterior_cover_lookup data
dbWriteTable(re_conn, "exterior_cover_lookup", exterior_cover_lookup, row.names=FALSE, append=TRUE)
```

```{r}
#before each next table dataset we clear original descr from the data that was used for previous datasets or unnecessary rows
descr<-descr[-c(1:38),]
head(descr,n=20)
```

```{r}
# data for mason_lookup
mason_lookup<-descr[c(2:6),]
#rename columns
colnames(mason_lookup)<-c('mason_type','mason_type_desc')
#review results
mason_lookup
```

```{r}
# insert mason_lookup data
dbWriteTable(re_conn, "mason_lookup", mason_lookup, row.names=FALSE, append=TRUE)
```

```{r}
#before each next table dataset we clear original descr from the data that was used for previous datasets or unnecessary rows
descr<-descr[-c(1:8),]
head(descr,n=20)
```

```{r}
# data for grading_lookup
grading_lookup<-descr[c(3:7),]
#rename columns
colnames(grading_lookup)<-c('grade','grade_desc')
#we change 3 line data to fit database design
grading_lookup[3,2]<-"Typical"
#review results
grading_lookup
```

```{r}
# insert grading_lookup data
dbWriteTable(re_conn, "grading_lookup", grading_lookup, row.names=FALSE, append=TRUE)
```

```{r}
#before each next table dataset we clear original descr from the data that was used for previous datasets or unnecessary rows
descr<-descr[-c(1:16),]
head(descr,n=20)
```

```{r}
# data for found_type_lookup
found_type_lookup<-descr[c(3:8),]
#rename columns
colnames(found_type_lookup)<-c('found_type','found_type_desc')
#review results
found_type_lookup
```

```{r}
# insert found_type_lookup data
dbWriteTable(re_conn, "found_type_lookup", found_type_lookup, row.names=FALSE, append=TRUE)
```

```{r}
#before each next table dataset we clear original descr from the data that was used for previous datasets or unnecessary rows
descr<-descr[-c(1:25),]
head(descr,n=20)
```

```{r}
# data for basemt_exp_lookup
basemt_exp_lookup<-descr[c(2:6),]
#rename columns
colnames(basemt_exp_lookup)<-c('basemt_exp','basemt_exp_desc')
#we change 2 lines data to avoid confusion
basemt_exp_lookup[4,1]<-"NE"
basemt_exp_lookup[5,1]<-"NB"
#review results
basemt_exp_lookup
```

```{r}
# insert basemt_exp_lookup data
dbWriteTable(re_conn, "basemt_exp_lookup", basemt_exp_lookup, row.names=FALSE, append=TRUE)
```

```{r}
#before each next table dataset we clear original descr from the data that was used for previous datasets or unnecessary rows
descr<-descr[-c(1:7),]
head(descr,n=20)
```

```{r}
# data for basemt_finish_lookup
basemt_finish_lookup<-descr[c(2:8),]
#rename columns
colnames(basemt_finish_lookup)<-c('basemt_finish_type','basemt_finish_type_desc')
#we change last lines data to avoid confusion
basemt_finish_lookup[7,1]<-"NB"
#review results
basemt_finish_lookup
```

```{r}
# insert basement_finish_lookup data
dbWriteTable(re_conn, "basemt_finish_lookup", basemt_finish_lookup, row.names=FALSE, append=TRUE)
```

```{r}
#before each next table dataset we clear original descr from the data that was used for previous datasets or unnecessary rows
descr<-descr[-c(1:21),]
head(descr,n=20)
```

```{r}
# data for heat_type_lookup
heat_type_lookup<-descr[c(3:8),]
#rename columns
colnames(heat_type_lookup)<-c('heat_type','heat_type_desc')
#review results
heat_type_lookup
```

```{r}
# insert heat_type_lookup data
dbWriteTable(re_conn, "heat_type_lookup", heat_type_lookup, row.names=FALSE, append=TRUE)
```

```{r}
#before each next table dataset we clear original descr from the data that was used for previous datasets or unnecessary rows
descr<-descr[-c(1:20),]
head(descr,n=20)
```

```{r}
# data for el_system_lookup
el_system_lookup<-descr[c(2:6),]
#rename columns
colnames(el_system_lookup)<-c('el_system','el_system_desc')
#review results
el_system_lookup
```

```{r}
# insert el_system_lookup data
dbWriteTable(re_conn, "el_system_lookup", el_system_lookup, row.names=FALSE, append=TRUE)
```

```{r}
#before each next table dataset we clear original descr from the data that was used for previous datasets or unnecessary rows
descr<-descr[-c(1:25),]
head(descr,n=20)
```

```{r}
# data for functionality_lookup
functionality_lookup<-descr[c(2:9),]
#rename columns
colnames(functionality_lookup)<-c('functionality','functionality_desc')
#review results
functionality_lookup
```

```{r}
# insert functionality_lookup data
dbWriteTable(re_conn, "functionality_lookup", functionality_lookup, row.names=FALSE, append=TRUE)
```

```{r}
#before each next table dataset we clear original descr from the data that was used for previous datasets or unnecessary rows
descr<-descr[-c(1:19),]
head(descr,n=20)
```

```{r}
# data for garage_type_lookup
garage_type_lookup<-descr[c(3:9),]
#rename columns
colnames(garage_type_lookup)<-c('garage_type','garage_type_desc')
#we change last lines data to avoid confusion
garage_type_lookup[7,1]<-"NG"
#review results
garage_type_lookup
```

```{r}
# insert garage_type_lookup data
dbWriteTable(re_conn, "garage_type_lookup", garage_type_lookup, row.names=FALSE, append=TRUE)
```

```{r}
#before each next table dataset we clear original descr from the data that was used for previous datasets or unnecessary rows
descr<-descr[-c(1:12),]
head(descr,n=20)
```

```{r}
# data for garage_int_finish_lookup
garage_int_finish_lookup<-descr[c(2:5),]
#rename columns
colnames(garage_int_finish_lookup)<-c('finish_type','finish_type_desc')
#we change last lines data to avoid confusion
garage_int_finish_lookup[4,1]<-"NG"
#review results
garage_int_finish_lookup
```

```{r}
# insert garage_int_finish_lookup data
dbWriteTable(re_conn, "garage_int_finish_lookup", garage_int_finish_lookup, row.names=FALSE, append=TRUE)
```

```{r}
#before each next table dataset we clear original descr from the data that was used for previous datasets or unnecessary rows
descr<-descr[-c(1:24),]
head(descr,n=20)
```

```{r}
# data for drvway_pave_lookup
drvway_pave_lookup<-descr[c(2:4),]
#rename columns
colnames(drvway_pave_lookup)<-c('drvway_pave','drvway_pave_desc')
#review results
drvway_pave_lookup
```

```{r}
# insert drvway_pave_lookup data
dbWriteTable(re_conn, "drvway_pave_lookup", drvway_pave_lookup, row.names=FALSE, append=TRUE)
```

```{r}
#before each next table dataset we clear original descr from the data that was used for previous datasets or unnecessary rows
descr<-descr[-c(1:19),]
head(descr,n=20)
```

```{r}
# data for fence_lookup
fence_lookup<-descr[c(3:7),]
#rename columns
colnames(fence_lookup)<-c('fence','fence_desc')
#we change last lines data to avoid confusion
fence_lookup[5,1]<-"NF"
#review results
fence_lookup
```

```{r}
# insert fence_lookup data
dbWriteTable(re_conn, "fence_lookup", fence_lookup, row.names=FALSE, append=TRUE)
```

```{r}
#before each next table dataset we clear original descr from the data that was used for previous datasets or unnecessary rows
descr<-descr[-c(1:8),]
head(descr,n=20)
```

```{r}
# data for feature_lookup
feature_lookup<-descr[c(3:8),]
#rename columns
colnames(feature_lookup)<-c('feat_type','feat_type_desc')
#we change last lines data to avoid confusion
feature_lookup[6,1]<-"None"
#review results
feature_lookup
```

```{r}
# insert feature_lookup data
dbWriteTable(re_conn, "feature_lookup", feature_lookup, row.names=FALSE, append=TRUE)
```

```{r}
#before each next table dataset we clear original descr from the data that was used for previous datasets or unnecessary rows
descr<-descr[-c(1:12),]
head(descr,n=20)
```

```{r}
# data for sale_type_lookup
sale_type_lookup<-descr[c(3:12),]
#rename columns
colnames(sale_type_lookup)<-c('sale_type','sale_type_desc')
#review results
sale_type_lookup
```

```{r}
# insert sale_type_lookup data
dbWriteTable(re_conn, "sale_type_lookup", sale_type_lookup, row.names=FALSE, append=TRUE)
```

```{r}
#before each next table dataset we clear original descr from the data that was used for previous datasets or unnecessary rows
descr<-descr[-c(1:13),]
head(descr,n=20)
```

```{r}
# data for sale_cond_lookup
sale_cond_lookup<-descr[2:7,]
#rename columns
colnames(sale_cond_lookup)<-c('sale_cond','sale_cond_desc')
#review results
sale_cond_lookup
```

```{r}
# insert sale_cond_lookup data
dbWriteTable(re_conn, "sale_cond_lookup", sale_cond_lookup, row.names=FALSE, append=TRUE)
```

```{r}
#import main data
data<-read.csv('train_1.csv',stringsAsFactor = FALSE,strip.white = TRUE)
```

```{r}
#inspect data
str(data)
head(data)
```

```{r}
#dataset for units relation
units<-data[,c(1:13,16:23,28:30,42:43,46:47,52,56,67,74)]
str(units)
head(units)
```

```{r}
#rename columns to real_estate database units schema
col_names<-c('unit_id','subclass_no','zoning_code','lot_front_length','lot_sqft','str_type','alley_type',
             'lot_shape','land_cont','utilities','lot_conf','land_slope','neighborhood','build_type',
             'house_style','overall_qual','overall_cond','year_built','year_remod','roof_style','roof_mat',
             'exter_qual','exter_cond','found_type','central_air','el_system','low_qual_sqft',
             'abovegr_live_sqft','beds_abovegr','functionality','wooddeck_sqft','fence')
colnames(units)<-col_names
head(units)
```

```{r}
#we check columns with NAs for units
colnames(units)[colSums(is.na(units)) > 0]
```
```{r}
#for alley_type and fence we change values to align with the data dictionary
units$alley_type[is.na(units$alley_type)]<-'None'
units$fence[is.na(units$fence)]<-'NF'
```

```{r}
# we alter constraints for lot_front_length and el_system and remove not null since information is missing
dbSendQuery(re_conn, "ALTER TABLE units ALTER COLUMN lot_front_length DROP NOT NULL")
dbSendQuery(re_conn, "ALTER TABLE units ALTER COLUMN el_system DROP NOT NULL")
```

```{r}
#we change central_air to boolean type (N=0/Y=1 as integer datatype)
str(units$central_air)
unique(units$central_air)
```
```{r}
units$central_air[units$central_air=='Y']<-1
units$central_air[units$central_air=='N']<-0
units$central_air<-as.integer(units$central_air)
```

```{r}
#attempts to upload data returned data inconsistancy for column zoning_code, lets review and fix
unique(units$zoning_code)
```
```{r}
#we change "C (all)" to "C" to align with dictionary
units$zoning_code[units$zoning_code=='C (all)']<-'C'
```

```{r}
# we alter constraints for year_built since there are records before 1900 (to 1800)
dbSendQuery(re_conn, "ALTER TABLE units DROP CONSTRAINT units_year_built_check")
```
```{r}
dbSendQuery(re_conn, "ALTER TABLE units ADD CONSTRAINT year_check CHECK (year_built BETWEEN 1800 AND 9999)")
```

```{r}
#attempts to upload data returned data inconsistancy for column build_type_lookup, lets review and fix
unique(units$build_type)
```
```{r}
#we change "2fmCon" to "2FmCon"; "Duplex" to "Duplx"; "Twnhs" to "TwnhsE" to align with dictionary
units$build_type[units$build_type=='2fmCon']<-'2FmCon'
units$build_type[units$build_type=='Duplex']<-'Duplx'
units$build_type[units$build_type=='Twnhs']<-'TwnhsE'
```

```{r}
#attempts to upload data returned data inconsistancy for column neighborhood, lets review and fix
unique(units$neighborhood)
```
```{r}
#we change "NAmes" to "Names"to align with dictionary
units$neighborhood[units$neighborhood=='NAmes']<-'Names'
```

```{r}
# insert units data
dbWriteTable(re_conn, "units", units, row.names=FALSE, append=TRUE)
```

```{r}
#basements initial data
base_init<-data[,c(1,31:39)]
str(base_init)
head(base_init)
```

```{r}
#rename columns to real_estate database basements/basement_finish/basement_unit schema
base_names<-c('unit_id','basemt_qual','basemt_cond','basemt_exp','1','sqft_temp1','2','sqft_temp2','sqft_temp3',
             'basemt_sqft')
colnames(base_init)<-base_names
head(base_init)
```

```{r}
#inroduce basement_id
base_init$basemt_id<-c(1:nrow(base_init))
base_init<-base_init[,c(1,11,2:10)]
head(base_init)
```

```{r}
#data for basements table
basements<-base_init%>%group_by(basemt_id)%>%select(basemt_id,basemt_qual,basemt_cond,basemt_exp,basemt_sqft)
head(basements)
dim(basements)
```

```{r}
#we check columns with NAs for basements
colnames(basements)[colSums(is.na(basements)) > 0]
```

```{r}
#lets explore basemt_exp
unique(basements$basemt_exp)
```
```{r}
#we change "No" to "NE"; "NA" to "NB" to align with dictionary
basements$basemt_exp[basements$basemt_exp=='No']<-'NE'
basements$basemt_exp[is.na(basements$basemt_exp)]<-'NB'
```

```{r}
#we drop NOT NULL constrainst for basemt_qual, basemt_cond since data is missing
dbSendQuery(re_conn, "ALTER TABLE basements ALTER COLUMN basemt_qual DROP NOT NULL")
dbSendQuery(re_conn, "ALTER TABLE basements ALTER COLUMN basemt_cond DROP NOT NULL")
```

```{r}
# insert basements data
dbWriteTable(re_conn, "basements", basements, row.names=FALSE, append=TRUE)
```

```{r}
#data for basemt_unit table
basemt_unit<-base_init%>%group_by(unit_id,basemt_id)%>%select(unit_id,basemt_id)
head(basemt_unit)
dim(basemt_unit)
```

```{r}
# insert basemt_unit data
dbWriteTable(re_conn, "basemt_unit", basemt_unit, row.names=FALSE, append=TRUE)
```

```{r}
#data for basemt_finish table
basemt_finish<-base_init%>%group_by(basemt_id)%>%select(basemt_id,'1',sqft_temp1,'2',sqft_temp2,sqft_temp3)
head(basemt_finish)
dim(basemt_finish)
```

```{r}
#sqft_temp3 is for unfinished area of the business so we add column 3 which will have only one value 'Unf'
basemt_finish$'3'<-'Unf'
head(basemt_finish)
```

```{r}
#in order to transpose 6 tables into 3 (1 & sqft1, 2 & sqft2, 3 & sqft3) we first unite them with the "_"separator
basemt_finish<-basemt_finish%>%unite(set1,'1','sqft_temp1',sep='_',remove=TRUE)%>%
  unite(set2,'2','sqft_temp2',sep='_',remove=TRUE)%>%unite(set3,'3','sqft_temp3',sep='_',remove=TRUE)
head(basemt_finish)
```

```{r}
#transpose basemt_finish
basemt_finish<-basemt_finish%>%gather(basemt_finish_no,temp, set1:set3)
head(basemt_finish)
```

```{r}
#we separate temp into basemt_finish_type & basemt_finish_sqft
basemt_finish<-basemt_finish%>%separate(temp,c('basemt_finish_type','basemt_finish_sqft'),sep='_',remove=TRUE)
head(basemt_finish)
```

```{r}
#we convert each set to number and convert character columns into integers
basemt_finish$basemt_finish_no[basemt_finish$basemt_finish_no=='set1']<-1
basemt_finish$basemt_finish_no[basemt_finish$basemt_finish_no=='set2']<-2
basemt_finish$basemt_finish_no[basemt_finish$basemt_finish_no=='set3']<-3
basemt_finish$basemt_finish_no<-as.integer(basemt_finish$basemt_finish_no)
basemt_finish$basemt_finish_sqft<-as.integer(basemt_finish$basemt_finish_sqft)
head(basemt_finish)
```
```{r}
#we remove all rows that have 0 sqft (treat them as Null)
basemt_finish<-basemt_finish[basemt_finish$basemt_finish_sqft!=0,]
head(basemt_finish)
dim(basemt_finish)
```

```{r}
#lets change "NA" value to "NB" to align with the dictionary
basemt_finish$basemt_finish_type[basemt_finish$basemt_finish_type=="NA"]<-"NB"
```

```{r}
# insert basemt_finish data
dbWriteTable(re_conn, "basemt_finish", basemt_finish, row.names=FALSE, append=TRUE)
```

```{r}
#data for bathrooms table and change column names for transposing
bathrooms<-data[,c(1,48:51)]
colnames(bathrooms)<-c("unit_id","bm_full","bm_half","ag_full","ag_half")
head(bathrooms)
dim(bathrooms)
```

```{r}
#transpose bathrooms
bathrooms<-bathrooms%>%gather(bathrm_loc,bathrm_quant, bm_full:ag_half)
head(bathrooms)
```

```{r}
#we separate temp into bathrm_loc into location and type
bathrooms<-bathrooms%>%separate(bathrm_loc,c('bathrm_loc','bathrm_type'),sep='_',remove=TRUE)
head(bathrooms)
```

```{r}
#we remove all rows that have 0 bathrm_quant (treat them as Null)
bathrooms<-bathrooms[bathrooms$bathrm_quant!=0,]
head(bathrooms)
dim(bathrooms)
```

```{r}
#we create data for bath_location_lookup table
bath_location_lookup<-data.frame(bath_location=c("bm","ag"),bath_location_desc=c("basement","aboveground"))
bath_location_lookup
```

```{r}
# insert bath_location_lookup data
dbWriteTable(re_conn, "bath_location_lookup", bath_location_lookup, row.names=FALSE, append=TRUE)
```

```{r}
# insert bathrooms data
dbWriteTable(re_conn, "bathrooms", bathrooms, row.names=FALSE, append=TRUE)
```

```{r}
#data for ext_cover table and change column names for transposing
ext_cover<-data[,c(1,24:25)]
colnames(ext_cover)<-c("unit_id","1","2")
head(ext_cover)
dim(ext_cover)
```

```{r}
#transpose ext_cover
ext_cover<-ext_cover%>%gather(ext_cover_no,ext_cover, "1":"2")
head(ext_cover)
```

```{r}
#change data type for ext_cover_no to integer
ext_cover$ext_cover_no<-as.integer(ext_cover$ext_cover_no)
head(ext_cover)
```

```{r}
#review ext_cover values for compliance with dictionary
unique(ext_cover$ext_cover)
```

```{r}
#we change "Wd Shng" to "WdShing";"CmentBd" to "CemntBd";"Brk Cmn" to "BrkComm" to comply with dictionary
ext_cover$ext_cover[ext_cover$ext_cover=="Wd Shng"]<-"WdShing"
ext_cover$ext_cover[ext_cover$ext_cover=="CmentBd"]<-"CemntBd"
ext_cover$ext_cover[ext_cover$ext_cover=="Brk Cmn"]<-"BrkComm"
```


```{r}
# insert ext_cover data
dbWriteTable(re_conn, "ext_cover", ext_cover, row.names=FALSE, append=TRUE)
```

```{r}
#data for feat_value table
feat_value<-data[,c(1,75:76)]
colnames(feat_value)<-c("unit_id","feat_type","feat_value")
head(feat_value)
dim(feat_value)
```

```{r}
#we remove all rows that have 0 value (treat them as Null)
feat_value<-feat_value[feat_value$feat_value!=0,]
sum(is.na(feat_value))
```

```{r}
# insert feat_value data
dbWriteTable(re_conn, "feat_value", feat_value, row.names=FALSE, append=TRUE)
```

```{r}
#garage initial data
garage_init<-data[,c(1,59:66)]
str(garage_init)
head(garage_init)
```

```{r}
#rename columns to real_estate database garage schema
garage_names<-c('unit_id','garage_type','garage_year_built','garage_finish_type','garage_cap','garage_sqft',
              'garage_qual','garage_cond','drvway_pave')
colnames(garage_init)<-garage_names
head(garage_init)
```

```{r}
#check columns with NAs
colnames(garage_init)[colSums(is.na(garage_init)) > 0]
```

```{r}
#we drop NAs for garage_type as there is no garage there
garage_init<-garage_init[!is.na(garage_init$garage_type),]
dim(garage_init)
```

```{r}
#inroduce garage_id
garage_init$garage_id<-c(1:nrow(garage_init))
garage_init<-garage_init[,c(1,10,2:9)]
head(garage_init)
```

```{r}
#data for garage table
garage<-garage_init%>%group_by(garage_id)%>%
  select(garage_id,garage_type,garage_year_built,garage_finish_type,garage_cap,garage_sqft,
         garage_qual,garage_cond,drvway_pave)
head(garage)
dim(garage)
```

```{r}
#check columns with NAs
colnames(garage)[colSums(is.na(garage)) > 0]
```

```{r}
#data for garage_unit table
garage_unit<-garage_init%>%group_by(unit_id,garage_id)%>%select(garage_id,unit_id)
head(garage_unit)
dim(garage_unit)
```

```{r}
# insert garage data
dbWriteTable(re_conn, "garage", garage, row.names=FALSE, append=TRUE)
```

```{r}
# insert garage_unit data
dbWriteTable(re_conn, "garage_unit", garage_unit, row.names=FALSE, append=TRUE)
```

```{r}
#sales initial data
sales_init<-data[,c(1,77:81)]
str(sales_init)
head(sales_init)
```

```{r}
#rename columns to real_estate database sales schema
sales_names<-c('unit_id', 'month_sold','year_sold','sale_type','sale_cond','sale_price')
colnames(sales_init)<-sales_names
head(sales_init)
```

```{r}
#inroduce sales_id
sales_init$sale_id<-c(1:nrow(sales_init))
sales_init<-sales_init[,c(1,7,2:6)]
head(sales_init)
```

```{r}
#data for sales table
sales<-sales_init%>%group_by(sale_id)%>%select(sale_id,month_sold,year_sold,sale_type,sale_cond,sale_price)
head(sales)
dim(sales)
```

```{r}
#data for sales_unit table
sale_unit<-sales_init%>%group_by(unit_id,sale_id)%>%select(sale_id,unit_id)
head(sale_unit)
dim(sale_unit)
```

```{r}
# insert sales data
dbWriteTable(re_conn, "sales", sales, row.names=FALSE, append=TRUE)
```

```{r}
# insert sale_unit data
dbWriteTable(re_conn, "sale_unit", sale_unit, row.names=FALSE, append=TRUE)
```

```{r}
#data for fireplace table
fireplace<-data[,c(1,57:58)]
colnames(fireplace)<-c("unit_id","firepl_count","firepl_qual")
head(fireplace)
dim(fireplace)
```

```{r}
#we drop 0 firepl_count
fireplace<-fireplace[fireplace$firepl_count!=0,]
sum(is.na(fireplace))
dim(fireplace)
```

```{r}
# insert fireplace data
dbWriteTable(re_conn, "fireplace", fireplace, row.names=FALSE, append=TRUE)
```

```{r}
#data for floor_area table and change column names for transposing
floor_area<-data[,c(1,44:45)]
colnames(floor_area)<-c("unit_id","1","2")
head(floor_area)
dim(floor_area)
```

```{r}
#transpose floor_area
floor_area<-floor_area%>%gather(floor_no,floor_sqft, "1":"2")
head(floor_area)
```

```{r}
#change data type for ext_cover_no to integer
floor_area$floor_no<-as.integer(floor_area$floor_no)
head(floor_area)
```

```{r}
# insert floor_area data
dbWriteTable(re_conn, "floor_area", floor_area, row.names=FALSE, append=TRUE)
```

```{r}
#data for heat_qual table
heat_qual<-data[,c(1,40:41)]
colnames(heat_qual)<-c("unit_id","heat_type","heat_qual")
head(heat_qual)
dim(heat_qual)
```

```{r}
#check columns with NAs
colnames(heat_qual)[colSums(is.na(heat_qual)) > 0]
```

```{r}
# insert heat_qual data
dbWriteTable(re_conn, "heat_qual", heat_qual, row.names=FALSE, append=TRUE)
```

```{r}
#data for kitchen table
kitchen<-data[,c(1,53:54)]
colnames(kitchen)<-c("unit_id","kitchen_count","kitchen_qual")
head(kitchen)
dim(kitchen)
```

```{r}
#check columns with NAs
colnames(kitchen)[colSums(is.na(kitchen)) > 0]
```

```{r}
# insert kitchen data
dbWriteTable(re_conn, "kitchen", kitchen, row.names=FALSE, append=TRUE)
```

```{r}
#data for masonry table
masonry<-data[,c(1,26:27)]
colnames(masonry)<-c("unit_id","mason_type","mason_sqft")
head(masonry)
dim(masonry)
```

```{r}
#check columns with NAs
colnames(masonry)[colSums(is.na(masonry)) > 0]
```

```{r}
#we drop NAs and 0 mason_sqft
masonry<-masonry[!is.na(masonry$mason_type),]
masonry<-masonry[masonry$mason_sqft!=0,]
head(masonry)
dim(masonry)
```

```{r}
# insert masonry data
dbWriteTable(re_conn, "masonry", masonry, row.names=FALSE, append=TRUE)
```

```{r}
#pools initial data
pools_init<-data[,c(1,73,72)]
colnames(pools_init)<-c("unit_id","pool_qual","pool_sqft")
str(pools_init)
head(pools_init)
```

```{r}
#we drop 0 pools and check NAs
pools_init<-pools_init[pools_init$pool_sqft!=0,]
colnames(pools_init)[colSums(is.na(pools_init)) > 0]
head(pools_init)
dim(pools_init)
```

```{r}
#inroduce pool_id
pools_init$pool_id<-c(1:nrow(pools_init))
pools_init<-pools_init[,c(1,4,2:3)]
head(pools_init)
```

```{r}
#data for pools table
pools<-pools_init%>%group_by(pool_id)%>%select(pool_id,pool_qual,pool_sqft)
head(pools)
dim(pools)
```

```{r}
#data for pool_unit table
pool_unit<-pools_init%>%group_by(pool_id,unit_id)%>%select(pool_id,unit_id)
head(pool_unit)
dim(pool_unit)
```

```{r}
# insert pools data
dbWriteTable(re_conn, "pools", pools, row.names=FALSE, append=TRUE)
```

```{r}
# insert pool_unit data
dbWriteTable(re_conn, "pool_unit", pool_unit, row.names=FALSE, append=TRUE)
```

```{r}
#data for porch table and change column names for transposing
porch<-data[,c(1,68:71)]
colnames(porch)<-c("unit_id","op","ep","3p","sp")
head(porch)
dim(porch)
```

```{r}
#transpose porch
porch<-porch%>%gather(porch_type,porch_sqft, op:sp)
head(porch)
```

```{r}
#we drop 0 pools and check NAs
porch<-porch[porch$porch_sqft!=0,]
head(porch)
dim(porch)
```

```{r}
#we create data for porch_type_lookup table
porch_type_lookup<-data.frame(porch_type=c("op","ep","3p","sp"),
                              porch_type_desc=c("open porch","enclosed porch","3 season porch","screen porch"))
porch_type_lookup
```

```{r}
# insert porch_type_lookup data
dbWriteTable(re_conn, "porch_type_lookup", porch_type_lookup, row.names=FALSE, append=TRUE)
```

```{r}
# insert porch data
dbWriteTable(re_conn, "porch", porch, row.names=FALSE, append=TRUE)
```

```{r}
#data for str_condition table and change column names for transposing
str_condition<-data[,c(1,14:15)]
colnames(str_condition)<-c("unit_id","1","2")
head(str_condition)
dim(str_condition)
```

```{r}
#transpose str_condition
str_condition<-str_condition%>%gather(cond_no,cond_type, "1":"2")
head(str_condition)
```

```{r}
#change datatype to align with str_condition design
str_condition$cond_no<-as.integer(str_condition$cond_no)
head(str_condition)
```

```{r}
# insert str_condition data
dbWriteTable(re_conn, "str_condition", str_condition, row.names=FALSE, append=TRUE)
```

```{r}
#data insertion complete
```




















