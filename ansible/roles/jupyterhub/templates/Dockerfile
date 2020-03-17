FROM jupyterhub/jupyterhub:1.2

USER root

ENV DEBIAN_FRONTEND noninteractive

RUN python3 -m pip install --no-cache --upgrade setuptools pip

WORKDIR /src/jupyterhub
#pip install jupyterlab
RUN python3 -m pip install jupyterhub
#apt-get update
#apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
#apt-get install wget
RUN apt-get update \
 && apt-get install -yq --no-install-recommends  \ 
    libgl1-mesa-glx \
    libegl1-mesa \
    libxrandr2 \
    libxss1 \
    libxcursor1 \
    libxcomposite1 \
    libasound2 \
    libxi6 \
    libxtst6 \
    wget \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

#wget https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh
RUN wget https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh

#bash Anaconda3-2019.10-Linux-x86_64.sh -b -p /opt
RUN bash Anaconda3-2019.10-Linux-x86_64.sh -b -p /opt/anaconda3

#groupadd condagroup
RUN groupadd condagroup

#chgrp -R condagroup /opt/anaconda3
RUN chgrp -R condagroup /opt/anaconda3

#chmod 770 -R /opt/anaconda3
RUN chmod 770 -R /opt/anaconda3

#adduser root condagroup
RUN adduser root condagroup

#ln -s /opt/anaconda3/etc/profile.d/conda.sh /etc/profile.d/conda.sh
RUN ln -s /opt/anaconda3/etc/profile.d/conda.sh /etc/profile.d/conda.sh

#mkdir /opt/anaconda3/envs/
RUN mkdir /opt/anaconda3/envs/

#/opt/anaconda3/bin/conda create --prefix /opt/anaconda3/envs/python python=3.7 ipykernel
RUN /opt/anaconda3/bin/conda create --prefix /opt/anaconda3/envs/python python=3.7 ipykernel

#/opt/anaconda3/envs/python/bin/python -m ipykernel install --prefix=/opt/jupyterhub/ --name 'python' --display-name "Python (default)"
RUN /opt/anaconda3/envs/python/bin/python -m ipykernel install --prefix=/opt/jupyterhub/ --name 'python' --display-name "Python (default)"

#pip install jupyterhub-ldapauthenticator
RUN python3 -m pip install jupyterhub-ldapauthenticator

#mkdir -p /etc/httpd/httpscertificate
RUN mkdir -p /etc/httpd/httpscertificate

#openssl genrsa -des3 -passout pass:x -out keypair.key 2048
RUN openssl genrsa -des3 -passout pass:x -out keypair.key 2048

#openssl rsa -passin pass:x -in keypair.key -out /etc/httpd/httpscertificate/jupyterhub.rbs.com.br.key
RUN openssl rsa -passin pass:x -in keypair.key -out /etc/httpd/httpscertificate/jupyterhub.rbs.com.br.key

#openssl req -new -key /etc/httpd/httpscertificate/jupyterhub.rbs.com.br.key -out /etc/httpd/httpscertificate/jupyterhub.rbs.com.br.csr
RUN openssl req -new -key /etc/httpd/httpscertificate/jupyterhub.rbs.com.br.key -out /etc/httpd/httpscertificate/jupyterhub.rbs.com.br.csr

#openssl x509 -req -days 365 -in /etc/httpd/httpscertificate/jupyterhub.rbs.com.br.csr -signkey /etc/httpd/httpscertificate/jupyterhub.rbs.com.br.key -out /etc/httpd/httpscertificate/jupyterhub.rbs.com.br.crt
RUN openssl x509 -req -days 365 -in /etc/httpd/httpscertificate/jupyterhub.rbs.com.br.csr -signkey /etc/httpd/httpscertificate/jupyterhub.rbs.com.br.key -out /etc/httpd/httpscertificate/jupyterhub.rbs.com.br.crt


