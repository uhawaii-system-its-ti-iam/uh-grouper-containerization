FROM i2incommon/grouper:2.5.22 as install

FROM amazoncorretto:8

COPY --from=install /opt/grouper/grouperWebapp /opt/grouper/grouperWebapp

WORKDIR /opt/grouper/grouperWebapp/WEB-INF/bin

ENTRYPOINT ["./gsh.sh"]