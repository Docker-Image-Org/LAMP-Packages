FROM ubuntu:latest
RUN apt-get update
RUN echo "y" | apt-get install wget
RUN echo "y" | apt-get install tree
RUN wget --version
RUN cd /usr/bin/ && mkdir php5.4
WORKDIR /usr/bin/php5.4/
ADD http://mirrors.sohu.com/php/php-5.4.22.tar.gz .
RUN echo "y" | apt-get install make gcc g++ curl libxml2 libssl-dev libcurl4-openssl-dev libjpeg-dev bzip2 libbz2-dev libxpm-dev libfreetype6-dev libedit-dev libxslt-dev 
RUN echo "y" | apt install apache2
RUN tree ./
RUN tar -xzvf ./php-5.4.22.tar.gz
WORKDIR /usr/bin/php5.4/php-5.4.22
RUN ./configure
RUN make
RUN make install
RUN php -v
RUN service httpd start
EXPOSE 80
EXPOSE 9000
