go-redirect [![CircleCI branch](https://img.shields.io/circleci/project/hverr/go-redirect/master.svg)](https://circleci.com/gh/hverr/go-redirect/)
===========

Redirect HTTP to HTTPS with Docker

# What is this?
This image accepts any http request and redirects to the https version of the same page.  
It does not serve any pages.

# What is this for?
The primary reason for this image is for doing SSL termination on a load balancer (eg: AWS ELB) in the simplest possible way.

# How do I use it?
* Run this image on any TCP port, and your own web server image on another.
```bash
docker run -d -p 8080:80 hverr/go-ssl-redirect
docker run -d -p 80:80 my-web-server-image
```
* Forward HTTP 80 on your load balancer to whatever port this image is running on.
* Forward HTTPS 443 on your load balancer to whatever port your own web server is running on.

All HTTP requests will hit this image and be redirected to make HTTPS request. This is abstracted from the user.

# How do I build it myself?

Assuming you have go installed, do the following:
```sh
CGO_ENABLED=0 GOOS=linux go build -a -ldflags '-s'
docker build -t go-ssl-redirect .
docker run go-ssl-redirect
```
I am doing the build outside of a Docker container so that I can reduce the size of the image. The official GoLang container is 725 MB in size. By doing it this way, this entire container is only 5.5MB
