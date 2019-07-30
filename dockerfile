FROM centos:latest
RUN yum -y install httpd; yum clean all; systemctl enable httpd.service
RUN cd /usr/bin/ && mkdir php5.4
WORKDIR /usr/bin/php5.4/
ADD http://mirrors.sohu.com/php/php-5.4.22.tar.gz .
RUN tar -xzvf ./php-5.4.22.tar.gz
WORKDIR /usr/bin/php5.4/php-5.4.22
RUN ./configure
RUN make
RUN make install
RUN php -v
RUN apache2 -version
CMD [ "/usr/sbin/init"]
EXPOSE 80
EXPOSE 9000
