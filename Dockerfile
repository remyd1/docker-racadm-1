FROM quay.io/centos/centos:stream9 

RUN dnf update && \
  dnf install wget perl git dmidecode openssl openssl-devel \
  python3-pip python3-setuptools sudo ipmitool -yqq

WORKDIR /tmp
RUN wget http://linux.dell.com/repo/hardware/latest/bootstrap.cgi 
RUN bash /tmp/bootstrap.cgi 
RUN dnf -yqq install srvadmin-idrac

# useful racadm tools

RUN git clone https://opendev.org/openstack/python-dracclient.git
RUN cd python-dracclient && \
  python3 -m pip install -r requirements.txt && \
  python3 setup.py install

RUN git clone https://github.com/remyd1/racadm_init.git /opt/racadm_init

RUN dnf clean all

RUN ln -s /opt/dell/srvadmin/sbin/racadm /usr/bin/racadm
RUN ln -s /opt/racadm_init/racadm_init.sh /usr/bin/racadm_init

#COPY entrypoint.sh /

#ENTRYPOINT ["/entrypoint.sh"]