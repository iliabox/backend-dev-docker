FROM crudml/mcc-backend:latest

RUN apk --no-cache add \
        sqlite \
    && apk --no-cache add \
        pcre-dev ${PHPIZE_DEPS} \
    && pecl install \
        xdebug \
    && docker-php-ext-enable \
        xdebug \
    && docker-php-source delete \
    && apk del pcre-dev ${PHPIZE_DEPS} \
    && rm -rf /tmp/* /var/cache/apk/*

CMD ["supervisord","-c","/etc/supervisord.conf"]

