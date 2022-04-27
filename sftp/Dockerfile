FROM atmoz/sftp:alpine

COPY ./sftp/ssh_host_* /etc/ssh/
RUN chmod 600 /etc/ssh/ssh_host_*

COPY ./sftp/users.conf /etc/sftp/users.conf

COPY ./files /home/
VOLUME ["files:/home/"]
