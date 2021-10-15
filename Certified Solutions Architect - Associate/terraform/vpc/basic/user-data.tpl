#!/bin/bash
export PATH=$PATH:/usr/local/bin
# install nginx from Amazon repo
amazon-linux-extras install nginx1 -y
# make sure nginx service is started
systemctl start nginx
# change the default HTML page
cat > /usr/share/nginx/html/index.html <<DOC
<html>
  <body>
    <h1>nginx is running on ${name}</h1>
  </body>
</html>
DOC