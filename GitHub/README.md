
# Manual Github Configuration
Though this is not recommended as it it such a **huge waste of time** to manually do things. This can be helpful for security reasons, or you wanna look like a the dweebest hacker in existence. Jokes aside, this helps you learn a bit of SSH and Git bash commands

## Initial steps

Create the repo in Github.com

**Generate SSH in GIT bash**

Replace your_email@example.com with your actual email. *Duh!*

```
sh-keygen -t rsa -b 4096 -C "your_email@example.com"
```
Press enter here
```
Enter a file in which to save the key (/c/Users/you/.ssh/id_rsa):[Press enter]
```
Enter a passphrase, it's gonna be your password dummy! Remember the passphrase by keeping it in a safe location.
```
Enter passphrase
```
**Adding your SSH key to the ssh-agent**

Ensure the ssh-agent is running
```
eval $(ssh-agent -s)
```
Add your SSH private key to the ssh-agent.
```
ssh-add ~/.ssh/id_rsa
```
Copy the SSH key to your clipboard
```
clip < ~/.ssh/id_rsa.pub
```
Paste in: Github > Setting > SSH

**Testing your SSH connection**
```
ssh -T git@github.com
```


----------
## Project Folder

**Initialize git**

Initialize Gitbash in *local* project folder
```
git init
```
**Check git user-email**
```
git config user.email
```
**Edit Git Username on specific project**
```
git config user.email "35815382+Sunnie-Evergale@users.noreply.github.com"
```
or

**Edit Git Username globally**
```
global user.email "35815382+Sunnie-Evergale@users.noreply.github.com"
```
**Set repo url**

Get the SSH url in github and manually change to this
```
git remote set-url origin ssh://git@github.com/Sunnie-Evergale/janua.git
```
or

**Edit git config manually**
```
[remote "origin"]
	url = ssh://git@github.com/Sunnie-Evergale/DefaultConfigs.git
	fetch = +refs/heads/*:refs/remotes/origin/*
[user]
	email = 35815382+Sunnie-Evergale@users.noreply.github.com
[branch "master"]
	remote = origin
	merge = refs/heads/master
```
**Pull**

Pull the existing git repo
```
git pull
```
----------


## Extra Reading

**Adding/Changing a passphrase**

You can change the passphrase for an existing private key without regenerating the keypair by typing the following command:
```
ssh-keygen -p
```

**Auto-launching ssh-agent on Git for Windows**

Copy the following lines and paste them into your **.profile** or .bashrc file in Git shell:
 ```
 env=~/.ssh/agent.env

agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }

agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
    ssh-add
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
    ssh-add
fi

unset env
 ```