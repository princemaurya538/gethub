FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && \
    apt-get install -y openssh-server python3 python3-pip nano

RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN echo "root:gandusaala" | chpasswd

EXPOSE 22

WORKDIR /
COPY . .
RUN pip3 install --no-cache-dir -r requirements.txt

CMD service ssh start
