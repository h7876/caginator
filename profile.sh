#!/bin/bash


# Use: view/edit documentation
cage () {
    # if no command given force help page
    local OPTION
	if [[ "$1" != "" ]]; then
        OPTION=$1
    else
        OPTION="help"
    fi
	# handle input options
    case "${OPTION}" in
        'help')
echo "Usage: $ ${FUNCNAME} [option]

Options:
- help: show this menu
- start: launch cage's docker container(s)
- start-bg: launch cage's docker container(s), no output
- stop: stop cage's docker container(s)"
        ;;
        "start")
#            docker build --no-cache .
#            docker-compose up --force-recreate
            docker build --no-cache -t h7876/caginator .
            docker run --name app-cage -p 8080:8080 h7876/caginator
            echo "STARTING cage"
        ;;
        "start-bg")
#            docker-compose up -d
            docker build --no-cache -t h7876/caginator .
            docker run -d -p 8080:8080 h7876/caginator
            echo "STARTING cage in background"
        ;;
        'stop')
            echo "STOPPING cage-app"
#            docker-compose down
            docker stop app-cage
            docker rm $(docker ps -a -q)
            docker rmi app-cage
        ;;
        *)
            echo -e "ERROR: invalid option. Try..\n$ ${FUNCNAME} help"
        ;;
    esac
}
