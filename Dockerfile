FROM registry.redhat.io/rhel7-atomic
RUN mkdir -p /data
RUN chmod 701 /data
RUN mkdir -p /data/USERNAME/upload
RUN microdnf --enablerepo=rhel-7-server-rpms install shadow-utils passwd ;\
    useradd sftp_users 
RUN useradd -g sftp_users -d /upload -s /sbin/nologin USERNAME
RUN echo "RedHat" |passwd USERNAME
RUN chown -R root:sftp_users /data/USERNAME
RUN chown -R USERNAME:sftp_users /data/USERNAME/upload
RUN echo "Match Group sftp_users" >> /etc/ssh/sshd_config
RUN echo "ChrootDirectory /data/%u" >> /etc/ssh/sshd_config
RUN echo "ForceCommand internal-sftp" >> /etc/ssh/sshd_config 
