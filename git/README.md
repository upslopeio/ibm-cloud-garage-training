# Cheatsheet

## Add New Content

Default branch is either `master` or `main`.

```bash
git add -A
git commit -m "message"
git pull
git push origin <branch name>
```

> If you forget the `-m` flag in git commit, and it opens VI just type ESCAPE + `:q`

## Create a new branch

```bash
git checkout -b <branch name>
```

## Switch branches

```bash
git checkout <branch name>
```

## Git merge

Let's say you are in a branch named `user-30` and you want to pull in changes from master:

```bash
git checkout master
git pull
git checkout user-30
git merge master
```
