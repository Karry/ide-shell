# IDE Shell

This set of scripts and docker containers allow me to be brave!

## What does that mean?

When using Github Copilot, it may run commands that may potentially harm my system. 
Remove files, force-push to the default branch, deleting deployments with kubectl... 
All because IDEs like CLion or Idea run the terminal on host machine without any kind of isolation.

For that reason, you should approve any command suggested by Copilot before executing it.
But then, vibecoding is slow.

`shell` script in this repository starts a docker container with basic tools, mounted project directory,
Docker socket and working internet access. Nothing more, nothing less. No exposed home directory, no credentials...
So, with this kind of isolation, I'm confident enough to **enable brave mode in Copilot plugin**.

## How to use it?

### Setup CLion or Idea
 - checkout this repository
 - Open Settings | Tools | Terminal
 - Change "Shell path" to point to `shell` script in this repository
 - Be aware that shell script provide Copilot access to the Docker socket,
   so, you should set explicit approval to run privileged containers 
   (Settings | Tools | Github Copilot | Chat )
   and add there `/^docker\b.*--privileged/s` to "Terminal Auto-Approve"
   (name of the list is confusing, but it is blacklist for auto-approved commands)
 - Another blacklisted pattern may be `/^docker\b.*exec/s` if you want to avoid opening 
   root shells in the other containers.

Warning: with access to the docker socket, Copilot may create bash script that 
run privileged containers and it will not be detected by the IDE!
Or it may mount your home to container and read your credentials.

So, it may protect you from accidental damage, but not from malicious code.

### Add more tools
 - Edit `*.Dockerfile` to add more tools you may need
 - Start root shell in existing container: `docker exec --user=root -it libosmscout-15072 /bin/bash`
   And install whatever you need.
