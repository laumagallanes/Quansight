FROM nginx
COPY nginx.conf /etc/nginx/nginx.conf
#meter certificados como volumen


 COPY ./files/localhost.crt /etc/nginx/ssl/localhost.crt
 COPY ./files/localhost.key /etc/nginx/ssl/localhost.key 
 EXPOSE 80 
 EXPOSE 443
 CMD ["nginx", "-g", "daemon off;"]
