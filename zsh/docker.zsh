#!/bin/zsh

function docker-machine-expose-ports {
    if which VBoxManage >/dev/null 2>&1 && which docker-machine >/dev/null 2>&1; then
        VM_NAME="$(docker-machine active 2>/dev/null)"
        if [[ -z "$VM_NAME" ]]; then
            echo -e "- ${RED}Warning: can't find active docker-machine VM; ports will not be mapped.${NC}"
        elif ! docker-machine ls | grep "$VM_NAME" | grep virtualbox; then
            echo -e "- ${RED}Warning: active docker-machine VM doesn't appear to use VirtualBox; ports will not be mapped.${NC}"
        else
            for PORT in 7654 7655 7656 7657 7659 7660 8000 8001 8002 8400 8501 9999; do
                if ! VBoxManage showvminfo "$VM_NAME" 2>&1 | grep "host port = $PORT" > /dev/null; then
                    echo -e "- ${BLUE}Adding VirtualBox NAT rules for VM ${BROWN}$VM_NAME${BLUE} on port ${BROWN}$PORT${NC}"
                    if ! VBoxManage controlvm "$VM_NAME" natpf1 "marklogic-$PORT,tcp,127.0.0.1,$PORT,,$PORT" >/dev/null 2>&1; then
                        echo -e "! ${RED}Failed to map VirtualBox VM ${BROWN}$VM_NAME${BLUE} on port $PORT; exiting...${NC}"
                        exit 1
                    fi
                fi
            done
        fi
    fi
}

DOCKER_MACHINE="default"

test "$(docker-machine ls | grep $DOCKER_MACHINE | awk '{print $4}')" = "Running" && eval "$(docker-machine env $DOCKER_MACHINE)"
