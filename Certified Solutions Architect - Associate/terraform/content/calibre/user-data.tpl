#!/bin/bash
export PATH=$PATH:/usr/local/bin
# install dependencies
sudo apt update -y && \
  sudo apt install -y xdg-utils xz-utils python3 python3-pip nfs-common nginx
# create calibre user
sudo useradd -m calibre
# install calibre
sudo wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin
# install calibre-web
pip install calibreweb
# create library folder
sudo mkdir -p /library/to-add
# mount nfs to library folder
sudo mount -t nfs -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport ${nfs}:/ /library
# change library folder permissions
sudo chown -R calibre:calibre /library
sudo chmod 755 /library
# stop nginx
sudo systemctl stop nginx
# remove default nginx configuration
sudo rm /etc/nginx/sites-enabled/default
# create new nginx configuration
cat > /etc/nginx/sites-enabled/calibre <<DOC
server {
  listen 80;
  listen [::]:80;

  location / {
    proxy_bind              $server_addr;
    proxy_pass              http://127.0.0.1:8083;
    proxy_set_header        Host            $http_host;
    proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header        X-Scheme        https;
    proxy_set_header        X-Script-Name   /;  # IMPORTANT: path has NO trailing slash 
  }
}
DOC
# restart nginx
sudo systemctl start nginx
# automatically add books to calibre
cat > /etc/systemd/system/calibre <<DOC
*/5 * * * * calibre calibredb add /library/to-add -r --with-library /library && rm -r /library/to-add/*
DOC
# enable calibre-web as a service
cat > /etc/systemd/system/calibreweb.service <<DOC
[Unit]
Description=Calibre-Web

[Service]
Type=simple
User=calibre
ExecStart=cps

[Install]
WantedBy=multi-user.target
DOC
# start calibreweb
sudo systemctl start calibreweb.service