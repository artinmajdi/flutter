To run this `Dockerfile`, you need to use docker buildx command with `--platform` flag to specify the target platforms. 

For example:

```bash
docker buildx create --use
docker buildx build --platform=linux/amd64,darwin/amd64 .
```

This will create a builder instance and build a multi-platform image for Linux and OSX architectures.
