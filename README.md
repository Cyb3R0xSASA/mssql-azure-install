---

# MSSQL Server and Azure Data Studio Installation Script

This repository contains a Bash script that automates the installation of **MSSQL Server** and **Azure Data Studio** on **Ubuntu 22.04** and **Kali Linux**.

The script will:
1. Install **MSSQL Server** (Developer edition).
2. Install **MSSQL Tools** (command-line tools).
3. Install **Azure Data Studio** for GUI-based database management.
4. Automate MSSQL Server configuration setup with predefined values.

---

## Prerequisites

Before running the script, ensure that:
- You are using **Ubuntu 22.04** or **Kali Linux**.
- You have **sudo** privileges on your system.
- You replace the default password (`YourStrongPassword123!`) in the script with a secure password.

---

## Installation

### 1. Clone the Repository (Optional)

Clone this repository to your local machine:

```bash
git clone https://github.com/Cyb3R0xSASA/mssql-azure-install.git
cd mssql-azure-install
```

### 2. Edit the Script

Open the `install_mssql_azure.sh` script and replace the following values:

- **`MSSQL_SA_PASSWORD="YourStrongPassword123!"`**: Set this to a secure password for the `sa` (System Administrator) account.
- **`MSSQL_PID="Developer"`**: Choose the edition of MSSQL Server you want (`Developer`, `Express`, or `Evaluation`).

### 3. Make the Script Executable

Make the script executable by running:

```bash
chmod +x install_mssql_azure.sh
```

### 4. Run the Script

Execute the script with **sudo** privileges:

```bash
sudo ./install_mssql_azure.sh
```

---

## Run MSSQL

In terminal

```bash
sqlcmd -S localhost -U sa -C
```
- Enter **MSSQL_SA_PASSWORD** that you write it in the script

In GUI

```bash
azuredatastudio
```

- Chose **New** then **New connection**
- Server **localhost**
- User name **sa**
- Password **MSSQL_SA_PASSWORD** that you write it in the script

## Features

- **Automated Installation**: Installs all required packages, dependencies, and tools in a single step.
- **Predefined Setup**: Configures MSSQL Server with predefined values, including accepting the license and setting the `sa` password.
- **MSSQL Tools**: Installs the MSSQL command-line tools and adds them to the system's `PATH`.
- **Azure Data Studio**: Downloads and installs Azure Data Studio for database management.

---

## Script Details

- The script adds the Microsoft repositories to your system and installs **MSSQL Server** and **Azure Data Studio**.
- It automates the **MSSQL Server setup** with predefined values, making it fully hands-free.
- Installs **MSSQL Tools** and adds them to the system's `PATH` for easy use from the command line.

---

## Notes

- **Password Security**: The `sa` password is hardcoded in the script. Be sure to change it before running the script to ensure your database server is secure.
- **Manual Interactions**: The script has been fully automated except for the `mssql-conf setup` step, which is now handled with predefined values.

---

## Troubleshooting

If you encounter any issues during the installation, try the following:

1. Ensure that all required dependencies are installed before running the script.
2. If you run into package installation issues, try running the following command:
   
   ```bash
   sudo apt-get -f install
   ```

3. For issues with missing packages during the installation of Azure Data Studio or MSSQL Server, run:

   ```bash
   sudo apt-get update
   sudo apt-get install -f
   ```

---

## Contributions

Feel free to fork this repository, open issues, and submit pull requests. Contributions are welcome!

---

## Contact

For any questions or feedback, feel free to reach out via the following channels:

- **GitHub**: [https://github.com/Cyb3R0xSASA](https://github.com/Cyb3R0xSASA)
- **Instagram**: [@s_a_s__a_](https://www.instagram.com/s_a_s__a_)
- **LinkedIn**: [s-a-s--a-](https://www.linkedin.com/in/s-a-s--a-)
- **X (Twitter)**: [@s_a_s__a_](https://x.com/s_a_s__a_)

---