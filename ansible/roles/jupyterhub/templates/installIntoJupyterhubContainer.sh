pip install jupyterlab
apt-get update
apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
apt-get wget
wget https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh
bash Anaconda3-2019.10-Linux-x86_64.sh -b -p /opt
groupadd condagroup
chgrp -R condagroup /opt/anaconda3
chmod 770 -R /opt/anaconda3
adduser root condagroup
ln -s /opt/anaconda3/etc/profile.d/conda.sh /etc/profile.d/conda.sh
mkdir /opt/anaconda3/envs/
/opt/anaconda3/bin/conda create --prefix /opt/anaconda3/envs/python python=3.7 ipykernel
/opt/anaconda3/envs/python/bin/python -m ipykernel install --prefix=/opt/jupyterhub/ --name 'python' --display-name "Python (default)"
pip install jupyterhub-ldapauthenticator
mkdir -p /etc/httpd/httpscertificate
openssl genrsa -des3 -passout pass:x -out keypair.key 2048
openssl rsa -passin pass:x -in keypair.key -out /etc/httpd/httpscertificate/jupyterhub.rbs.com.br.key
openssl req -new -key /etc/httpd/httpscertificate/jupyterhub.rbs.com.br.key -out /etc/httpd/httpscertificate/jupyterhub.rbs.com.br.csr
openssl x509 -req -days 365 -in /etc/httpd/httpscertificate/jupyterhub.rbs.com.br.csr -signkey /etc/httpd/httpscertificate/jupyterhub.rbs.com.br.key -out /etc/httpd/httpscertificate/jupyterhub.rbs.com.br.crt


