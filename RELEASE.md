# How to make this asset available
This asset requires the following steps to be properly released:
1) Create a Pull Request from your fork and branch
1) The PR will be reviewed and merged
1) The maintainers will then create a release, which triggers the `deploy` phase of the Travis build
1) The `deploy` phase pushes an updated image of the builder to Docker Hub

# Release schedule
We anticipate that this asset will be release rarely - only when issues warrant a correction.

# Dependencies
This asset has no dependencies on other assets in order to be built and released.

However, the build process of the Appsody CLI relies on the Docker image that is created by release process of this asset. Therefore, whenever this asset gets released, it is reasonable to expect that a new release of the Appsody CLI also gets initiated.