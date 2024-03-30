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
sleep 2

# Output description of the script's purpose
echo "This script will install and configure Ansible on your Ubuntu server container."
echo "It will also perform system updates using apt update/upgrade."
echo "Once complete it will prompt you to configure the container packages and dependancies via Ansible."
sleep 2

# Prompt user for confirmation to proceed
read -p "Do you want to continue? (y/n): " choice
if [[ ! $choice =~ ^[Yy]$ ]]; then
    echo "Exiting script."
    exit 1
fi

# Update package repositories
echo "Updating package repositories..."
apt update

# Upgrade installed packages
echo "Upgrading installed packages..."
# apt upgrade -y

# Install Ansible
echo "Installing Ansible..."
apt install -y ansible

# Clone Ansible repository
echo "Cloning FluxEdge-AI-Toolbox..."
git clone https://github.com/helloskyy-io/FluxEdge-AI-Toolbox.git FluxEdge_AI_Toolbox

# Display completion message
echo "Ansible installation and configuration completed successfully."
echo "You can also run it manually by copying the following command: "
echo "ansible-playbook -i localhost, -c local /FluxEdge_AI_Toolbox/AI_Toolbox.yml"

# Prompt user for confirmation to proceed
read -p "Ready to launch Ansible? (y/n): " choice
if [[ ! $choice =~ ^[Yy]$ ]]; then
    echo "Exiting script."
    exit 1
fi

# Launch Ansible playbook
echo "Launching Ansible playbook..."
ansible-playbook -i localhost, -c local /FluxEdge_AI_Toolbox/AI_Toolbox.yml