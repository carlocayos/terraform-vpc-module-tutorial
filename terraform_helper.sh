#!/usr/bin/env bash

#-----------------------------------
# Check valid subcommand
#-----------------------------------
subcommand_arr=("plan" "refresh" "apply" "destroy")

valid_subcommand=0

for c in "${subcommand_arr[@]}"
do
    if [[ "${c}" == "$1" ]]
    then
        valid_subcommand=1
        break
    fi
done

# Check if subcommand is valid
if [[ ${valid_subcommand} -eq 0 ]]
    then
        echo "Invalid subcommand.\n Usage: './terraform_helper.sh <subcommand> <workspace>'"
        exit 1
fi

#-----------------------------------
# Check valid workspace
#-----------------------------------
workspace_arr=(`ls -1 env`)

valid_workspace=0

for workspace in "${workspace_arr[@]}"
do
    if [[ "${workspace}" == "$2" ]]
    then
        valid_workspace=1
        break
    fi
done

# Check if workspace is valid
if [[ ${valid_workspace} -eq 0 ]]
    then
        echo "Invalid argument.\n Usage: './terraform_helper.sh <subcommand> <workspace>'"
        exit 1
fi

# Set the workspace
workspace_command="terraform workspace select $2"
echo "Selecting workspace... ${workspace_command}\n"

eval ${workspace_command}
if [ $? -ne 0 ]; then
    exit 1
fi

# Run the command
terraform_command="terraform $1 -var-file=env/$2/vpc.tfvars"
echo "Running command... ${terraform_command}\n"

eval ${terraform_command}
if [ $? -ne 0 ]; then
    exit 1
fi
