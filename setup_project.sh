#!/bin/bash

# Define colors using ANSI escape codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
BLUE='\033[0;34m'
WHITE='\033[1;37m'  # Bold white
NC='\033[0m' # No Color

# SpellForge logo (custom)
show_logo() {
    echo -e "${BLUE}"
    echo "  __            _ _   ___                    "
    echo " / _\_ __   ___| | | / __\__  _ __ __ _  ___ "
    echo " \ \| '_ \ / _ \ | |/ _\/ _ \| '__/ _\` |/ _ \\"
    echo " _\ \ |_) |  __/ | / / | (_) | | | (_| |  __/"
    echo " \__/ .__/ \___|_|_\/   \___/|_|  \__, |\___|"
    echo "    |_|                           |___/      "
    echo -e "${NC}"
}

# Function to create directory structure for C
create_c_structure() {
    mkdir -p "$1"/{src,include,build,docs}
    touch "$1"/{.gitignore}
    echo -e "${GREEN}Created C project structure.${NC}"
    cat Licenses/MIT_LICENSE.txt > "$1"/README.md  # Copy MIT License from the specified path
    echo -e "CC = gcc\n\nall:\n\tgcc src/*.c -o program\n\nclean:\n\trm -f program" > "$1"/Makefile
}

# Function to create directory structure for Python
create_python_structure() {
    mkdir -p "$1"/{src,tests,docs}
    touch "$1"/{.gitignore,requirements.txt}
    echo -e "${GREEN}Created Python project structure.${NC}"
    cat Licenses/MIT_LICENSE.txt > "$1"/README.md  # Copy MIT License from the specified path
    echo -e "run:\n\tpython3 src/main.py" > "$1"/Makefile
}

# Function to create directory structure for Java
create_java_structure() {
    mkdir -p "$1"/{src/main/java,src/test/java,lib,docs}
    touch "$1"/{.gitignore,pom.xml}
    echo -e "${GREEN}Created Java project structure.${NC}"
    cat Licenses/MIT_LICENSE.txt > "$1"/README.md  # Copy MIT License from the specified path
    echo -e "compile:\n\tjavac src/main/java/*.java\n\nrun:\n\tjava -cp src/main/java Main" > "$1"/Makefile
}

# Function to create directory structure for C++
create_cpp_structure() {
    mkdir -p "$1"/{src,include,build,docs}
    touch "$1"/{.gitignore,CMakeLists.txt}
    echo -e "${GREEN}Created C++ project structure.${NC}"
    cat Licenses/MIT_LICENSE.txt > "$1"/README.md  # Copy MIT License from the specified path
    echo -e "CC = g++\n\nall:\n\tg++ src/*.cpp -o program\n\nclean:\n\trm -f program" > "$1"/Makefile
}

# Function to check for existing project directory
check_existing_directory() {
    local project_name="$1"
    if [[ -d "$project_name" ]]; then
        echo -e "${RED}A directory named '$project_name' already exists.${NC}"
        echo "What would you like to do?"
        echo -e "${BLUE}1)${NC} Replace the existing directory."
        echo -e "${BLUE}2)${NC} Create a new directory with a different name."
        echo -e "${BLUE}3)${NC} Cancel."

        read -p "Enter your choice (1-3): " choice
        case $choice in
            1)
                echo -e "${YELLOW}Replacing existing directory...${NC}"
                rm -rf "$project_name"  # Remove existing directory
                return 0  # Indicate to create the new structure
                ;;
            2)
                return 1  # Indicate to create a new name
                ;;
            3)
                echo -e "${RED}Operation canceled.${NC}"
                return 2  # Indicate to cancel
                ;;
            *)
                echo -e "${RED}Invalid choice.${NC}"
                return 2  # Indicate to cancel on invalid input
                ;;
        esac
    fi
    return 0  # No existing directory
}

# Function to prompt for language and create directory structure
setup_project() {
    clear  # Clear the terminal window
    show_logo
    echo -e "${WHITE}Choose a language for your project (or abort):${NC}"
    echo -e "${BLUE}1)${NC} C"
    echo -e "${BLUE}2)${NC} Python"
    echo -e "${BLUE}3)${NC} Java"
    echo -e "${BLUE}4)${NC} C++"
    echo -e "${BLUE}5)${NC} Abort"
    
    read -p "Enter the number of your choice: " choice
    
    # Check if the choice is valid
    if [[ "$choice" -ge 1 && "$choice" -le 5 ]]; then
        if [[ "$choice" -eq 5 ]]; then
            echo -e "${RED}Aborting the operation.${NC}"
            exit 0  # Exit the script
        fi

        while true; do
            read -p "Enter the name of your project: " project_name
            check_existing_directory "../$project_name"  # Check in the parent directory
            result=$?

            if [[ $result -eq 0 ]]; then
                # Create project root directory in the parent directory
                mkdir -p "../$project_name"

                # Call the corresponding function based on the choice
                case $choice in
                    1)
                        create_c_structure "../$project_name"
                        ;;
                    2)
                        create_python_structure "../$project_name"
                        ;;
                    3)
                        create_java_structure "../$project_name"
                        ;;
                    4)
                        create_cpp_structure "../$project_name"
                        ;;
                esac
                break  # Exit the loop after creating the project
            elif [[ $result -eq 1 ]]; then
                # User chose to create a new directory with a different name
                continue
            elif [[ $result -eq 2 ]]; then
                # User chose to cancel the operation
                break
            fi
        done
    else
        echo -e "${RED}Invalid choice. Please select a number between 1 and 5.${NC}"
    fi
}

# Run the setup_project function
setup_project
