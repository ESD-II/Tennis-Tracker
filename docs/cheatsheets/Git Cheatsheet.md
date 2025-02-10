# Git Commands

Git is a version control system that aims to track changes in files and coordinate work among multiple people on software development projects. It allows developers to manage and store revisions of projects, enabling them to revert to previous states and collaborate efficiently. Git provides tools to branch, merge, and track changes in a repository, making it an essential tool for both individual and team-based development workflows.

## Table of Contents
- [Branches](#Branches)
- [Git Ignore](#Git-Ignore)
- [Submodules](#Submodules)
- [Tags](#Tags)
- [Stashing](#Stashing)
- [Rebasing](#Rebasing)
- [Reset & Revert](#Reset--Revert)
- [Cherry-picking](#Cherry-picking)
- [Sources](#Sources)

## Branches
Branching means you diverge from the main line of development and continue to do work without messing with that main line.

1. **Create and checkout a branch**
   - `git checkout -b [branch name]`
   - *Create then checkout a branch in individual commands:*
   - `git branch [branch name]`
   - `git checkout [branch name]`
   
2. **Delete a branch**
   - `git branch -d [branch name]`
   - *If the branch has not been fully merged but you still want to delete it:*  
     `git branch -D [branch name]`

3. **Push deleted branch to GitHub**
   - `git push origin --delete [branch name]`

4. **List all local and remote branches**
   - `git branch -a`
   
5. **Rename a branch**
   - `git branch -m [old name] [new name]`

6. **Switch to the previous branch**
   - `git checkout -`

## Git Ignore
A `.gitignore` file specifies intentionally untracked files that Git should ignore. Files already tracked by Git are not affected.

1. **Ignore a folder**
   - `[folder]/`
   - *Do not track [folder] or any files changed within it.*

2. **Ignore files by type**
   - `*. [filetype]`
   - *Do not track any files that are .[filetype].*
   - *Example: `*.log` ignores all `.log` files regardless of location if they are within the root directory.*

To make the content follow the ordered list format like in the bottom half, you can break down the steps into a numbered list. Here's how to structure it:

## Submodules
A submodule is essentially a Git repository embedded inside another Git repository. It allows you to include and manage external repositories as part of your project while keeping their history separate.

When you add a submodule to your project, it points to a specific commit in the submodule’s repository. This means you can keep your main project’s repository clean, while still being able to use code from the submodule.

1. **Add a submodule**
   - `git submodule add <repository-url> <path-to-submodule>`

2. **Clone a project with its submodules**
   - `git clone --recurse-submodules <repository-url>`

3. **Update the submodule to the latest commit**
   - `git submodule update --remote`

4. **Checkout a branch and update submodule at the same time**
   - `git checkout --recurse-submodules <branch>`

5. **Update submodule**
   - Go into the submodule folder.
   - `git submodule update --init --recursive`

6. **Clone a repository including submodules**
   - `git clone --recurse-submodules <repo_url>`

## Tags
Tags are references that point to a specific point in Git history.

1. **Create a tag**
   - `git tag -a [tag name] -m "[message]"`
   
2. **See all tags**
   - `git tag`
   
3. **See specific tag info**
   - `git show [tag name]`
   
4. **Rename a tag**
   - `git tag [old name] [new name]`
   
5. **Push tag to origin**
   - `git push origin [tag]`
   
6. **Tie a commit to a tag**
   - `git log --oneline`
   - Copy the commit hash (e.g., `1eb0cc7`) that you want to tag.
   - Tag the commit: `git tag v1.0.0 1eb0cc7`

## Fetch
Fetching is the process of retrieving the latest changes from a remote repository without merging them into the local branch. This allows one to see updates from other team members without modifying your current work.

- `git fetch origin` gets the latest commits from the remote repository named **origin**.  
- `git fetch -a` fetches updates from all remote branches.  

After fetching, you can review the changes and decide whether to merge or rebase them into your local branch using `git merge` or `git rebase`

## Stashing
Stashing is the process of temporarily saving changes in a branch without committing them. It is often used when one wants to switch branches without losing uncommitted changes.

1. **Stash changes**
   - `git stash`
   
2. **Apply the most recent stash**
   - `git stash apply`
   
3. **Apply a specific stash**
   - `git stash apply stash@{n}`
   
4. **List all stashes**
   - `git stash list`
   
5. **Drop a specific stash**
   - `git stash drop stash@{n}`
   
6. **Clear all stashes**
   - `git stash clear`

## Rebasing
Rebasing allows you to integrate changes from one branch into another by moving or rewriting commit history, often used to maintain a cleaner project history.

1. **Rebase current branch onto another branch**
   - `git rebase [branch]`
   
2. **Rebase interactively**
   - `git rebase -i HEAD~[n]`
   
3. **Abort an ongoing rebase**
   - `git rebase --abort`
   
4. **Continue rebase after fixing conflicts**
   - `git rebase --continue`

## Reset & Revert
Reset and revert are ways to undo changes in Git. Reset moves the branch pointer, while revert creates a new commit that undoes changes.

1. **Undo the last commit but keep changes**
   - `git reset --soft HEAD~1`
   
2. **Undo the last commit and discard changes**
   - `git reset --hard HEAD~1`
   
3. **Revert a commit (create a new commit that undoes changes)**
   - `git revert [commit hash]`
   
4. **Reset a file to the last committed version**
   - `git checkout -- [file]`

## Cherry-picking
Cherry-picking allows you to apply specific commits from one branch to another without merging the entire branch.

1. **Apply a commit from another branch**
   - `git cherry-pick [commit hash]`
   
2. **Cherry-pick multiple commits**
   - `git cherry-pick [commit1] [commit2] [commit3]`
   
3. **Abort a cherry-pick**
   - `git cherry-pick --abort`
   
4. **Continue cherry-picking after conflict resolution**
   - `git cherry-pick --continue`

## Sources
1. [Git Documentation](https://git-scm.com/doc)
2. [Git Book](https://git-scm.com/book/en/v2)
3. [Markdown Guide](https://www.markdownguide.org/)
