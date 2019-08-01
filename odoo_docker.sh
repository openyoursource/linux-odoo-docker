#!/bin/bash
info() {
	echo -e "How to use:"
        echo -e "install\t- installs docker, oboo and postgre containers and start them"   
        echo -e "start\t- start containers"
        echo -e "stop\t- stop containers"
        echo -e "remove\t- removes conateiners" 
	echo -e "status\t- lists installed containers status" 
}
odoo_status() {
	docker ps -a | head -1
        docker ps -a | grep -w "odoo_main$" 
        docker ps -a | grep -w "odoo_main$"
}
if [ -z $1 ]; then
	info
else	
	case $1
		in
		install) 
			if ! [ -x "$(command -v docker)" ]; then # download and install docker if not installed 
		   		curl -fsSL https://get.docker.com/ | sh 
			fi
			if ! [ -z "$(pgrep docker)" ]; then # start docker if it's not running 
		   		sudo systemctl start docker 
		   		sudo systemctl status docker  
		   	fi
			if ! [ -x "$(docker ps -a | grep -w "odoo_postgres$")" ]; then # download and create postgre conatier 
		   	docker run -d -e POSTGRES_USER=odoo -e POSTGRES_PASSWORD=odoo -e POSTGRES_DB=postgres --name odoo_postgres postgres:10 && echo "postgres started"
			fi
			if ! [ -x "$(docker ps -a | grep -w "odoo_main$")" ]; then # download and create odoo container
		   	docker run -d -p 8069:8069 --name odoo_main --link odoo_postgres:db -t odoo
		   	fi
			odoo_status
			;;
		start) 	
			docker start odoo_postgres odoo_main 
			odoo_status
			;;
		stop)   
			docker stop odoo_main  odoo_postgres 
			odoo_status
			;;
			
		remove) 
			docker stop odoo_main odoo_postgres	
			docker rm odoo_main odoo_postgres 
			;; 
		status)
			odoo_status 
			;;
		*) 
	  	   info  ;;		
	esac
fi
