FROM rocker/shiny-verse:latest
MAINTAINER Kevin Wang "kevin.wang@sydney.edu.au"

# install ssl
RUN sudo apt-get update; exit 0
RUN sudo apt-get install -y libssl-dev

ADD install.R /home/
# Running install
RUN sudo apt-get update
RUN sudo apt-get install -y htop curl
RUN sudo curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN sudo /usr/bin/python3.5 get-pip.py
RUN sudo /usr/bin/python3.5 -m pip install --upgrade --user virtualenv
RUN R -f /home/install.R


## assume shiny app is in build folder /shiny
## This deployment method makes the app at xxx.xxx.xxx.xxx/myapp/
COPY ./myapp/ /srv/shiny-server/myapp/


## This deployment method makes the xxx.xxx.xxx.xxx
## copy shiny-server config file
COPY shiny-server.conf /etc/shiny-server/shiny-server.conf
CMD ["/usr/bin/shiny-server.sh"]