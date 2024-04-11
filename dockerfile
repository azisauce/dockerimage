# Use PHP 8.2 as the base image
FROM php:8.2

# Install required dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git \
        unzip \
        && \
    rm -rf /var/lib/apt/lists/*

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set working directory
WORKDIR /app

# Set entry point
CMD ["php", "-v"]
