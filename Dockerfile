FROM ubuntu:latest

RUN apt-get update

RUN apt-get install -y nano

CMD ["bash", "start"]
