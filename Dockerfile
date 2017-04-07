FROM python:2

RUN  apt-get update -qq &&  \
apt-get install -q -y \
    python-dev \
    libvirt-dev && \
apt-get clean  && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip install -r https://github.com/openstack/fuel-plugin-contrail/blob/master/plugin_test/vapor/requirements.txt
