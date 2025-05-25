## Prepared
1. **Get your github token**
   Settings -> Developer Settings -> Personal access tokens
2. **Export your github token**
   ```bash
   export GITIHUB_TOKEN=ghp_yourToken
   ```
## Guide
1. **Save the script**  
   Download or copy the `repoer` script into a folder on your `PATH`, for example:
   ```bash
   mkdir -p ~/bin
   cp repoer ~/bin/
   ```
   (Ensure ~/bin is in your PATH.)
   ```bash
   export PATH="$HOME/bin:$PATH"
   ```
2. **Make it executable**
    ```bash
   chmod +x ~/bin/repoer
    ```
3. **Use the CLI**
    ``` bash
    repoer create <repo-name> [description] [isPrivate]
    ```