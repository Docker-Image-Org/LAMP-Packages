FROM ubuntu:latest
RUN apt-get update
RUN echo "y" | apt-get install wget
RUN wget --version
WORKDIR /usr/www
COPY ./php-5.4.0-src /usr/www
RUN echo "y" | apt-get install make gcc g++ curl libxml2 libxml2-dev libssl-dev libcurl4-openssl-dev libjpeg-dev libpng12-dev bzip2 libbz2-dev libxpm-dev libfreetype6-dev libedit-dev libxslt-dev 
RUN echo "y" | apt install apache2
RUN ./configure
RUN make
RUN make install
RUN php -v
EXPOSE 80
EXPOSE 9000
