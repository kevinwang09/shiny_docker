FROM rocker/shiny:latest
MAINTAINER Kevin Wang "kevin.wang@sydney.edu.au"

# install ssl
RUN sudo apt-get update; exit 0
RUN sudo apt-get install -y libssl-dev

ADD install.R /home/
# Running install
RUN R -f /home/install.R
RUN sudo apt-get update
RUN sudo apt-get install htop

## assume shiny app is in build folder /shiny
## This deployment method makes the app at xxx.xxx.xxx.xxx/myapp/
COPY ./myapp/ /srv/shiny-server/myapp/


## This deployment method makes the xxx.xxx.xxx.xxx
# copy shiny-server config file
# COPY shiny-server.conf /etc/shiny-server/shiny-server.conf
# CMD ["/usr/bin/shiny-server.sh"]