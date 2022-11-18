#Create MySQL Image for JSP Tutorial Application
FROM tomcat
MAINTAINER chistophe.cheret@efrei.net

RUN mkdir /usr/local/tomcat/webapps/war
COPY /var/lib/jenkins/workspace/pipe/target/spring-boot-deployment.war /usr/local/tomcat/webapps/war

#ADD mysqlsampledatabase.sql /docker-entrypoint-initdb.d

EXPOSE 8080
