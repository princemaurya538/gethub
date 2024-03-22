FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && \
    apt-get install -y openssh-server python3 python3-pip nano

RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN useradd -m -s /bin/bash bilbo
RUN echo "bilbo:gandusaala" | chpasswd

EXPOSE 22

# Copy files and install dependencies
WORKDIR /
COPY . .
RUN pip3 install --no-cache-dir -r requirements.txt

# Start SSH server and run your script
CMD service ssh start && bash start.sh
