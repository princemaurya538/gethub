FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y python3 python3-pip

WORKDIR /app

RUN apt-get install -y nano

COPY . .

RUN pip3 install --no-cache-dir -r requirements.txt

CMD ["bash", "start"]
