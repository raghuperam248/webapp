FROM centos
MAINTAINER raghu@google.com
RUN yum update -y
RUN yum install java -y
RUN java -version
RUN yum install wget -y

WORKDIR /opt
RUN wget http://mirrors.estointernet.in/apache/tomcat/tomcat-8/v8.5.43/bin/apache-tomcat-8.5.43.tar.gz
RUN tar -xvf apache-tomcat-8.5.43.tar.gz
RUN cp -R /opt/apache-tomcat-8.5.43.tar.gz /opt/tomcat

WORKDIR /opt/tomcat/webapps
COPY target/webapp.war

EXPOSE 8080


ENTRYPOINT ["/opt/tomcat/bin/catalina.sh", "run"]

