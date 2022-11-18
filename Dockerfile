#Create MySQL Image for JSP Tutorial Application
FROM tomcat:8
MAINTAINER chistophe.cheret@efrei.net

#RUN mkdir /usr/local/tomcat/webapps
COPY target/spring-boot-deployment.war /usr/local/tomcat/webapps

#ADD mysqlsampledatabase.sql /docker-entrypoint-initdb.d

EXPOSE 8080
