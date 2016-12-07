#!/usr/bin/env sh
#----------------------------------------------------------------------------------
# installers/elasticsearch.sh
#
# Installs elasticsearch with useful plugins
#
# @author       Johann Zelger <j.zelger@techdivision.com>
#----------------------------------------------------------------------------------

# define elasticsearch version to install
ES_VERSION=2.4.2;

# define elasticsearch home path
ES_HOME=/usr/share/elasticsearch;

# enhance path with elasticsearch home path bin
PATH=${PATH}:${ES_HOME}/bin;

# download and extract
curl -Ls https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-${ES_VERSION}.tar.gz | tar -xz -C /usr/share;

# create symlink without version number
ln -s /usr/share/elasticsearch-${ES_VERSION} ${ES_HOME};

# install useful plugins
plugin install analysis-phonetic;
plugin install analysis-icu;

# copy configs
cp -r /tmp/etc/elasticsearch /etc;
cp /etc/elasticsearch/elasticsearch.yml ${ES_HOME}/config;

# copy supervisor config
cp /tmp/etc/supervisor.d/elasticsearch.ini /etc/supervisor.d;
