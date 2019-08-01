# How to make this asset available
This asset requires the following steps to be properly released:
1) Create a Pull Request from your fork and branch
1) The PR will be reviewed and merged
1) The maintainers will then create a release, which triggers the `deploy` phase of the Travis build
1) The `deploy` phase pushes an updated image of the asset to Docker Hub

# Release schedule
We anticipate that this asset will be release rarely - only when issues warrant a correction.

# Dependencies

This asset uses the Ubuntu (Debian) installer package of the Appsody CLI, which is produced by the Appsody CLI build process. That package is referenced by the `Dockerfile` contained in this repo and it is currently set to consume the release 0.2.2 of the Appsody CLI.

If significant changes to the `appsody extract` command are introduced by a CLI release, this asset should be rebuilt referencing a newer version of the CLI in `Dockerfile`.


However, the [Tekton example](https://github.com/appsody/tekton-example)  relies on the Docker image that is created by the release process of this asset. Therefore, whenever this asset gets released, it is reasonable to expect that a new release of the Tekton example also gets initiated.