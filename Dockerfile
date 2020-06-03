FROM crudml/mcc-backend:latest

RUN apk --no-cache add \
        sqlite \
    && install-php-extensions \
        xdebug \
    && rm -rf /tmp/* /var/cache/apk/*

CMD ["supervisord","-c","/etc/supervisord.conf"]
