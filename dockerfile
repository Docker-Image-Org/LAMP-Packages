FROM ubuntu:latest
RUN apt-get update
RUN echo "y" | apt-get install wget
RUN wget --version
WORKDIR /usr/www
COPY ./php-5.4.0-src /usr/bin
RUN echo "y" | apt-get install make gcc g++ curl libxml2 libssl-dev libcurl4-openssl-dev libjpeg-dev bzip2 libbz2-dev libxpm-dev libfreetype6-dev libedit-dev libxslt-dev 
RUN echo "y" | apt install apache2
RUN cd /usr/bin ｜ ./configure
RUN make
RUN make install
RUN php -v
EXPOSE 80
EXPOSE 9000
