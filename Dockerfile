FROM tomcat:latest
COPY webapp.war /usr/local/tomcat/webapps/ROOT.war
RUN rm -rf /usr/local/tomcat/webapps/ROOT
EXPOSE 8001
CMD ["catalina.sh" "run"]
