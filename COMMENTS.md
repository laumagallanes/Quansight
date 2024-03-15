On 15/3 I spend 2 more hours to make research about how to deploy the nginx container from the main.tf and keep cheking how to make a network between both containers to finish the assignment (cause Rebecca answer me telling that the senior was going to check it so it deserve to be finnished even if the ask was to spend only 4 hors) 


What I accomplished in these days (6-7 hours of work) was configuring the Nginx server. The app/src had to be modified as a missing library (typing) caused the app not to run. After creating the app/Dockerfile, I successfully tested the application with  the correct answers of tokens and messages. The main.tf is missing deploying the Nginx container to test SSL but you can change things on the app and see them in real time, without restart. I considered it better to send what I could complete and not continue investing time without a response.




##Nginx.conf
The first server block listens on port 80 and redirects all HTTP requests to their HTTPS equivalent using a 301 permanent redirect.

The second server block listens on port 443 for HTTPS connections. It includes SSL certificate and key paths.

The SSL configuration specifies modern and secure protocols and ciphers to enhance security.

##cheuqearThe location / block is responsible for proxying requests to the upstream application. It also sets headers (X-Real-IP, X-Forwarded-For, and X-Forwarded-Proto) to pass additional information to the upstream application.






