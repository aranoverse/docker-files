FROM maven:3-amazoncorretto-8 as builder
COPY java /builder
WORKDIR /builder
RUN ["/usr/local/bin/mvn-entrypoint.sh","mvn","clean","package", "-Dmaven.test.skip=true"]

FROM openjdk:8-alpine3.9 as app
RUN echo "http://mirrors.aliyun.com/alpine/latest-stable/main/" > /etc/apk/repositories && echo "http://mirrors.aliyun.com/alpine/latest-stable/community/" >> /etc/apk/repositories
ENV TZ Asia/Shanghai
WORKDIR /app
COPY  --from=builder /builder/api/target/*.jar api.jar
EXPOSE 8080
ENTRYPOINT ["java"]
CMD ["-server"," -Xmx3g","-Xms1g","-Dlog4j2.formatMsgNoLookups=true","-Duser.timezone=GMT+8", "-jar", "/app/api.jar"]

