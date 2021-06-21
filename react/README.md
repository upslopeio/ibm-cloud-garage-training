# React

> **NOTE** For windows users, run all commands from within Ubuntu (WSL)

## Create the React app

First, create a new React app:

```bash
cd ~
npx create-react-app react-intro
cd react-intro
```

## Start the React app

```bash
npm start
```

This should open http://localhost:3000

You should see a React welcome page.

## Run Tests

```bash
npm test
```

This starts an interactive test window. Tests should be green.

Press `q` or `CTRL+C` to exit.

## Open Gogs

Open the OpenShift Web Console

```bash
oc console
```

Open the App Menu (the 9-box menu)

Click "Git Dev"

![](../img/gogs-menu.png)

## Sign In (if needed)

Click Sign In

![](./img/01-gogs-sign-in.png)

Enter `userXX` and the password `password`

![](./img/02-gogs-username.png)

> NOTE: get your user number from your instructor

## Create Repository

Click "New Repository"

![](./img/03-gogs-new-repo.png)

Enter the name `react-intro`

![](./img/04-gogs-repo-name.png)

Click "Create Repository"

## Push Local Code to Gogs

Copy the command at the bottom of the screen

![](./img/05-gogs-command.png)

Paste the two lines in your Terminal, and use the following credentials:

- Username is `userXX`
- Password is `password`

Refresh your repository page

![](./img/06-gogs-code.png)
