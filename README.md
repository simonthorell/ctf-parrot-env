# CTF Parrot Environment

This VS Code environment is specifically setup for Capture The Flag (CTF) challenges, using the security tools of Parrot Security OS within a Docker container. It includes several additional toolkits pre-installed and is compatible with Linux/Mac/Windows. 
###
Additionally, this repository is configured to support GitHub Codespaces, offering an alternative seamless setup for cloud-based hacking. Using a custom CI/CD pipeline you could also deploy this environment to any cloud service of your choice for faster performance.

## Prerequisites
- [Git](https://git-scm.com/downloads)
- [Docker](https://docs.docker.com/get-docker/) (Version 20.10 or later)
- [VSCode](https://code.visualstudio.com/download) with [Dev Containers Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

## Setup
1. **Clone the repository:**
   ```bash
   git clone https://github.com/simonthorell/ctf-parrot-env.git
   ```

2. **Ensure Docker is running** on your local machine.
    - Using Linux, start Docker using terminal.
    ```bash
    sudo systemctl start docker
    ```
    - Using Mac/Windows, start the Docker desktop deamon.

3. **Open the project in VSCode:**
   ```bash
   cd ctf-parrot-env
   code .
   ```

4. **Rebuild in Container:**

   - Open the Command Palette (`CMD+Shift+P` on Mac, `Ctrl+Shift+P` on Windows/Linux).
   - Type and select `Remote-Containers: Rebuild and Reopen in Container`.

*Note! VS Code may automatically ask you to Rebuild and Reopen in container.*

## Included Tools
*List in progress!*

## Contribution
Contributions are welcome. Please fork the repository, make your changes, and submit a pull request.

## License
Distributed under the MIT License. See `LICENSE` for more information.