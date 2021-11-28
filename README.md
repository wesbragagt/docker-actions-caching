# Docker Layer Caching with Github Actions

The goal of this repo is to demonstrate how to go about using Github Actions with Docker Layer Caching

![](docker_layer_caching_flow.drawio.png)

Essencially when we build from trunk, we cache those docker layers and we consume them in the feature branch pipelines.

Speeding up the builds.
