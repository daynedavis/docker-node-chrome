FROM centos:7

RUN yum -y update; yum clean all \
    && yum -y install gcc-c++ make \
    && curl --silent --location https://rpm.nodesource.com/setup_8.x | bash - \
    && yum -y install nodejs

COPY google-chrome.repo /etc/yum.repos.d/

RUN yum -y update; yum clean all \
    && yum -y install google-chrome-stable \
    && yum -y install mesa-libOSMesa-devel gnu-free-sans-fonts \
    && ln -s /usr/lib64/libOSMesa.so.8 /opt/google/chrome/libosmesa.so

CMD ["/bin/bash"]