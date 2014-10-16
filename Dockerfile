#
# readthedocs.org - webapp
#

FROM    ubuntu:14.04
MAINTAINER  dnephin@gmail.com

RUN     apt-get update && apt-get install -y \
            python-dev \
            python-pip \
            python-virtualenv \
            git \
            build-essential \
            libxml2-dev \
            libxslt1-dev \
            zlib1g-dev \
            libpq-dev

ADD     deploy_requirements.txt /rtd/deploy_requirements.txt
ADD     pip_requirements.txt    /rtd/pip_requirements.txt
ADD     deploy  /rtd/deploy
WORKDIR /rtd
RUN     virtualenv venv && venv/bin/pip install \
            -r deploy_requirements.txt \
            --find-links /rtd/deploy/wheels

ADD     .   /rtd
