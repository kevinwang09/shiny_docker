FROM rocker/shiny-verse:latest
MAINTAINER Kevin Wang "kevin.wang@sydney.edu.au"

ADD docker_setup.sh /home/
RUN bash /home/docker_setup.sh 
## This deployment method makes the app at xxx.xxx.xxx.xxx/catdog/
COPY ./myapp /srv/shiny-server/myapp/
RUN sudo mkdir /home/gittmp/
RUN sudo git clone https://github.com/kevinwang09/catdog_shiny /home/gittmp/
RUN sudo git clone https://github.com/kevinwang09/covid19 /home/gittmp/

## Copy all the shiny apps to the shiny server folder
RUN sudo cp -r /home/gittmp/* /srv/shiny-server/

## This deployment method makes the xxx.xxx.xxx.xxx
## copy shiny-server config file
# COPY shiny-server.conf /etc/shiny-server/shiny-server.conf
# CMD ["/usr/bin/shiny-server.sh"]