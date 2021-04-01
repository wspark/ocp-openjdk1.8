FROM bastion.ps.example.com:5000/redhat-openjdk-18/openjdk18-openshift:1.8-26
    
USER root
RUN mkdir -p /logs 

# java exec 
COPY run-java.sh /opt/jboss/container/java/run/run-java.sh 

COPY com/rockplace/HelloWorld.jar /deployments/ 

RUN chown 185:root /logs /deployments -R
RUN chmod 777 /logs /deployments -R

# Allow arbitrary
USER 185

CMD ["tail", "-f", "/dev/null"]  
#CMD ["java", "-jar", "HelloWorld"]  

EXPOSE 8080
