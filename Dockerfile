FROM quay.io/ukhomeofficedigital/docker-centos-base

ENV MEDIAWIKI_VERSION 1.25.2
ENV MEDIAWIKI_PATH /var/www/mediawiki
ENV MEDIAWIKI_BIN "${MEDIAWIKI_PATH}/bin"

# Install PHP-FPM and libs
RUN yum update -y && \
    yum install -y  \
      php-fpm \
      php-mbstring \
      php-mysql  \
      php-gd \
      php-xml \
      php-intl \
      php-pecl-zendopcache && \
    yum -y clean all

# Install nginx.
RUN yum update -y && \
    yum install -y \ 
      epel-release &&\
    yum install -y \
      nginx && \
    yum -y clean all

# Install mediawiki
RUN curl https://releases.wikimedia.org/mediawiki/${MEDIAWIKI_VERSION%.*}/mediawiki-${MEDIAWIKI_VERSION}.tar.gz \
    | tar zx && \
    mkdir -p /var/www && \
    mv mediawiki-${MEDIAWIKI_VERSION} "${MEDIAWIKI_PATH}" && \
    mkdir "${MEDIAWIKI_BIN}"

# Send erors and logs to appopriate place.
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

# Put nginx site conf in place.
COPY conf/*.conf /etc/nginx/conf.d/

# Put extensions in tmp to load them in
COPY extensions* "${MEDIAWIKI_BIN}/"

# Run and fetch the extensions
RUN "${MEDIAWIKI_BIN}/extensions.sh" "${MEDIAWIKI_BIN}/extensions.txt"

# We expose the site as 8080.  Saves us the effot of removing the default 80 listen.
EXPOSE 8080

COPY start.sh /
CMD ["/start.sh"]
