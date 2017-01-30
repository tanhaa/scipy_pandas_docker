FROM centos:7

# Set US locale (localegen on ubuntu)
RUN localedef --quiet -c -i en_US -f UTF-8 en_US.UTF-8
ENV LANGUAGE en_US
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN yum clean all && \
    yum update -y && \
    yum install -y epel-release && \
    yum install -y http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm && \
    yum install -y https://centos7.iuscommunity.org/ius-release.rpm && \
    yum groupinstall -y "Development tools" && \
    yum install -y python-pip \
    python35u python35u-libs python35u-devel python35u-pip\
    libffi-devel \
    openssl-devel \
    ncurses-devel \
    postgresql-devel \
    python-devel \
    zlib-devel \
    bzip2-devel \
    sqlite-devel \
    readline-devel \
    tk-devel \
    gdbm-devel \
    db4-devel \
    libpcap-devel \
    xz-devel \
    lapack \
    lapack-devel \
    blas \
    blas-devel \
    nodejs \
    npm \
    sox \
    cmake \
    libmad-devel \
    libsndfile-devel \
    gd-devel \
    boost-devel \
    unzip \
    wget \
    libmad-devel

RUN npm install npm -g
RUN npm install gulp -g

# Install pip for python3
#RUN curl https://bootstrap.pypa.io/get-pip.py | python3 -

# Install supervisor
RUN pip2 install supervisor
RUN mkdir /var/log/supervisor

# Setup the system for requirements installation
COPY templates/etc/supervisord.conf /etc/supervisord.conf

WORKDIR /tmp
COPY dependencies.txt /tmp/dependencies.txt
RUN pip3.5 install -r dependencies.txt

COPY dependencies.dev.txt /tmp/dependencies.dev.txt
RUN pip3.5 install -r dependencies.dev.txt



