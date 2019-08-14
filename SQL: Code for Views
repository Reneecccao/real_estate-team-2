--Now we create view where we combine units and sales data into 1 table and where possible we replace
--abbreviations and codes by full descriptions, which will help with reading of the dashboards

CREATE VIEW analytics_units AS
SELECT 
units.unit_id, subclass_desc,zoning_desc,lot_front_length, lot_sqft, str_type_desc,alley_type_desc,
lot_shape_desc,land_cont_desc,utilities_desc,lot_conf_desc,land_slope_desc,neighborhood_name,
build_type_desc,house_style_desc,overall_qual, overall_cond, year_built,year_remod,
roof_style_desc,roof_mat_desc,exter_qual,exter_cond,found_type_desc,central_air,el_system_desc,
low_qual_sqft,abovegr_live_sqft,beds_abovegr,functionality_desc,wooddeck_sqft,fence_desc,
month_sold, year_sold, sale_type_desc, sale_cond_desc, sale_price, ext_cover_desc as prime_exterior_cover
FROM 
units, subclass_lookup,zoning_lookup, street_type_lookup,alley_type_lookup,lot_shape_lookup,
land_contour_lookup,utilities_lookup,lot_config_lookup,land_slope_lookup,neighborhood_lookup,
build_type_lookup,house_style_lookup,roof_style_lookup,roof_mat_lookup,found_type_lookup,
el_system_lookup,functionality_lookup,fence_lookup, sale_unit, sales, sale_type_lookup, sale_cond_lookup, 
ext_cover,exterior_cover_lookup
WHERE
ext_cover.ext_cover_no=1 and
units.subclass_no=subclass_lookup.subclass_no AND units.zoning_code=zoning_lookup.zoning_code
AND units.str_type=street_type_lookup.str_type AND units.alley_type=alley_type_lookup.alley_type
AND units.lot_shape=lot_shape_lookup.lot_shape AND units.land_cont=land_contour_lookup.land_cont
AND units.utilities=utilities_lookup.utilities AND units.lot_conf=lot_config_lookup.lot_conf
AND units.land_slope=land_slope_lookup.land_slope AND 
units.neighborhood=neighborhood_lookup.neighborhood
AND units.build_type=build_type_lookup.build_type AND units.house_style=house_style_lookup.house_style
AND units.roof_style=roof_style_lookup.roof_style AND units.roof_mat=roof_mat_lookup.roof_mat
AND units.found_type=found_type_lookup.found_type AND units.el_system=el_system_lookup.el_system
AND units.functionality=functionality_lookup.functionality AND units.fence=fence_lookup.fence
AND units.unit_id=sale_unit.unit_id AND sale_unit.sale_id=sales.sale_id
AND sales.sale_type=sale_type_lookup.sale_type AND sales.sale_cond=sale_cond_lookup.sale_cond
AND units.unit_id=ext_cover.unit_id and ext_cover.ext_cover=exterior_cover_lookup.ext_cover;

--basement and sales to measure impact of basement on sale
CREATE VIEW analytics_basement AS
SELECT 
units.unit_id, basements.basemt_id, basemt_qual,basemt_cond, basemt_exp_desc,basemt_sqft,
basemt_finish_type_desc, basemt_finish_sqft,
month_sold, year_sold, sale_type_desc, sale_cond_desc, sale_price
FROM 
units, basemt_unit,basements,basemt_exp_lookup,basemt_finish,basemt_finish_lookup,
sale_unit, sales, sale_type_lookup, sale_cond_lookup
WHERE 
units.unit_id=basemt_unit.unit_id AND basemt_unit.basemt_id=basements.basemt_id AND
basements.basemt_exp=basemt_exp_lookup.basemt_exp AND basements.basemt_id=basemt_finish.basemt_id
AND basemt_finish.basemt_finish_type=basemt_finish_lookup.basemt_finish_type
AND units.unit_id=sale_unit.unit_id AND sale_unit.sale_id=sales.sale_id
AND sales.sale_type=sale_type_lookup.sale_type AND sales.sale_cond=sale_cond_lookup.sale_cond;

--bathrooms and sales to measure impact of bathrooms on sale
CREATE VIEW analytics_bathrooms AS
SELECT 
units.unit_id, bath_location_desc,bathrm_type,bathrm_quant,
month_sold, year_sold, sale_type_desc, sale_cond_desc, sale_price
FROM 
units, bathrooms, bath_location_lookup,
sale_unit, sales, sale_type_lookup, sale_cond_lookup
WHERE 
units.unit_id=bathrooms.unit_id AND bathrooms.bathrm_loc=bath_location_lookup.bath_location
AND units.unit_id=sale_unit.unit_id AND sale_unit.sale_id=sales.sale_id
AND sales.sale_type=sale_type_lookup.sale_type AND sales.sale_cond=sale_cond_lookup.sale_cond;

--garage and sales to measure impact of garage on sale
CREATE VIEW analytics_garage AS
SELECT 
units.unit_id, garage.garage_id, garage_type_desc,garage_year_built,
finish_type_desc,garage_cap,garage_sqft,garage_qual,garage_cond,drvway_pave_desc,
month_sold, year_sold, sale_type_desc, sale_cond_desc, sale_price
FROM 
units, garage_unit,garage,garage_type_lookup,garage_int_finish_lookup,drvway_pave_lookup,
sale_unit, sales, sale_type_lookup, sale_cond_lookup
WHERE 
units.unit_id=garage_unit.unit_id AND garage_unit.garage_id=garage.garage_id AND
garage.garage_type=garage_type_lookup.garage_type AND garage.garage_finish_type=garage_int_finish_lookup.finish_type
AND garage.drvway_pave=drvway_pave_lookup.drvway_pave
AND units.unit_id=sale_unit.unit_id AND sale_unit.sale_id=sales.sale_id
AND sales.sale_type=sale_type_lookup.sale_type AND sales.sale_cond=sale_cond_lookup.sale_cond;

--features and sales to measure impact of features on sale
CREATE VIEW analytics_feature AS
SELECT 
units.unit_id, feat_type_desc,feat_value,
month_sold, year_sold, sale_type_desc, sale_cond_desc, sale_price
FROM 
units, feat_value, feature_lookup,
sale_unit, sales, sale_type_lookup, sale_cond_lookup
WHERE 
units.unit_id=feat_value.unit_id AND feat_value.feat_type=feature_lookup.feat_type
AND units.unit_id=sale_unit.unit_id AND sale_unit.sale_id=sales.sale_id
AND sales.sale_type=sale_type_lookup.sale_type AND sales.sale_cond=sale_cond_lookup.sale_cond;
