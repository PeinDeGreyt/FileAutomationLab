# FileAutomationLab

A PowerShell practice project that finds files older than seven days and previews or copies them into an Archive folder.

## Project contents

- `FileAutomation.ps1` — checks file dates and copies qualifying files.
- `SampleFiles/` — sample text files for testing.
- `.gitignore` — excludes temporary files, logs, and the generated Archive folder.

## Run the project

Open PowerShell in this folder.

1. Allow scripts for this PowerShell session if your system blocks local scripts:

   `Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass`

2. Set two sample files to dates older than seven days:

   ```powershell
   (Get-Item .\SampleFiles\old-report.txt).LastWriteTime = (Get-Date).AddDays(-15)
   (Get-Item .\SampleFiles\old-notes.txt).LastWriteTime = (Get-Date).AddDays(-10)
   ```

3. Run the script in preview mode (the default):

   `./FileAutomation.ps1`

   `-WhatIf` displays the planned copy operation without copying files.

4. If the preview is correct, perform the copy:

   `./FileAutomation.ps1 -ApplyChanges`

5. Check the result:

   `Get-ChildItem ./Archive`

## Git workflow

Run these commands from the `FileAutomationLab` folder:

```powershell
git init
git status
git add .
git status
git commit -m "Initial file automation project"
git log --oneline
```

Create an empty GitHub repository named `FileAutomationLab`, then connect and push:

```powershell
git remote add origin YOUR_REPOSITORY_URL
git branch -M main
git push -u origin main
```

Replace `YOUR_REPOSITORY_URL` with the URL of your own empty GitHub repository.

## Screenshots to capture yourself

1. PowerShell showing the script preview output.
2. `git status` after `git init`.
3. `.gitignore` and `git status`.
4. Successful commit and `git log --oneline`.
5. Successful `git push`.
6. Your GitHub repository showing the uploaded files.

Do not use example or someone else's screenshots. Capture your own screen after performing each step.

## Reflection prompts

Write your own 3–5 sentence answers after completing the activity:

1. How does Git help you track changes to your project?
2. Why is `-WhatIf` useful when testing file-management commands?
3. What was the most challenging part of the activity, and what did you learn from it?
