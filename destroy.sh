#!/bin/bash

# Define colors using ANSI escape codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to display a confirmation prompt
confirm_removal() {
    read -p "Are you sure you want to remove the script and the 'Licenses' directory? (y/n): " choice
    case "$choice" in
    y | Y)
        return 0 # Proceed with removal
        ;;
    n | N)
        echo -e "${YELLOW}Operation canceled.${NC}"
        return 1 # Cancel removal
        ;;
    *)
        echo -e "${RED}Invalid choice. Operation canceled.${NC}"
        return 1 # Cancel removal for invalid input
        ;;
    esac
}

# Main function to remove the script and Licenses directory
destroy() {
    script_name=$(basename "$0")  # Get the name of the current script
    setup_name="setup_project.sh" # Get the name of the current script
    licenses_dir="Licenses"       # Directory to remove

    if confirm_removal; then
        # Remove the script and the Licenses directory

        echo -e "${GREEN}Removing script: $setup_name...${NC}"
        rm -f "$setup_name"

        echo -e "${GREEN}Removing destroy script: $script_name...${NC}"
        rm -f "$script_name"

        echo -e "${GREEN}Removing directory: $licenses_dir...${NC}"
        rm -rf "$licenses_dir"

        echo -e "${GREEN}Removal completed.${NC}"
    fi
}

# Run the destroy function
destroy

