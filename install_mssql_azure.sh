#!/bin/bash
MSSQL_PID="Developer"
MSSQL_SA_PASSWORD="YourStrongPassword123!"  # Replace with a secure password
ACCEPT_EULA="Y"  # Accept the MSSQL Server EULA (Yes)

# Update the system and install required dependencies
echo "Starting installation of MSSQL Server and Azure Data Studio..."

# Add Microsoft GPG key and MSSQL Server repository
echo "Adding Microsoft GPG key and repository..."
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/microsoft-prod.gpg
curl -fsSL https://packages.microsoft.com/config/ubuntu/22.04/mssql-server-2022.list | sudo tee /etc/apt/sources.list.d/mssql-server-2022.list

# Install gdb (optional dependency)
echo "Installing gdb..."
sudo apt install -y gdb

# Download and install libsss-nss-idmap0 dependency
echo "Downloading and installing libsss-nss-idmap0..."
wget http://mirrors.kernel.org/ubuntu/pool/main/s/sssd/libsss-nss-idmap0_2.9.5-3ubuntu2_amd64.deb
sudo chmod 777 libsss-nss-idmap0_2.9.5-3ubuntu2_amd64.deb
sudo dpkg -i libsss-nss-idmap0_2.9.5-3ubuntu2_amd64.deb || sudo apt-get -f install -y

# Update package lists and install MSSQL Server
echo "Updating package lists and installing MSSQL Server..."
sudo apt-get update
sudo apt-get install -y mssql-server

# Automate MSSQL Server setup
echo "Configuring MSSQL Server with predefined values..."
sudo MSSQL_PID="$MSSQL_PID" ACCEPT_EULA="$ACCEPT_EULA" MSSQL_SA_PASSWORD="$MSSQL_SA_PASSWORD" /opt/mssql/bin/mssql-conf -n setup

# Add MSSQL Tools repository
echo "Adding MSSQL Tools repository..."
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc
curl -fsSL https://packages.microsoft.com/config/ubuntu/22.04/prod.list | sudo tee /etc/apt/sources.list.d/mssql-release.list

# Update package lists and install MSSQL Tools
echo "Installing MSSQL Tools and unixODBC..."
sudo apt-get update
sudo apt-get install -y mssql-tools18 unixodbc-dev

# Add MSSQL Tools to PATH
echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bashrc
source ~/.bashrc

# Download and install Azure Data Studio
echo "Downloading and installing Azure Data Studio..."
wget https://go.microsoft.com/fwlink/?linkid=2282287 -O azuredatastudio-linux.deb
sudo chmod 777 azuredatastudio-linux.deb
sudo dpkg -i azuredatastudio-linux.deb || sudo apt-get -f install -y

echo "Installation completed successfully!"
echo "MSSQL Server and Azure Data Studio are now installed and configured."
echo "Script by 0xSASA"
