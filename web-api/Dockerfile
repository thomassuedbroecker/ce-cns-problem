##############################
#           BUILD
##############################
FROM adoptopenjdk/maven-openjdk11 as BUILD
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
WORKDIR /usr/src/app
RUN mvn package

##############################
#           PRODUCTION
##############################
FROM adoptopenjdk/openjdk11-openj9:ubi-minimal
ENV JAVA_OPTIONS="-Dquarkus.http.host=0.0.0.0 -Djava.util.logging.manager=org.jboss.logmanager.LogManager"
ENV AB_ENABLED=jmx_exporter

RUN mkdir /opt/shareclasses

# OpenShift permissions:
RUN chmod a+rwx -R /opt/shareclasses
RUN mkdir /opt/app
COPY --from=BUILD /usr/src/app/target/lib/* /opt/app/lib/
COPY --from=BUILD /usr/src/app/target/*-runner.jar /opt/app/app.jar

# Environment variables
COPY ./docker_entrypoint_start-quarkus.sh ./docker_entrypoint_start-quarkus.sh
RUN chmod 777 docker_entrypoint_start-quarkus.sh 
EXPOSE 8081
CMD ["/bin/sh","docker_entrypoint_start-quarkus.sh"]