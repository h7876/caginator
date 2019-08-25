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
            docker-compose up
            echo "STARTING cage"
        ;;
        "start-bg")
            docker-compose up -d
            echo "STARTING cage in background"
        ;;
        'stop')
            echo "STOPPING cage_app"
#            docker-compose down
            docker stop cage_app
            docker rm $(docker ps -a -q)
            docker rmi cage_app
        ;;
        *)
            echo -e "ERROR: invalid option. Try..\n$ ${FUNCNAME} help"
        ;;
    esac
}
