FROM rocker/shiny
MAINTAINER Kevin Wang (kevin.wang@sydney.edu.au)

# install R package dependencies
RUN apt-get update && apt-get install -y \
    libssl-dev \
    ## clean up
    && apt-get clean \ 
    && rm -rf /var/lib/apt/lists/ \ 
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
    
## Install packages from CRAN
RUN install2.r --error \ 
    -r 'http://cran.rstudio.com' \
    googleAuthR \
    ## install Github packages
    ## clean up
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

ADD install.R /home/
# Running install
RUN R -f /home/install.R
RUN sudo apt-get update
RUN sudo apt-get install htop

## assume shiny app is in build folder /shiny
COPY ./shiny/ /srv/shiny-server/myapp/