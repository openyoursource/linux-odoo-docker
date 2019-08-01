# odoo-docker
you can use this script to set up odoo on CentOS 6/7/8. using docker containers.

## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Script is tested on CentOS 6/7/8.
It uses systemctl to start and check docker.
Also yum to install docker, so any linux distribution that uses systemctl and yum will work

### Installing

Clone this repository

```
git clone https://github.com/openyoursource/linux-odoo-docker
```

Enter downloaded directory and give script execution permission

```
cd linux-odoo-docker/
chmod 700 odoo_docker.sh
```
test if it works

```
./odoo_docker.sh
```
the output will be:
```
How to use:
install	- installs docker, oboo and postgre containers and start them
start	- start containers
stop	- stop containers
remove	- removes conateiners
status	- lists installed containers status
```

## How to use

### Install odoo
```
./odoo_docker.sh install
```
This option will check if docker is installed and running.
If not it will install it using yum and run it with systemctl.
Also it will download postgres version 10  and odoo latest containers and starts them.
You can access odoo now!
Go to hostname:8069
If you running this script on your operation system hostname will be localhost.
```
localhost:8069
```
If you are using virtual machine or server (VPS) hostname will be the IP address.
example:
```
192.168.1.180:8069
```
