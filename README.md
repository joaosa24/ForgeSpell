# SpellForge

Welcome to **SpellForge**, a project scaffolding tool that helps you quickly set up the structure for various programming languages. Whether you're working in C, Python, Java, or C++, SpellForge generates a well-organized project structure to streamline your development process.

## Features

- Create project structures for the following languages:
  - C
  - Python
  - Java
  - C++
- Automatically copy the MIT License to your project directory.
- User-friendly menu for selecting a programming language.
- Options to handle existing project directories.
- Clear terminal interface with colorful output.

## Getting Started

### Prerequisites

- Bash shell (Linux, macOS, or Windows with WSL).
- Basic knowledge of how to run scripts in a terminal.

### Installation

1. Clone this repository:
    ```bash
    git clone <repository-url>
    cd SpellForge
    ```

2. Make the script executable:
    ```bash
    chmod +x spellforge.sh
    ```

### Usage

1. Run the script:
    ```bash
    ./spellforge.sh
    ```

2. Follow the on-screen instructions to select your programming language and project name.

3. The project structure will be created in the parent directory (`../`).

### Project Structure

The generated project structure will vary based on the selected programming language. Here are examples for each:

- **C**
    ```
    ../project_name/
    ├── build/
    ├── docs/
    ├── include/
    ├── src/
    ├── .gitignore
    ├── README.md (MIT License)
    └── Makefile
    ```

- **Python**
    ```
    ../project_name/
    ├── docs/
    ├── src/
    ├── tests/
    ├── .gitignore
    ├── README.md (MIT License)
    └── Makefile
    ```

- **Java**
    ```
    ../project_name/
    ├── lib/
    ├── src/
    │   ├── main/
    │   └── test/
    ├── docs/
    ├── .gitignore
    ├── README.md (MIT License)
    └── pom.xml
    ```

- **C++**
    ```
    ../project_name/
    ├── build/
    ├── docs/
    ├── include/
    ├── src/
    ├── .gitignore
    ├── README.md (MIT License)
    └── CMakeLists.txt
    ```

