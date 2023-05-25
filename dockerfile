# Use a base image with the desired web server pre-installed (e.g., Tomcat)
FROM tomcat:latest

# Install wget
RUN apt-get update && apt-get install -y wget
RUN rm -rf /usr/local/tomcat/webapps/*
# Download the .war file from Nexus using wget and save as ROOT.war
RUN wget -O /usr/local/tomcat/webapps/ROOT.war http://43.205.212.232:8081//repository/studentapp/com/exam/studentapp/1/studentapp-1.war

# Expose the port used by the web server (e.g., 8080)
EXPOSE 8080

# Start the web server
CMD ["catalina.sh", "run"]

