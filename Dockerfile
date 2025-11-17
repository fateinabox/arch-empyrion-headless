FROM archlinux:latest
LABEL org.opencontainers.image.authors = "Toetje585"
LABEL org.opencontainers.image.source = "https://github.com/wine-gameservers/arch-wine-vnc"

# additional files
##################

# add supervisor conf file
ADD build/supervisor.conf /etc/supervisor.conf
ADD build/rootfs /

# install files
##################

# add install bash script
ADD build/install.sh /root/install.sh
ADD build/gamesetup.sh /root/gamesetup.sh

# env
##################

# set environment variables for language
ENV LANG en_US.UTF-8

# install script
##################
RUN chmod +x /root/install.sh && chmod +x /usr/local/bin/xvfb.sh && /bin/bash /root/install.sh && chmod +x /root/gamesetup.sh && /bin/bash /root/gamesetup.sh

# run
##################

CMD ["/bin/bash", "/usr/local/bin/init.sh"]
