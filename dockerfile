FROM ubuntu:latest
RUN apt-get update
RUN echo "y" | apt-get install wget
RUN echo "y" | apt-get install tree
RUN wget --version
RUN cd /usr/bin/ && mkdir php5.4
WORKDIR /usr/bin/php5.4/
COPY php-5.4.0-src .
RUN echo "y" | apt-get install make gcc g++ curl libxml2 libssl-dev libcurl4-openssl-dev libjpeg-dev bzip2 libbz2-dev libxpm-dev libfreetype6-dev libedit-dev libxslt-dev 
RUN echo "y" | apt install apache2
RUN tree ./
RUN ./configure
RUN make
RUN make install
RUN php -v
EXPOSE 80
EXPOSE 9000
