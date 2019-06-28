# Appsody Docker

A builder for the `appsody-docker` Docker image. This is the `gcr.io/cloud-builders/docker` image with the Appsody CLI added.

### Building the image

```sh
docker build -t appsody-docker -f Dockerfile .
```

### Publishing the image

The current Tekton pipeline pulls the image `index.docker.io/seabaylea/appsody-docker`. If you publish your own image, remember to update the pipeline!

