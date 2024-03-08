##Nginx.cong
The first server block listens on port 80 and redirects all HTTP requests to their HTTPS equivalent using a 301 permanent redirect.

The second server block listens on port 443 for HTTPS connections. It includes SSL certificate and key paths.

The SSL configuration specifies modern and secure protocols and ciphers to enhance security.

##cheuqearThe location / block is responsible for proxying requests to the upstream application. It also sets headers (X-Real-IP, X-Forwarded-For, and X-Forwarded-Proto) to pass additional information to the upstream application.






