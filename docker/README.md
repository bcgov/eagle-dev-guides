# eagle-dev-guides

Documentation and developer set up utilities for EAO EPIC (Eagle revision).

## Docker images for developer environments

To assist in getting developers onboarded onto EPIC, the following dockerfiles for both CentOS and Ubuntu have been created to allow devs to spin up an image that can then simply run the setup scripts in each project and be done

These can be used on both Windows and Linux machines given we'll be running docker containers in a virtualized layer underneath

## How to use

Simply build either docker image on your system
```
docker build -t eagle/ubuntu -f docker/ubuntu/dockerfile .
```
```
docker build -t eagle/centos -f docker/centos/dockerfile .
```

Then run the image of your choice
```
docker run -it --name eagle-ubuntu -p 3000:3000 eagle/ubuntu
```
```
docker run -it --name eagle-centos -p 3000:3000 eagle/centos
```

Once the image is running, clone repos as you see fit, and run the setup scripts as follows to complete setup.  The following is an example of the eagle-api repo
```
git clone https://github.com/bcgov/eagle-api
cd eagle-cpi
./install_prerequisites.sh
./setup_project.sh
```