from httpd:2.4.29


RUN apt-get update
RUN apt-get install -y python
RUN apt-get install -y pandoc
RUN apt-get install -y sqlite

RUN rm -r /usr/local/apache2/cgi-bin
COPY www /usr/local/apache2/cgi-bin
RUN chmod -R 777 /usr/local/apache2/cgi-bin
COPY httpd.conf /usr/local/apache2/conf/httpd.conf
