#!/bin/bash
#
# This is a tool to remove dotfiles from the home directory
#

SCRIPT_DIR="${HOME}/dotfiles"


function uninstall() {
    for FILE in $(ls ${SCRIPT_DIR})
    do
        echo -n "${SCRIPT_DIR}/${FILE}: "
        if [ -e "${HOME}/.${FILE}" ]; then
            if rm "${HOME}/.${FILE}"; then
                echo "${HOME}/.${FILE} unlinked"
            fi
        else
            echo "${HOME}/.${FILE} already unlinked, skipping."
        fi
    done
}

uninstall
