# Flutter App with Docker

This is a Flutter app that can be built for web, Android and iOS using Docker.

## Requirements

- Docker
- Buildx
- Flutter SDK
- Android SDK
- XCode

## Usage

To build this app for multiple platforms, you need to use `docker buildx` command with `--platform` flag to specify the target platforms. For example:

``` bash
docker buildx create --use
docker buildx build --platform=linux/amd64,darwin/amd64 .
```

This will create a builder instance and build a multi-platform image for **Linux** and **OSX** architectures.


To run this app on your device or emulator, you need to use `docker run` command with `-v` flag to mount your app directory. 

**For example:**

```bash
docker run -v /path/to/app:/app -it <image_name>
```

This will run the image and mount your app directory to `/app` inside the container.

To push this image to a registry like Docker Hub, you need to use `docker push` command with `-t` flag to tag your image. 

**For example:**

```bash
docker push -t <username>/<repository>:<tag> <image_name>
```

This will tag your image and push it to your repository on Docker Hub.

You can also use a tool called `docker-pushrm`¹ which allows you to push a README file along with your image. For example:

```bash
docker pushrm <username>/<repository>
```

This will use the logins from Docker's credentials store and push your `README` file to your repository on Docker Hub.

## License

MIT License

## References

¹: https://stackoverflow.com/questions/29134275/how-to-push-a-docker-image-with-readme-file-to-docker-hub
²: https://www.docker.com/blog/faster-multi-platform-builds-dockerfile-cross-compilation-guide/
³: https://docs.docker.com/build/building/multi-platform/
