use role securityadmin;
create role gmullen_rl;
CREATE COMPUTE POOL gmullen_pool 
MIN_NODES = 1
MAX_NODES = 1
INSTANCE_FAMILY = standard_1;
grant all on compute pool gmullen_pool to role gmullen_rl;

CREATE OR REPLACE WAREHOUSE gmullen_vwh 
WITH WAREHOUSE_SIZE='X-SMALL'
AUTO_SUSPEND = 180
AUTO_RESUME = true
INITIALLY_SUSPENDED=false;
grant all on warehouse gmullen_vwh to role gmullen_rl;

CREATE DATABASE gmullen_db;
grant ownership on database gmullen_db to role gmullen_rl;

CREATE OR REPLACE IMAGE REPOSITORY gmullen_img_repo;
grant ownership on IMAGE REPOSITORY gmullen_db.public.gmullen_img_repo to role gmullen_rl;

show image repositories;