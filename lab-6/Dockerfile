FROM ubuntu as intermediate
LABEL application="workshop agrument and environtment"

ARG BUILD_DATE
LABEL org.label-schema.build-date=$BUILD_DATE

ENV CUSTOM_BUILD_VERSION="1.0.0"

WORKDIR /app/
RUN cat /etc/lsb-release  > /app/server.info


FROM busybox
WORKDIR /app
COPY --from=intermediate /app/server.info /app
CMD cat /app/server.info