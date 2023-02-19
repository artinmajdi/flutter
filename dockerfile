FROM ubuntu:20.04

# Install necessary dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends git wget openjdk-8-jdk curl unzip xz-utils zip libglu1-mesa libgtk-3-dev libwebp-dev libgif-dev && \
    rm -rf /var/lib/apt/lists/*


# Creates a new system group named flutter with a numeric group ID of 1441. 
# The -r option creates a system group, which is used for service accounts and system users, and is not intended for regular users.
RUN groupadd -r -g 1441 flutter

# A new system user named flutter with a numeric user ID of 1441 and a primary group ID of 1441.
# The -r option creates a system user, which is used for service accounts and system users, and is not intended for regular users. 
# The -g flutter option sets the primary group of the user to flutter. 
# The -m option creates a home directory for the user.
RUN useradd --no-log-init -r -u 1441 -g flutter -m flutter

# Set the user:group to flutter:flutter
USER flutter:flutter


# Set up Flutter
ARG flutterVersion=stable

ENV FLUTTER_VERSION=$flutterVersion \
    FLUTTER_HOME=/opt/flutter \
    FLUTTER_ROOT=/opt/flutter


# Cloning the repo
ADD https://api.github.com/repos/flutter/flutter/compare/${flutterVersion}...${flutterVersion} /dev/null

RUN git clone --depth 1 --branch $FLUTTER_VERSION  https://github.com/flutter/flutter.git $FLUTTER_HOME

# Set the ownership of the files in the $FLUTTER_HOME directory to the flutter user and group.
RUN chown -R root:root $FLUTTER_HOME

# Add flutter to the PATH environment variable
ENV PATH=$PATH:/opt/flutter/bin:/opt/flutter/bin/cache/dart-sdk/bin


# Set the configuration values for Flutter such as: disabling analytics and crash reporting on the builder & Installing Flutter plugins for desktop and web
RUN flutter config  --no-analytics --no-crash-reporting \
                    --enable-linux-desktop --enable-macos-desktop --enable-windows-desktop \
                    --enable-web \
                    --enable-android --enable-ios


# Download and caches Flutter artifacts, which can speed up the build process. 
RUN flutter precache

# Accept licenses.
RUN 'yes' | sdkmanager --licenses

# Run flutter doctor to verify that everything is installed and configured correctly.
RUN flutter doctor -v


# Set the working directory to $FLUTTER_HOME (/opt/flutter)
WORKDIR $FLUTTER_HOME


