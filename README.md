# Dockerfile for Flutter

This is a Dockerfile for building a container image with Flutter installed. The image is based on `Ubuntu 20.04` and includes all the necessary dependencies to build and run **Flutter apps** for **Android**, **iOS**, **macOS**, **Linux**, **Windows**, and the **web**.

## Building the image

To build the Docker image, run the following command:

```sh
>> docker buildx build --platform linux/amd64,linux/arm64 -t flutter:latest .
```

This will create a Docker image with the tag `flutter:latest` that can run on both `x86_64` and `ARM64` architectures.


## Running the container
To run a container based on the flutter:latest image, use the following command:

```bash
>> docker run -it --rm flutter:latest
```

This will start a new container and open a command prompt inside it.

## Using the container for Flutter development

To use the container for Flutter development, you can mount your Flutter project directory as a volume inside the container, and then run the `flutter` command to build and run your app. 
**Here's an example:**

```bash
>> docker run -it --rm -v /path/to/your/flutter/project:/app flutter:latest bash
>> cd /app
>> flutter run
```

This will start a new container, mount your Flutter project directory as a volume at /app, and open a command prompt inside the container. You can then use the flutter command to build and run your app as you normally would.

## Additional resources

For more information about using Docker with Flutter, see the following resources:

- [Dockerizing a Flutter App](https://www.freecodecamp.org/news/dockerizing-a-flutter-app/)
- [Dockerizing a Flutter App - Part 2](https://www.freecodecamp.org/news/dockerizing-a-flutter-app-part-2/)
- [Official Flutter Docker image](https://hub.docker.com/r/google/dart) (for Dart, the programming language used by Flutter)



