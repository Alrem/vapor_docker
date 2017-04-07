FROM python:2

RUN  apt-get update -qq &&  \
apt-get install -q -y \
    python-dev \
    libvirt-dev && \
apt-get clean  && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /opt/

RUN pip install -r https://raw.githubusercontent.com/openstack/fuel-plugin-contrail/master/plugin_test/vapor/requirements.txt

COPY entrypoint.sh /opt/

ENTRYPOINT ["/opt/entrypoint.sh"]
