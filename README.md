# tooling-docker

## Description
Ubunutu image with various tooling packages installed for local use

## How-to

Build the container to be used on M1 Macbook
~~~
docker build -t tooling . --platform=linux/amd64
~~~

Running the container interactive
~~~
docker run -it tooling /bin/bash
~~~