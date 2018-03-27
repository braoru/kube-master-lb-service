FROM cloudtrust-baseimage:f27

ARG service_git_tag

RUN dnf install haproxy

WORKDIR /cloudtrust
RUN git clone git@github.com:cloudtrust/master-lb-service.git

WORKDIR /cloudtrust/master-lb-service
RUN git checkout ${service_git_tag} && \
    install -v -m644 -o root -g root deploy/etc/systemd/system/haproxy.service /etc/systemd/system/haproxy.service

RUN systemctl enable haproxy
