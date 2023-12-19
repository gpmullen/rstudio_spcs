
--drop SERVICE tidyverse;
CREATE SERVICE tidyverse
   IN COMPUTE POOL gmullen_pool
   FROM SPECIFICATION $$
   spec:
      container:
      - name: tidyverse
        image: sfsenorthamerica-va-demo103.registry.snowflakecomputing.com/gmullen_db/public/gmullen_img_repo/tidyverse:v2
        env:
          DISABLE_AUTH: true
      endpoint:
      - name: e1
        port: 8787
        public: true
   $$;
   --grant roles to use the service
grant usage on service gmullen_db.public.tidyverse to role gmullen_rl;

--use the next to commands to grab the endpoint for the R Interface. It will take a minute to load...
   desc service gmullen_db.public.tidyverse;
   select try_parse_json("public_endpoints"):e1::string endpoint from table(result_scan(last_query_id()));

   --if you have problems, check the service status to make sure it's running
   select system$get_service_status('tidyverse');
   --if you need to troubleshoot check the last 50 lines from the docker instance and assess
SELECT SYSTEM$GET_SERVICE_LOGS('gmullen_db.public.tidyverse', 0, 'tidyverse', 50);
