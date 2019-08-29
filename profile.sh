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
- stop: stop cage's docker container(s)
- purge: stop containers and purge all remnants"
        ;;
        "start")
            docker-compose up --force-recreate
            echo "STARTING cage"
        ;;
        "start-bg")
            docker-compose up -d
            echo "STARTING cage in background"
        ;;
        'stop')
            echo "STOPPING cage-app"
            docker-compose down
        ;;
        'purge')
            docker-compose down
            docker stop app-cage
            docker rm $(docker ps -a -q)
            docker rmi app-cage
            docker rmi caginator_app
            docker rmi $(docker images -f "dangling=true" -q)
        ;;
        *)
            echo -e "ERROR: invalid option. Try..\n$ ${FUNCNAME} help"
        ;;
    esac
}
