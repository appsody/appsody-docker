# Appsody in Docker

A builder for the `appsody/appsody-docker` Docker image, which is the `quay.io/buildah/stable` image with the Appsody CLI added to it. The image can be used within a build pipeline - such as a Tekton pipeline - to perform actions using the Appsody CLI.

At present, the image is equipped with a script (`extract.sh`) that runs the `appsody extract` command, after mounting the appropriate project source directory. The script assumes that the image is running within a container in a Tekton pipeline.

### Building the image
This repo includes a `.travis.yml` file that builds and pushes the image to Docker Hub. However, if you prefer building the image manually, issue the following command:

```sh
docker build -t appsody-docker -f Dockerfile .
```

### Using the image
An example of usage is provided by the [Appsody Tekton pipeline example](https://github.com/appsody/tekton-example). Check out the [Appsody build task](https://github.com/appsody/tekton-example/blob/master/appsody-build-task.yaml) manifest. 

In that context, the image runs the `appsody extract` command to retrieve the entire project tree from the Appsody stack image and the application source tree hosted on GitHub.

This image could be modified to run additional `appsody` commands if necessary.
