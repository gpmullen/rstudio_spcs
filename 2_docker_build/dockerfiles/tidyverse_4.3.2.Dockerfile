FROM rocker/rstudio:4.3.2

LABEL org.opencontainers.image.licenses="GPL-2.0-or-later" \
      org.opencontainers.image.source="https://github.com/rocker-org/rocker-versioned2" \
      org.opencontainers.image.vendor="Rocker Project" \
      org.opencontainers.image.authors="Carl Boettiger <cboettig@ropensci.org>"

RUN /rocker_scripts/install_tidyverse.sh
ADD odbc.ini /etc/odbc.ini
ADD odbcinst.ini /etc/odbcinst.ini
RUN apt update
RUN apt install -y unixodbc odbcinst1debian2
RUN wget https://sfc-repo.snowflakecomputing.com/odbc/linux/3.1.4/snowflake-odbc-3.1.4.x86_64.deb
RUN dpkg -i snowflake-odbc-3.1.4.x86_64.deb
RUN R -e "install.packages(c('DBI','odbc','dplyr','dbplyr'), repos = 'https://cran.rstudio.com/')"
