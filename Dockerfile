FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && \
    apt-get install -y openssh-server python3 python3-pip nano

# Set up SSH
RUN mkdir /var/run/sshd
RUN echo 'root:password' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Expose SSH port
EXPOSE 22

# Copy files and install dependencies
WORKDIR /
COPY . .
RUN pip3 install --no-cache-dir -r requirements.txt

# Start SSH server and run your script
CMD ["/bin/bash", "-c", "/etc/init.d/ssh start && bash start.sh && /bin/bash"]
