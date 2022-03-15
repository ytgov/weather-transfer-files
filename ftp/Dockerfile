FROM stilliard/pure-ftpd

COPY ./ftp/passwd /ect/pure-ftpd/passwd
COPY ./files /home/ftpusers/

VOLUME ["/home/ftpusers", "/etc/pure-ftpd/passwd"]

COPY ./ftp/add-users-and-boot.sh /add-users-and-boot.sh
RUN chmod u+x /add-users-and-boot.sh

CMD ["/bin/bash", "-c", "/add-users-and-boot.sh"]
