FROM anapsix/alpine-java:8

RUN mkdir -p /opt/hello-world/conf
ADD build/libs/dropwizard-gradle-standalone.jar /opt/hello-world/hello.jar
ADD src/dist/config/helloworld.yml /opt/hello-world/conf/hello.yml

CMD ["java", "-jar", "/opt/hello-world/hello.jar", "server", "/opt/hello-world/conf/hello.yml"]


