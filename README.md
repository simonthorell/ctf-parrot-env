# CTF Parrot Environment

This VS Code environment is specifically setup for Capture The Flag (CTF) challenges, using the security tools of  Parrot Security OS (headless version) within a Docker container. It includes several additional toolkits pre-installed as well and is compatible with Linux/Mac/Windows. 

## Key Features

- **Pre-installed Toolkits**: Comes with a wide array of security tools from Parrot Security OS, ready out of the box as well as several additional security/hacking tools.
- **X11 Forwarding**: Supports X11 forwarding with VNC using fluxbox to run GUI applications in a headless setup.
- **GitHub Codespaces**: Effortlessly set up in a cloud environment with GitHub Codespaces, enabling cloud-based hacking without hassle.
- **Cross-Platform**: Works out of the box with Linux/Mac/Windows.

## Prerequisites
- [Docker](https://docs.docker.com/get-docker/) (Version 20.10 or later)
- [VSCode](https://code.visualstudio.com/download) with [Dev Containers Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
- [Git](https://git-scm.com/downloads)
- [RealVNC Viewer - Lite](https://www.realvnc.com/en/connect/plan/lite/) [optional]

## Setup
1. **Clone the repository:**
   ```bash
   git clone https://github.com/simonthorell/ctf-parrot-env.git
   ```

2. **Ensure Docker is running** on your local machine:
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

5. **Open RealVNC Viewer** on your local machine:
    - Sign in to your RealVNC account (or create a new account) to get Lite/Free version.
    - Connect to `localhost:5901`.
    - Enter Password: `parrot` *(or as defined in Dockerfile)*.
    - In the VS-code terminal, run `xeyes` or `ghidraRun` to make sure the X11 VNC forwarding is working for GUI applications as we are running a headless version of parrot OS.

## Included Tools
*List in progress!*

## Contribution
Contributions are welcome. Please fork the repository, make your changes, and submit a pull request.

## License
Distributed under the MIT License. See `LICENSE` for more information.