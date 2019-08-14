--LIBRARIES/LOOKUPS/DEFINITIONS
--we first create tables for code definitions and their lookup

--condition type lookup/library
CREATE TABLE street_cond_lookup(
cond_type 		varchar(6) not null,
cond_desc 		varchar(55) not null,
PRIMARY KEY (cond_type));

--exterior covering lookup/library
CREATE TABLE exterior_cover_lookup(
ext_cover 		varchar(7) not null,
ext_cover_desc 	varchar(20) not null,
PRIMARY KEY (ext_cover));

--basement exposure lookup/library
CREATE TABLE basemt_exp_lookup(
basemt_exp 		char(2) not null,
basemt_exp_desc	varchar(75) not null,
PRIMARY KEY (basemt_exp));

--basement finish lookup/library
CREATE TABLE basemt_finish_lookup(
basemt_finish_type 			varchar(3) not null,
basemt_finish_type_desc 	varchar(30) not null,
PRIMARY KEY (basemt_finish_type));

--bathroom location lookup/library
CREATE TABLE bath_location_lookup(
bath_location			char(2) not null,
bath_location_desc 		char(11) not null,
PRIMARY KEY (bath_location));

CREATE TABLE garage_type_lookup(
garage_type			varchar(7) not null,
garage_type_desc 	varchar(70) not null,
PRIMARY KEY (garage_type));
	
--garage interior finish lookup/library
CREATE TABLE garage_int_finish_lookup(
finish_type			varchar(3) not null,
finish_type_desc 	varchar(14) not null,
PRIMARY KEY (finish_type));

--driveway paving lookup/library
CREATE TABLE drvway_pave_lookup(
drvway_pave			char(1) not null,
drvway_pave_desc 	varchar(16) not null,
PRIMARY KEY (drvway_pave));

--porch type lookup/library
CREATE TABLE porch_type_lookup(
porch_type 		char(2) not null,
porch_type_desc varchar(20) not null,
PRIMARY KEY (porch_type));

--feature type lookup/library
CREATE TABLE feature_lookup(
feat_type 		char(4) not null,
feat_type_desc 	varchar(50) not null,
PRIMARY KEY (feat_type));

--masonry type lookup/library
CREATE TABLE mason_lookup(
mason_type 		varchar(7) not null,
mason_type_desc varchar(15) not null,
PRIMARY KEY (mason_type));

--heating type lookup/library
CREATE TABLE heat_type_lookup(
heat_type 		varchar(5) not null,
heat_type_desc 	varchar(50) not null,
PRIMARY KEY (heat_type));

--sale type lookup/library
CREATE TABLE sale_type_lookup(
sale_type		varchar(5) not null,
sale_type_desc 	varchar(50) not null,
PRIMARY KEY (sale_type));

--sale condition lookup/library
CREATE TABLE sale_cond_lookup(
sale_cond		varchar(7) not null,
sale_cond_desc 	varchar(100) not null,
PRIMARY KEY (sale_cond));

--subclass lookup/library
CREATE TABLE subclass_lookup(
subclass_no 	smallint not null,
subclass_desc	varchar(55) not null,
PRIMARY KEY (subclass_no));

--zoning lookup/library
CREATE TABLE zoning_lookup(
zoning_code 	varchar(2) not null,
zoning_desc		varchar(55) not null,
PRIMARY KEY (zoning_code));

--street type lookup/library
CREATE TABLE street_type_lookup(
str_type 		varchar(4) not null,
str_type_desc	varchar(6) not null,
PRIMARY KEY (str_type));

--alley type lookup/library
CREATE TABLE alley_type_lookup(
alley_type 		varchar(4) not null,
alley_type_desc	varchar(8) not null,
PRIMARY KEY (alley_type));

--lot shape lookup/library
CREATE TABLE lot_shape_lookup(
lot_shape 		varchar(3) not null,
lot_shape_desc	varchar(20) not null,
PRIMARY KEY (lot_shape));

--lot configuration lookup/library
CREATE TABLE lot_config_lookup(
lot_conf 		varchar(7) not null,
lot_conf_desc	varchar(35) not null,
PRIMARY KEY (lot_conf));

--land contour lookup/library
CREATE TABLE land_contour_lookup(
land_cont 		varchar(3) not null,
land_cont_desc	varchar(65) not null,
PRIMARY KEY (land_cont));

--land slope lookup/library
CREATE TABLE land_slope_lookup(
land_slope 		varchar(3) not null,
land_slope_desc	varchar(15) not null,
PRIMARY KEY (land_slope));

--utilities lookup/library
CREATE TABLE utilities_lookup(
utilities 		varchar(6) not null,
utilities_desc	varchar(55) not null,
PRIMARY KEY (utilities));

--neighborhood lookup/library
CREATE TABLE neighborhood_lookup(
neighborhood 		varchar(7) not null,
neighborhood_name	varchar(55) not null,
PRIMARY KEY (neighborhood));

--building type lookup/library
CREATE TABLE build_type_lookup(
build_type 		varchar(6) not null,
build_type_desc	varchar(65) not null,
PRIMARY KEY (build_type));

--house style lookup/library
CREATE TABLE house_style_lookup(
house_style 		varchar(6) not null,
house_style_desc	varchar(45) not null,
PRIMARY KEY (house_style));

--roof style lookup/library
CREATE TABLE roof_style_lookup(
roof_style 			varchar(7) not null,
roof_style_desc		varchar(15) not null,
PRIMARY KEY (roof_style));

--rood material lookup/library
CREATE TABLE roof_mat_lookup(
roof_mat 		varchar(7) not null,
roof_mat_desc	varchar(30) not null,
PRIMARY KEY (roof_mat));

--foundation type lookup/library
CREATE TABLE found_type_lookup(
found_type 		varchar(6) not null,
found_type_desc	varchar(15) not null,
PRIMARY KEY (found_type));

--electrical system lookup/library
CREATE TABLE el_system_lookup(
el_system 		varchar(5) not null,
el_system_desc	varchar(55) not null,
PRIMARY KEY (el_system));

--functionality lookup/library
CREATE TABLE functionality_lookup(
functionality		varchar(4) not null,
functionality_desc	varchar(25) not null,
PRIMARY KEY (functionality));

--fence lookup/library
CREATE TABLE fence_lookup(
fence		varchar(5) not null,
fence_desc	varchar(25) not null,
PRIMARY KEY (fence));

--RATINGS AND GRADINGS
--second, we create universal lookups for ratings and gradings

--grading lookup/library
CREATE TABLE grading_lookup(
grade 			char(2) not null,
grade_desc 		varchar(10) not null,
PRIMARY KEY (grade));

--rating lookup/library
CREATE TABLE rating_lookup(
rating 			smallint not null CHECK (rating BETWEEN 1 AND 10),
rating_desc		varchar(15) not null,
PRIMARY KEY (rating));

--DATA TABLES (info inputs)
--third, create tables for data registry

--units data
CREATE TABLE units(
unit_id				int not null,
subclass_no 		smallint not null,
zoning_code 		varchar(2) not null,
lot_front_length	smallint not null,
lot_sqft			bigint not null,
str_type 			varchar(4) not null,
alley_type 			varchar(4) not null,
lot_shape 			varchar(3) not null,
land_cont 			varchar(3) not null,
utilities 			varchar(6) not null,
lot_conf 			varchar(7) not null,
land_slope 			varchar(3) not null,
neighborhood 		varchar(7) not null,
build_type 			varchar(6) not null,
house_style 		varchar(6) not null,
overall_qual 		smallint not null,
overall_cond		smallint not null,
year_built			smallint not null CHECK (year_built BETWEEN 1900 AND 9999),
year_remod			smallint not null CHECK (year_remod BETWEEN 1900 AND 9999),
roof_style 			varchar(7) not null,
roof_mat 			varchar(7) not null,
exter_qual			char(2) not null,
exter_cond			char(2) not null,
found_type 			varchar(6) not null,
central_air			boolean not null,
el_system 			varchar(5) not null,
low_qual_sqft		smallint not null,
abovegr_live_sqft	smallint not null,
beds_abovegr		smallint not null,
functionality		varchar(4) not null,
wooddeck_sqft		smallint not null,
fence				varchar(5) not null,
PRIMARY KEY (unit_id),
FOREIGN KEY (subclass_no) REFERENCES subclass_lookup(subclass_no),
FOREIGN KEY (zoning_code) REFERENCES zoning_lookup(zoning_code),
FOREIGN KEY (str_type) REFERENCES street_type_lookup(str_type),
FOREIGN KEY (alley_type) REFERENCES alley_type_lookup(alley_type),
FOREIGN KEY (lot_shape) REFERENCES lot_shape_lookup(lot_shape),
FOREIGN KEY (land_cont) REFERENCES land_contour_lookup(land_cont),
FOREIGN KEY (utilities) REFERENCES utilities_lookup(utilities),
FOREIGN KEY (lot_conf) REFERENCES lot_config_lookup(lot_conf),
FOREIGN KEY (land_slope) REFERENCES land_slope_lookup(land_slope),
FOREIGN KEY (neighborhood) REFERENCES neighborhood_lookup(neighborhood),
FOREIGN KEY (build_type) REFERENCES build_type_lookup(build_type),
FOREIGN KEY (house_style) REFERENCES house_style_lookup(house_style),
FOREIGN KEY (overall_qual) REFERENCES rating_lookup(rating),
FOREIGN KEY (overall_cond) REFERENCES rating_lookup(rating),
FOREIGN KEY (roof_style) REFERENCES roof_style_lookup(roof_style),
FOREIGN KEY (roof_mat) REFERENCES roof_mat_lookup(roof_mat),
FOREIGN KEY (exter_qual) REFERENCES grading_lookup(grade),
FOREIGN KEY (exter_cond) REFERENCES grading_lookup(grade),
FOREIGN KEY (found_type) REFERENCES found_type_lookup(found_type),
FOREIGN KEY (el_system) REFERENCES el_system_lookup(el_system),
FOREIGN KEY (functionality) REFERENCES functionality_lookup(functionality),
FOREIGN KEY (fence) REFERENCES fence_lookup(fence));

--street condition data
CREATE TABLE str_condition(
unit_id 		int not null,
cond_no 		smallint not null,
cond_type 		varchar(6) not null,
PRIMARY KEY (unit_id,cond_no),
FOREIGN KEY	(cond_type) REFERENCES street_cond_lookup(cond_type),
FOREIGN KEY	(unit_id) REFERENCES units(unit_id)
ON DELETE CASCADE ON UPDATE CASCADE);

--exterior covering data
CREATE TABLE ext_cover(
unit_id 		int not null,
ext_cover_no 	smallint not null,
ext_cover 		varchar(7) not null,
PRIMARY KEY (unit_id,ext_cover_no),
FOREIGN KEY	(ext_cover) REFERENCES exterior_cover_lookup(ext_cover),
FOREIGN KEY	(unit_id) REFERENCES units(unit_id)
ON DELETE CASCADE ON UPDATE CASCADE);

--basement data
CREATE TABLE basements(
basemt_id		int not null,
basemt_qual 	char(2) not null,
basemt_cond 	char(2) not null,
basemt_exp 		char(2) not null,
basemt_sqft		smallint not null,
PRIMARY KEY (basemt_id),
FOREIGN KEY	(basemt_qual) REFERENCES grading_lookup(grade),
FOREIGN KEY	(basemt_cond) REFERENCES grading_lookup(grade),
FOREIGN KEY	(basemt_exp) REFERENCES basemt_exp_lookup(basemt_exp));

--basement finish data
CREATE TABLE basemt_finish(
basemt_id			int not null,
basemt_finish_no 	smallint not null,
basemt_finish_type 	varchar(3) not null,
basemt_finish_sqft 	smallint not null,
PRIMARY KEY (basemt_id,basemt_finish_no),
FOREIGN KEY	(basemt_id) REFERENCES basements(basemt_id)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY	(basemt_finish_type) REFERENCES basemt_finish_lookup(basemt_finish_type));

--floor sqft data
CREATE TABLE floor_area(
unit_id 		int not null,
floor_no 		smallint not null,
floor_sqft 		smallint not null,
PRIMARY KEY (unit_id,floor_no),
FOREIGN KEY	(unit_id) REFERENCES units(unit_id)
ON DELETE CASCADE ON UPDATE CASCADE);

--bathrooms data
CREATE TABLE bathrooms(
unit_id 		int not null,
bathrm_loc 		char(2) not null,
bathrm_type		char(4) not null,
bathrm_quant 	smallint not null,
PRIMARY KEY (unit_id,bathrm_loc,bathrm_type),
FOREIGN KEY	(bathrm_loc) REFERENCES bath_location_lookup(bath_location),
FOREIGN KEY	(unit_id) REFERENCES units(unit_id)
ON DELETE CASCADE ON UPDATE CASCADE);

--garage data
CREATE TABLE garage(
garage_id 			int not null,
garage_type			varchar(7) not null,
garage_year_built	smallint not null CHECK (garage_year_built BETWEEN 1900 AND 9999),
garage_finish_type	varchar(3) not null,
garage_cap			smallint not null,
garage_sqft			smallint not null,
garage_qual 		char(2) not null,
garage_cond 		char(2) not null,
drvway_pave			char(1) not null,
PRIMARY KEY (garage_id),
FOREIGN KEY	(garage_type) REFERENCES garage_type_lookup(garage_type),
FOREIGN KEY	(garage_finish_type) REFERENCES garage_int_finish_lookup(finish_type),
FOREIGN KEY	(garage_qual) REFERENCES grading_lookup(grade),
FOREIGN KEY	(garage_cond) REFERENCES grading_lookup(grade),
FOREIGN KEY	(drvway_pave) REFERENCES drvway_pave_lookup(drvway_pave));

--porch data
CREATE TABLE porch(
unit_id 		int not null,
porch_type 		char(2) not null,
porch_sqft 		smallint not null,
PRIMARY KEY (unit_id,porch_type),
FOREIGN KEY	(porch_type) REFERENCES porch_type_lookup(porch_type),
FOREIGN KEY	(unit_id) REFERENCES units(unit_id)
ON DELETE CASCADE ON UPDATE CASCADE);

--pool data
CREATE TABLE pools(
pool_id 		int not null,
pool_qual		char(2) not null,
pool_sqft 		smallint not null,
PRIMARY KEY (pool_id),
FOREIGN KEY	(pool_qual) REFERENCES grading_lookup(grade));

--feature value data
CREATE TABLE feat_value(
unit_id 		int not null,
feat_type 		char(4) not null,
feat_value 		numeric(12,2) not null,
PRIMARY KEY (unit_id,feat_type),
FOREIGN KEY	(feat_type) REFERENCES feature_lookup(feat_type),
FOREIGN KEY	(unit_id) REFERENCES units(unit_id)
ON DELETE CASCADE ON UPDATE CASCADE);

--masonry data
CREATE TABLE masonry(
unit_id 		int not null,
mason_type 		varchar(7) not null,
mason_sqft 		smallint not null,
PRIMARY KEY (unit_id),
FOREIGN KEY	(mason_type) REFERENCES mason_lookup(mason_type),
FOREIGN KEY	(unit_id) REFERENCES units(unit_id)
ON DELETE CASCADE ON UPDATE CASCADE);

--Heating quality/condition
CREATE TABLE heat_qual(
unit_id			int not null,
heat_type 		varchar(5) not null,
heat_qual	 	char(2) not null,
PRIMARY KEY (unit_id),
FOREIGN KEY	(heat_type) REFERENCES heat_type_lookup(heat_type),
FOREIGN KEY	(heat_qual) REFERENCES grading_lookup(grade),
FOREIGN KEY	(unit_id) REFERENCES units(unit_id)
ON DELETE CASCADE ON UPDATE CASCADE);

--kitchen data
CREATE TABLE kitchen(
unit_id 		int not null,
kitchen_count 	smallint not null,
kitchen_qual 	char(2) not null,
PRIMARY KEY (unit_id),
FOREIGN KEY	(unit_id) REFERENCES units(unit_id)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY	(kitchen_qual) REFERENCES grading_lookup(grade));

--fireplace data
CREATE TABLE fireplace(
unit_id 		int not null,
firepl_count 	smallint not null,
firepl_qual 	char(2) not null,
PRIMARY KEY (unit_id),
FOREIGN KEY	(unit_id) REFERENCES units(unit_id)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY	(firepl_qual) REFERENCES grading_lookup(grade));

--sale data
CREATE TABLE sales(
sale_id 		int not null,
month_sold		smallint not null CHECK (month_sold BETWEEN 1 AND 12),
year_sold		smallint not null CHECK (year_sold BETWEEN 1900 AND 9999),
sale_type		varchar(5) not null,
sale_cond		varchar(7) not null,
sale_price		numeric(12,2) not null,
PRIMARY KEY (sale_id),
FOREIGN KEY	(sale_type) REFERENCES sale_type_lookup(sale_type),
FOREIGN KEY	(sale_cond) REFERENCES sale_cond_lookup(sale_cond));

--MAPPING TABLES
--forth, create tables for data mapping

--basement to unit map
CREATE TABLE basemt_unit(
basemt_id		int not null,
unit_id		 	int not null,
PRIMARY KEY (basemt_id,unit_id),
FOREIGN KEY	(basemt_id) REFERENCES basements(basemt_id)
	ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY	(unit_id) REFERENCES units(unit_id)
	ON DELETE CASCADE ON UPDATE CASCADE);
	
--garage to unit map
CREATE TABLE garage_unit(
garage_id		int not null,
unit_id		 	int not null,
PRIMARY KEY (garage_id,unit_id),
FOREIGN KEY	(garage_id) REFERENCES garage(garage_id)
	ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY	(unit_id) REFERENCES units(unit_id)
	ON DELETE CASCADE ON UPDATE CASCADE);
	
--pool to unit map
CREATE TABLE pool_unit(
pool_id			int not null,
unit_id		 	int not null,
PRIMARY KEY (pool_id,unit_id),
FOREIGN KEY	(pool_id) REFERENCES pools(pool_id)
	ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY	(unit_id) REFERENCES units(unit_id)
	ON DELETE CASCADE ON UPDATE CASCADE);

--sale to unit map
CREATE TABLE sale_unit(
sale_id			int not null,
unit_id		 	int not null,
PRIMARY KEY (sale_id,unit_id),
FOREIGN KEY	(sale_id) REFERENCES sales(sale_id)
	ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY	(unit_id) REFERENCES units(unit_id)
	ON DELETE CASCADE ON UPDATE CASCADE);
