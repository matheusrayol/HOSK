#!/bin/bash
# HOSK - HyperOS Kitchen
# by Matheus Ferreira
# Main script

# If there isn't a config file, create one
if [[ ! -f data/config/.hosk ]]; then
    echo ${PWD} >> data/config/.hosk
# If there is a config file, check if the kitchen path is updated
elif [[ $(echo ${PWD}) != $(cat data/config/.hosk) ]]; then
    echo ${PWD} >> data/config/.hosk
fi

# Export the main path to the environment
export hosk_system=$(cat data/config/.hosk)

# Load system config
for hosk_sys_config in ${hosk_system}/data/config/*.sh; do
    . ${hosk_sys_config}
done

# Load core functions
