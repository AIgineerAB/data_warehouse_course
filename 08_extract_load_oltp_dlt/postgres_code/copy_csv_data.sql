\copy amazon_products 
FROM '/Users/aigineer/Documents/preparation/data_warehouse_course_prep/lectures/08_extract_load_oltp_dlt/amazon.csv'
DELIMITER ',' CSV HEADER;
