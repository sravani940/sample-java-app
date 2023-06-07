FROM tomcat:latest
COPY webapp.war /opt/tomcat10/webapps/ROOT.war
RUN rm -rf /opt/tomcat10/webapps/ROOT
EXPOSE 8001
CMD ["catalina.sh" "run"]
