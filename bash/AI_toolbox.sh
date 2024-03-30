#!/bin/bash

# display logo
echo " #####                        #     #"              
echo "#     # #    # #   # #   #    ##    # ###### ##### " 
echo "#       #   #   # #   # #     # #   # #        #   "
echo " #####  ####     #     #      #  #  # #####    #   "
echo "      # #  #     #     #      #   # # #        #   "
echo "#     # #   #    #     #      #    ## #        #   "
echo " #####  #    #   #     #      #     # ######   #   "
echo ""
echo "System activated..."
sleep 3

# Output description of the script's purpose
echo "This script will install and configure Ansible on your Ubuntu server container."
echo "It will also perform system updates using apt update/upgrade."
echo "Once complete it will prompt you to configure the container packages and dependancies via Ansible."
sleep 3

# Prompt user for confirmation to proceed
read -p "\n\nDo you want to continue? (y/n): " choice
if [[ ! $choice =~ ^[Yy]$ ]]; then
    echo "Exiting script."
    exit 1
fi

# Update package repositories
echo "\n\nUpdating package repositories..."
sleep 2
apt update

# Upgrade installed packages
echo "\n\nUpgrading installed packages..."
sleep 2
# apt upgrade -y

# Install Ansible
echo "\n\nInstalling Ansible..."
sleep 2
apt install -y ansible

# Clone Ansible repository
echo "\n\nCloning FluxEdge-AI-Toolbox..."
sleep 2
git clone https://github.com/helloskyy-io/FluxEdge-AI-Toolbox.git /FluxEdge_AI_Toolbox

# Display completion message
echo "\n\nAnsible installation and configuration completed successfully."
sleep 2
echo "You can run it manually by copying the following command: "
echo "ansible-playbook -i localhost, -c local /FluxEdge_AI_Toolbox/AI_Toolbox.yml"

# Prompt user for confirmation to proceed
read -p "\n\nReady to launch Ansible? (y/n): " choice
if [[ ! $choice =~ ^[Yy]$ ]]; then
    echo "Exiting script."
    exit 1
fi

# Launch Ansible playbook
echo "\n\nLaunching Ansible playbook..."
sleep 2
ansible-playbook -i inventories/localhost, -c local /FluxEdge_AI_Toolbox/ansible/playbooks/AI_Toolbox.yml
