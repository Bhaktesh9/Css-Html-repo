# HTML5 + CSS3 Practical - Static Site
# Using nginx:alpine for serving static content

FROM nginx:alpine

# Copy all website files to nginx web root
COPY . /usr/share/nginx/html

# Remove any development/build files that shouldn't be served
RUN rm -f /usr/share/nginx/html/Dockerfile \
    /usr/share/nginx/html/.dockerignore \
    /usr/share/nginx/html/*.md

# Expose port 80
EXPOSE 80

# Health check to ensure the server is running
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD wget --no-verbose --tries=1 --spider http://localhost:80/ || exit 1

# Labels for better image management
LABEL maintainer="Bhaktesh Patel"
LABEL description="HTML5 + CSS3 Practical - Modern responsive website"
LABEL version="1.0"

# nginx:alpine already has a CMD to start nginx, so we don't need to override it