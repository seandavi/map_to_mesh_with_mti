FROM openjdk:11
COPY . /home/mti
WORKDIR /home/mti

ENV USERNAME=""
ENV PASSWORD=""

CMD ["/bin/bash","run.sh", "GenericBatchUser"]
