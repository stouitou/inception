# Get base image penultimate stable version of Debian
FROM debian:bullseye

# MAINTAINER instruction is deprecated and LABEL is now prefered
LABEL maintainer="stouitou ${MAINTAINER}"

# Update packages
RUN apt update && apt upgrade -y

# Get nginx
RUN apt install -y nginx openssl
RUN apt clean && rm -rf /var/lib/apt/lists/*

# Generate self-signed certificate for nginx
# -x509 = auto-signed cetificate
# -nodes = uncrypted key
# -new = non-existent key
RUN mkdir -p /etc/nginx/ssl && \
	openssl req -x509 -nodes -new \
	-keyout /etc/nginx/ssl/inception.key \
	-out /etc/nginx/ssl/inception.crt \
	-subj "/C=FR/ST=Paris/O=inception/CN=${DOMAIN_NAME}/"

# Copy configuration file and bind it to be considered by service
COPY ./conf/nginx.conf /etc/nginx/sites-available/nginx.conf
RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf

# Expose port 443 for secured Nginx
EXPOSE 443

# Start nginx in non daemon mode, for it no to stop immediately
CMD ["nginx", "-g", "daemon off;"]
