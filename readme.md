## Prepared
1. **Get your github token**
   Settings -> Developer Settings -> Personal access tokens
2. **Export your github token**
   ```bash
   export GITIHUB_TOKEN=ghp_yourToken
   ```
## Guide
1. **Save the script**  
   Download or move the `repo` script into a folder on your `PATH`, for example:
   ```bash
   mv repo ~/bin/
   ```
   (Ensure ~/bin is in your PATH.)
2. **Make it executable**
    ```bash
   chmod +x ~/bin/repo
    ```
3. **Use the CLI**
    ``` bash
    repo create <repo-name> [description] [isPrivate]
    ```