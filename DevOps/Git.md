<img src="https://camo.githubusercontent.com/eb3b3e1fb158135185a3a90ebe876e73c91ae87af0540c6c1864003d656d162d/68747470733a2f2f65787465726e616c2d636f6e74656e742e6475636b6475636b676f2e636f6d2f69752f3f753d687474707325334125324625324663616d6f2e716969746175736572636f6e74656e742e636f6d253246373466333761646265326366333032656464386234613733306136343938646265633764613435392532463638373437343730373333613266326637313639363937343631326436393664363136373635326437333734366637323635326537333333326536313664363137613666366536313737373332653633366636643266333032663331333233323331333433323266333833303339333833303339333333393264333033393636363132643631333133333333326433353332333133343264363336313335363536363635333736323339333733373333326537303665363726663d31266e6f66623d31" width=700px style="position:relative; left:22%; background-color:white;" >

# What is GIT?
*GIT is a distributed **Version Control System** (**VCS**). Git is a tool that helps multiple people work on the same code project or documents by tracking and managing changes to the files.*

# What is GitHub?
*GitHub is a web-based platform that facilitates version control and collaborative software development using Git. It allows multiple developers to work on projects simultaneously by providing tools for tracking changes, managing branches, and reviewing code. GitHub also supports issue tracking, project management, and continuous integration and deployment, making it a central hub for both open-source and private software projects.*

# What is VCS?
*Every time you make a change, whether it's adding a sentence to a document or altering a line of code, the VCS records and saves the outcome.*

# Why VCS?
- **Backup and Restore:** *Files are safe against accidental losses or mistakes.*
- **Collaboration:** *Multiple people can work on the same project simultaneously.*
- **Branching and Merging:** *Users can diverge from the main base of code, experiment, and then bring changes back in line without losing work.*
- **Tracking Changes:** *You can see specific changes made and by whom.*
<br>

## <span style="font-size: 31.3px;">Git Installation</span>
-  <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Ubuntu/Debian**</span>
```
# For the latest stable version for your release of Debian/Ubuntu
root@localhost:~# sudo apt-get install git -y
```
-  <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Fedora/CentOS**</span>
```
# For the latest stable version for your release of Fedora/CentOS
root@localhost:~# yum install git -y                                  # (Installed by Yum package manager)
root@localhost:~# dnf install git -y                                  # (Installed by DNF package manager)
```
-  <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **macOS**</span>
```
# Installing Git through Homebrew
$ brew install git
```
<br>

## <span style="font-size: 31.3px;">GitHub Account</span>
- <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Head to [GitHub](https://github.com/)**</span>
<br>

- <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Sign Up:**</span>
	- <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> *Click on the **"Sign Up"** button in the top right corner of the webpage*</span>
<br>

- <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Enter Your Information:**</span>
	- <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> *Fill out the signup form with your username, email address, and a strong password.*</span>
  - <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> *Choose a username that reflects your identity or area of interest.*</span>
<br>

- <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Verify Your Email Address:**</span>
	- <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> *Check your inbox for a verification email from GitHub.*</span>
  - <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> *Click on the link in the email to confirm your account.*</span>
<br>

- <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Welcome to GitHub!**</span>
	- <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> *Once you verify your email, you'll be welcomed to your new GitHub account homepage.*</span>
<br>

- <span span style="font-size:23px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Congratulations! You've successfully created your GitHub account.**</span>
---
<br>

## <span style="font-size: 27px;">Configure GIT with Username & Email</span>
-  <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **These commands set your username and email for all Git repositories on your system**</span>
```
# This command sets your Git username globally for all commits
root@localhost:~# git config --global user.name "{Git_Account_Name}"

# This command sets your Git email globally for all commits.
root@localhost:~# git config --global user.email "{Git_Account_email_id}"

# This command displays all the current Git configuration settings
root@localhost:~# git config --list
```
<br>

## <span style="font-size: 27px;">Creating Git Repository</span>
- <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Creates a new Git repository in a directory, enabling version control to track changes made to your project files**</span>
```
root@localhost:~# git init
```
<br>

## <span style="font-size: 27px;">Using `git status` to Check Repository Changes</span>
- <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **This command shows the current state of the working directory and staging area, indicating any changes, untracked files, and files staged for commit**</span>
```
root@localhost:~# git status                                         # To check for any change in the repo
```
<br>

## <span style="font-size: 27px;">Staging Changes with `git add`</span>
- <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **This command stages changes in the working directory for the next commit, preparing them to be included in the repository's history**</span>
```
root@localhost:~# git add * (for all files) or {filename}            # To add the modified files in staging area
```
<br>

## <span style="font-size: 27px;">Committing Changes with `git commit`</span>
- <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **This command records staged changes in the repository, along with a brief message describing the changes made**</span>
```
root@localhost:~# git commit -m "{Add_Comment}"                      # To add the changes in git repo
```
<br>

## <span style="font-size: 27px;">Listing Branches with `git branch`</span>
- <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **This command lists all the branches in the current repository**</span>
```
root@localhost:~# git branch
```
<br>

## <span style="font-size: 27px;">Viewing Commit History with `git log`</span>
-  <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **This command displays a list of commits in reverse chronological order, showing the commit hash, author, date, and commit message for each commit**</span>
```
root@localhost:~# git log                                            # To see the old commits history
```
<br>

## <span style="font-size: 27px;">Comparing Changes with `git diff`</span>
-  <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **This command shows the differences between the working directory and the staging area, highlighting changes that have not yet been staged or committed**</span>
```
root@localhost:~# git diff                                           # To see the difference of current version with last committed version
```
<br>

## <span style="font-size: 27px;">Viewing Commit Details with `git show`</span>
-  <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **This command displays detailed information about a specific commit, including the commit message, changes made, and metadata**</span>
```
root@localhost:~# git show {commit_ID}:{(where your file saved)}
```
<br>

## <span style="font-size: 27px;">Switching Branches or Commits with `git checkout`</span>
-  <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **The command git checkout switches to a different branch or commit, updating the working directory to match the specified branch or commit**</span>
```
root@localhost:~# git checkout {commit_ID} -- *                      # Revert all files in the working directory to their state at the specified commit
root@localhost:~# git checkout {branch_name} -- *                    # Update all files in the working directory to match their state in the specified branch
```
<br>

## <span style="font-size: 27px;">Reverting Changes with `git restore`</span>
-  <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **This command is used to revert changes in the working directory or staging area, discarding modifications and restoring files to their previous state**</span>
```
root@localhost:~# git restore . or filename                          # (. means all files)
```
-  <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **If we added the changes using git add then..**</span>
```
root@localhost:~# git restore --staged <file_path>                   # To unstage
root@localhost:~# git restore <file_path>                            # To discard changes in the working directory
```
-  <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Added changes to staging area (didn't commit) after this added more changes to file. To get the staged changes**</span>
```
root@localhost:~# git restore --worktree <filename>
```
<br>

## <span style="font-size: 27px;">Undoing Commits with `git reset`</span>
-  <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Keep Changes in Working Directory**</span>
```
# Move the current branch back by one commit, keeping changes in the working directory and index
root@localhost:~# git reset --soft HEAD^                            # Uncommit and keep the changes
```

-  <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Discard Changes in Working Directory**</span>
```
# Move the current branch back by one commit, discarding all changes in the working directory and index
root@localhost:~# git reset --hard HEAD^                            # Uncommit and discard the changes
```
<br>

## <span style="font-size: 27px;">Viewing Detailed Commit History with `git log`</span>
-  <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Last Two Commits Shows with Differences**</span>
```
# Shows the commit history with patch (diff) details for the last two commits
root@localhost:~# git log -p -2                                     # Last two commit with diff
```

-  <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Summary of Changes**</span>
```
# Displays the commit history along with a summary of changes for each commit, showing the number of insertions and deletions per file
root@localhost:~# git log --stat                                   # Summary of changes
```

-  <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Compact Commit History**</span>
```
# Displays the commit history in a compact format, with each commit shown on a single line, including the commit hash and message
root@localhost:~# git log --pretty=oneline
```

-  <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Customized Commit Format**</span>
```
Shows each commit's abbreviated hash (%h), author name (%an), relative date (%ar), and commit message (%s)
root@localhost:~# git log --pretty=format:"%h - %an, %ar:%s"
```

-  <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Search for Specific Changes**</span>
```
# Searches the commit history for changes that introduce or remove the specified string {function_name}
root@localhost:~# git log -S {function_name}
```

-  <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Search Commit Messages**</span>
```

# Searches the commit messages for the specified string "V2"
root@localhost:~# git log --grep="V2"
```

-  <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Commits Since a Specific Date**</span>
```
# Displays the commit history for commits made since January 1, 2024
root@localhost:~# git log --since="2024-01-01"
```

-  <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Commits Up to a Specific Date**</span>
```
# Displays the commit history for commits made up to and including January 1, 2024
root@localhost:~# git log --until="2024-01-01"
```

-  <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Commits by a Specific Author**</span>
```
# Displays the commit history for commits made by an author with the name "Rohan"
root@localhost:~# git log --author="Rohan"
```

-  <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Exclude Merge Commits**</span>
```
# Displays the commit history, excluding merge commits
root@localhost:~# git log --no-merges
```
<br>

## <span style="font-size: 27px;">Remote Repository</span>
- <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **A remote repository refers to a version of your project that resides on a network server or a hosted repository on the internet.**</span>
<br>

## <span style="font-size: 27px;">Creating a New Repository from the Command Line</span>
-  <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Initialize a new Git repository**</span>
```
root@localhost:~# git init
```

-  <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Add the README file to the staging area**</span>
```
root@localhost:~# git add README.md
```

-  <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Commit the changes with a message**</span>
```
root@localhost:~# git commit -m "first commit"
```

-  <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Rename the default branch to `main`**</span>
```
root@localhost:~# git branch -M main
```

-  <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Add a remote repository**</span>
```
root@localhost:~# git remote add origin git@github.com:Rohan/myrepo.git
```

-  <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Push the changes to the remote repository**</span>
```
root@localhost:~# git push -u origin main
```
<br>

## <span style="font-size: 27px;">Pushing an Existing Repository to a Remote Repository</span>
-  <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Add a remote repository**</span>
```
root@localhost:~# git remote add origin git@github.com:Rohan/myrepo.git
```

-  <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Rename the default branch to `main`**</span>
```
root@localhost:~# git branch -M main
```

-  <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Push the changes to the remote repository**</span>
```
root@localhost:~# git push -u origin main
```
<br>

## <span style="font-size: 27px;">Pushing Changes to Remote Repository with `git push`</span>
-  <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Push the committed changes in the local repository to the remote repository**</span>
```
root@localhost:~# git push  															# To push the committed changes to Remote Repo
```
<br>

## <span style="font-size: 27px;">Viewing Remote Repository URLs with `git remote`</span>
-  <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Display the URLs of the remote repositories associated with the current local repository**</span>
```
root@localhost:~# git remote -v
```
<br>

## <span style="font-size: 27px;">Pulling Changes from Remote Repository with `git pull`</span>
-  <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Fetches changes from a remote repository and integrates them into the current branch, updating the local repository with the latest changes from the remote**</span>
```
root@localhost:~# git pull  															# To fetch the latest files from the remote repository
```
<br>

## <span style="font-size: 27px;">Cloning a Remote Repository with `git clone`</span>
-  <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Clone a remote repository to your local machine, creating a local copy of the repository**</span>
```
root@localhost:~# git clone {https://Git_URL}
```
<br>

## <span style="font-size: 27px;">Creating a New Branch with `git branch`</span>
-  <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Create a new branch in your local repository**</span>
```
root@localhost:~# git branch {new_branch_name}
```
-  <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Switch to a new branch in your local repository**</span>
```
root@localhost:~# git checkout {new_branch_name}
```
-  <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Switch to the `main` branch**</span>
```
root@localhost:~# git checkout main
```
-  <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Merge the changes from the new branch into the `main` branch**</span>
```
root@localhost:~# git merge {new_branch_name}
```
-  <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Push a new branch to the remote repository**</span>
```
root@localhost:~# git push origin {new_branch_name}
```
<br>

## <span style="font-size: 27px;">Cleaning Untracked Files with `git clean`</span>
- <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Preview Untracked Files to be Removed**</span>
```
root@localhost:~# git clean -n											# Displays untracked files that would be removed
```
- <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Remove Untracked Files**</span>
```
root@localhost:~# git clean -f											# Removes untracked files
```
<br>

## <span style="font-size: 27px;">Git Tags</span>
- <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Create a tag with a message**</span>
```
root@localhost:~# git tag -a {tag_name} -m "{message}"
```
- <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Display information about a specific tag**</span>
```
root@localhost:~# git show {tag_name}
```
- <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Tag a specific commit**</span>
```
root@localhost:~# git tag -a {tag_name} {commit_ID}
```
- <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Remove a tag**</span>
```
root@localhost:~# git tag -d {tag_name}
```
- <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Push Tags to Remote**</span>
```
# Push a specific tag
root@localhost:~# git push origin {tag_name}

# Push all tags
root@localhost:~# git push origin --tags
```
- <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Create a new branch from a specific tag for future patches**</span>
```
root@localhost:~# git checkout -b version2 v2.0.0  					# Creates a new branch from the v2.0.0 tag
```
<br>

## <span style="font-size: 27px;">Git Rebase</span>
- <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Git rebase is a powerful feature that allows you to integrate changes from one branch into another. Unlike `git merge`, which preserves the history of both branches, `git rebase` rewrites the commit history. This can create a cleaner, more linear project history.**</span>
<br>

- <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Rebase Current Branch onto Another Branch**</span>
```
root@localhost:~# git rebase {branch_name}
```

- <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Allows you to interactively rebase commits starting from a specific commit. This can be used to edit, reorder, squash, or drop commits**</span>
```
root@localhost:~# git rebase -i {commit_id}
```

- <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Continues the rebase process after resolving conflicts**</span>
```
root@localhost:~# git rebase --continue
```

- <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Skips the current commit and continues the rebase process**</span>
```
root@localhost:~# git rebase --skip
```

- <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Aborts the rebase process and returns to the state before the rebase started**</span>
```
root@localhost:~# git rebase --abort
```

- <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Rebase a Feature Branch onto the Master Branch**</span>
```
root@localhost:~# git checkout feature_branch
root@localhost:~# git rebase master
```

- <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Rebases and merges the current branch with the specified branch, using fast-forward if possible**</span>
```
root@localhost:~# git rebase --merge {branch_name}
```

- <span span style="font-size:20px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Preserves merge commits during the rebase process**</span>
```
root@localhost:~# git rebase --preserve-merges {branch_name}
```
