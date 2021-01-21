FROM ubuntu

RUN apt-get update && apt install -y python
RUN echo 1.0 >> /etc/version && apt-get install -y git \
    && apt-get install -y iputils-ping

## WORKDIR ##
RUN mkdir /datos
WORKDIR /datos
RUN touch test1.txt

RUN mkdir /datos2
WORKDIR /datos2
RUN touch test2.txt

## WORKIDR ##
COPY index.html .
COPY app.log /datos

## ADD ##
ADD docs docs
ADD f* /datos/
ADD files.tar .

## ENV ## 
ENV dir=/datos_chingones dir1=/datos_super_chingones dir2=datos_chingoneados
RUN mkdir $dir && mkdir $dir1 && mkdir $dir2
ENV TZ=America/Chile
ENV DEBIAN_FRONTEND=noninteractive

## ARG ##
# ARG dir3
# RUN mkdir $dir3

# ARG user
# ENV user_docker $user
# ADD add_user.sh /datos
# RUN /datos/add_user.sh

# EXPOSE ##
RUN apt install -y apache2
EXPOSE 80
ADD entrypoint.sh /datos

##VOLUME##
ADD paginas /var/www/html
VOLUME ["/var/www/html"]

RUN apt-get install -y mysql-server
RUN apt-get install -y snapd

# CMD #
CMD /datos/entrypoint.sh
## ENTRYPOINT ##
# ENTRYPOINT ["/bin/bash"]
