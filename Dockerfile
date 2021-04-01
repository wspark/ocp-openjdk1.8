FROM bastion.ps.example.com:5000/redhat-openjdk-18/openjdk18-openshift:1.8-26
    
USER root
RUN mkdir -p /logs 

#ENV DISABLE_EMBEDDED_JMS_BROKER=true
RUN cp ./com/rockplace/HelloWorld.jar /deployments/ 

RUN chown 185:root /logs /deployments -R
RUN chmod 777 /logs /deployments -R

# Allow arbitrary
USER 185

#CMD ["tail -f /dev/null"]  
EXPOSE 8080
