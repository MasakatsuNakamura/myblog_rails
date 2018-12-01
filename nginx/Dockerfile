FROM nginx:1.14.1
RUN rm -f /etc/nginx/conf.d/*
ADD nginx.conf /etc/nginx/conf.d/app.conf
CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf
