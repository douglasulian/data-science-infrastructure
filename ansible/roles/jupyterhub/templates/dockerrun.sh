docker run -d -p 80:8000 -v /data/jupyterhub/srv/jupyterhub:/srv/jupyterhub -v /data/jupyterhub/home/:/home -v /data/jupyterhub/etc/jupyterhub:/etc/jupyterhub -v /data/jupyterhub/var/log:/var/log -v /data/jupyterhub/etc/httpd:/etc/httpd --name jupyterhub backup-jupyterhub-02092020

