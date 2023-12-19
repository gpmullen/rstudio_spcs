# rstudio_spcs
An Example of deploying R Studio via Docker into Snowpark Container Services (SPCS)

create snowflake assets first and grab the repo url.
clone https://github.com/rocker-org/rocker-versioned2/tree/master
drop the odbc.ini and the odbcinst.ini in the top folder.
run the docker commands from the top folder.
modify the Dockerfile of choice in the dockerfiles folder.
build, tag, and push the dockerfile to the Snowflake repo
Create the Service and access the public endpoint
