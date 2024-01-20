# Credits
Kudos to Woolf, for creating RTSPbrute. \
See: https://gitlab.com/woolf/RTSPbrute

**Disclaimer:** No copies of RTSPbrute are included within this repo. This only contains a method to build your own docker image, using Woolf's work. No warranty given, or implied. Don't do evil. Be a force for good.

# What you'll need before you start
IYKYK, otherwise, this isn't for you.
* Docker
* git
* know how to use docker and git via a terminal prompt

# What this is
This is a Dockerfile that will build an image containing RTSPbrute, based upon Ubuntu 22.04LTS.

"Sure. But, what is RTSPbrute?", I hear you ask. \
I'm afraid that's beyond the scope of this README. \
Please go visit https://gitlab.com/woolf/RTSPbrute for more detailed info.

It includes the O/S pre-requisites of the package, and then RTSPbrute is installed via `pip3 install rtspbrute`.

This means you can easiy run RTSPbrute containerised, from your host O/S, without having to worry about installing, pre-reqs, or maintenance of packages.

# Getting Started
## Cloning this repo
`cd` to where you'd like to download this repo to, then:
```
git clone https://github.com/mcbazza/RTSPbrute-docker
```
## Building the Docker image
```
docker build -f Dockerfile -t rtspbrute .
```
## Running the Docker image to scan cameras
Before you can run a scan, you need to ensure you have a file of targets.

This repo contains a dummy file at
[/Files/targets.txt](/Files/targets.txt) that references `192.168.1.1`.

By doing a docker bind mount, when we run the image, we can make a local folder appear inside the docker container, where RTSPbrute can read the `targets.txt` file from, and more importantly, can save the reports it creates for you to access.

Edit this `targets.txt` in your host O/S (using your favourite editor), before running the image. Or, copy your own file into this folder, and reference it in the arguments when you do your `docker run`.

To run the docker image, utilising a docker bind to a local folder:
```
docker run -v "${PWD}\Files:/RTSPbrute" -it rtspbrute -t targets.txt
```
## Viewing the results
RTSPbrute will create a subfolder within `\Files` (where your `targets.txt` is stored) named `Reports`.

In there you'll find a new folder for each time you run RTSPbrute.

And as long as you used the docker bind mount (as per above), to mount a local folder into the RTSPbrute container, these results will be available from outside the container, and will persist for each run.

As per RTSPbrute, this folder will contain:
* `result.txt` - a list of the IPs where RTSP cams were found, what the URI is, and the user/pass that worked.
* `index.html` - a webpage, displaying the images that were captured against the scanned IPs
