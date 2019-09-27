FROM rocker/shiny
MAINTAINER Kevin Wang (kevin.wang@sydney.edu.au)

ADD install.R /home/
# Running install
RUN R -f /home/install.R
RUN sudo apt-get update
RUN sudo apt-get install htop

## assume shiny app is in build folder /shiny
COPY ./shiny/ /srv/shiny-server/myapp/