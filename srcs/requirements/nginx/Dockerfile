# Get base image penultimate stable version of debian
FROM debian:bullseye

# MAINTAINER instruction in deprecated and LABEL is now prefered
LABEL maintainer="stouitou stouitou@student.42.fr"

WORKDIR /home/stouitou

# Update packages
RUN apt update && apt upgrade -y

# Get nginx
# 1. Install the prerequisites
RUN apt install -y curl gnupg2 ca-certificates lsb-release debian-archive-keyring
# 2. Import an official nginx signing key so apt could verify the packages authenticity. Fetch the key
RUN curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor | tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null
# 3. Set up the apt repository for stable nginx packages
RUN echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] http://nginx.org/packages/debian `lsb_release -cs` nginx" | tee /etc/apt/sources.list.d/nginx.list
# 4. Set up repository pinning to prefer nginx packages over distribution-provided ones
RUN echo "Package: *" > /etc/apt/preferences.d/99nginx && \
	echo "Pin: origin nginx.org" >> /etc/apt/preferences.d/99nginx && \
	echo "Pin: release o=nginx" >> /etc/apt/preferences.d/99nginx && \
	echo "Pin-Priority: 900" >> /etc/apt/preferences.d/99nginx
# 5. Install the nginx package
RUN apt update && apt install -y nginx
# 6. Clean up
RUN apt clean && rm -rf /var/lib/apt/lists/*

# Generate self-signed certificate for nginx & copy nginx configuration to find it
RUN mkdir -p /etc/nginx/ssl && \
	openssl req -x509 -nodes -days 365 \
	-newkey rsa:2048 \
	-keyout /etc/nginx/ssl/private.key \
	-out /etc/nginx/ssl/certificate.crt -subj "/C=FR/ST=Paris/O=inception/CN=stouitou.42.fr/"
COPY ./conf /etc/nginx/conf.d/

# Expose port 80 for Nginx
EXPOSE 443

# Start nginx in non daemon mode, for it no to stop immediately
CMD ["nginx", "-g", "daemon off;"]
