FROM registry.redhat.io/rhel7-atomic
RUN mkdir -p /data/USERNAME/upload
RUN groupadd sftp_users
RUN chown -R root:sftp_users /data/USERNAME
RUN chown -R USERNAME:sftp_users /data/USERNAME/upload
RUN echo "Match Group sftp_users" >> /etc/ssh/sshd_config
RUN echo "ChrootDirectory /data/%u" >> /etc/ssh/sshd_config
RUN echo "ForceCommand internal-sftp" >> /etc/ssh/sshd_config 
