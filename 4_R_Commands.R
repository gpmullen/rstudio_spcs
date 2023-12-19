library(DBI)
library(odbc) # Connect to ODBC
library(dplyr) # Dplyr for data manipulation
library(dbplyr) # dbplyr for connection to database

 con <- dbConnect(odbc::odbc(), Driver="SnowflakeDSIIDriver",
  Server = "sfsenorthamerica-va_demo103.snowflakecomputing.com", 
  UID = "gmullen", PWD = rstudioapi::askForPassword("Database password:"),
   Database = "gmullen_db", Warehouse = "gmullen_vwh", Schema = "public")