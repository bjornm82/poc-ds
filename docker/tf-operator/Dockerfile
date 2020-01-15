FROM alpine:3.7

COPY ./bin/tf-operator.v1-linux /opt/

WORKDIR /opt/

RUN mv tf-operator.v1-linux tf-operator

CMD ["./tf-operator"]
