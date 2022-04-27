FROM atmoz/sftp:alpine

COPY ./sftp/ssh_host_* /etc/ssh/
RUN chmod 600 /etc/ssh/ssh_host_*

COPY ./sftp/users.conf /etc/sftp/users.conf

# Auto-load public key for a given user
# This requires that the top level folder match the given user name
# e.g. ./sftp/keys_by_user/group_a/.ssh/keys/id_ed25519.pub /home/group_a/.ssh/keys/id_ed25519.pub
COPY ./sftp/keys_by_user /home/
RUN chmod 755 /home/*/.ssh
RUN rm -rf /home/example_user

COPY ./files /home/
VOLUME ["files:/home/"]
