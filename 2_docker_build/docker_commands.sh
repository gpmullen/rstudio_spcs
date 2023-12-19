#Get the following URL by running SHOW IMAGE REPOSITORIES; in snowflake
docker login SFSENORTHAMERICA.VA_DEMO103.registry.snowflakecomputing.com
docker build --platform linux/amd64 --tag sfsenorthamerica-va-demo103.registry.snowflakecomputing.com/gmullen_db/public/gmullen_img_repo/tidyverse:v2 -f dockerfiles/tidyverse_4.3.2.Dockerfile .
docker push sfsenorthamerica-va-demo103.registry.snowflakecomputing.com/gmullen_db/public/gmullen_img_repo/tidyverse:v2