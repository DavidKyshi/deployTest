# FROM ubuntu:20.04

# # Setup 
# RUN apt-get update && apt-get install -y unzip xz-utils git openssh-client curl python3 && apt-get upgrade -y && rm -rf /var/cache/apt

# # Install Flutter
# RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter
# ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"
# RUN flutter channel master
# RUN flutter upgrade
# RUN flutter config --enable-web
# RUN flutter doctor -v

# # Copy files to container and get dependencies
# COPY . /usr/local/bin/app
# WORKDIR /usr/local/bin/app
# RUN flutter pub get
# RUN flutter build web

# # Document the exposed port and start serser
# EXPOSE 8080
# ENTRYPOINT ["chmod", "+x", "/usr/local/bin/app/server/server.sh"]



# # Install Operating system and dependencies
# FROM ubuntu:20.04

# RUN apt-get update 
# RUN apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback lib32stdc++6 python3
# RUN apt-get clean

# # download Flutter SDK from Flutter Github repo
# RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

# # Set flutter environment path
# ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# # Run flutter doctor
# RUN flutter doctor

# # Enable flutter web
# RUN flutter channel master
# RUN flutter upgrade
# RUN flutter config --enable-web

# # Copy files to container and build
# RUN mkdir /app/
# COPY . /app/
# WORKDIR /app/
# RUN flutter build web

# # Record the exposed port
# EXPOSE 5000

# # make server startup script executable and start the web server
# RUN ["chmod", "+x", "/app/server/server.sh"]

# ENTRYPOINT [ "/app/server/server.sh"]



#Stage 1 - Install dependencies and build the app
FROM debian:latest AS build-env

# Install flutter dependencies
RUN apt-get update 
RUN apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback lib32stdc++6 python3
RUN apt-get clean

# Clone the flutter repo
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

# Set flutter path
# RUN /usr/local/flutter/bin/flutter doctor -v
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Run flutter doctor
RUN flutter doctor -v
# Enable flutter web
RUN flutter channel master
RUN flutter upgrade
RUN flutter config --enable-web

# Copy files to container and build
RUN mkdir /app/
COPY . /app/
WORKDIR /app/
RUN flutter build web

# Stage 2 - Create the run-time image
FROM nginx:1.21.1-alpine
COPY --from=build-env /app/build/web /usr/share/nginx/html