FROM koert/ubuntu-oracle-jdk7
MAINTAINER Koert Zeilstra <koert.zeilstra@zencode.nl>

RUN apt-get update && \
    apt-get install -y openssh-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/sshd

RUN echo 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/PermitEmptyPasswords no/PermitEmptyPasswords yes/' /etc/ssh/sshd_config

# 22 (SSH)
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]

