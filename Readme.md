## HOW TO USE
----------------------

1. Navigate to the root directory of your custom app, then copy `init-project.sh` and `push-update.sh` into it. After that, run the following commands:

    ```bash
    sudo chown {your_username}:{your_username} init-project.sh
    sudo chown {your_username}:{your_username} push-update.sh
    chmod +x init-project.sh push-update.sh
    ```

2. If the directory has already been initialized with Git before, remove the existing Git configuration:

    ```bash
    rm -rf .git
    ```

3. Once ready, initialize the Git repository by running:

    ```bash
    ./init-project.sh
    ```

4. To push your changes to GitHub, run:

    ```bash
    ./push-update.sh
    ```
