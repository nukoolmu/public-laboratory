FROM bash
LABEL application="workshop agrument and environtment"

ARG BUILD_DATE
LABEL org.label-schema.build-date=$BUILD_DATE

ENV CUSTOM_BUILD_VERSION="1.0.0"

RUN echo "docker build date : $BUILD_DATE , custom version : $CUSTOM_BUILD_VERSION"  