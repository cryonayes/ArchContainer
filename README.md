# Arch Linux with GUI

### An Arch Linux container with GUI support.  
### This container uses host machine's X11 server for displaying.  

## Installation
Append this line into host user's ```.profile``` file
```bash
xauth list | awk -F' '  'NR==1{print $2 " " $3}' > ~/.dockerCookie
```

    [USERNAME] = username for container user  
    [USERPASS] = password for container user  
    [ROOTPASS] = password for container root  
    [HOST_USERNAME] = your username on host machine  

* Change ```[USERNAME]```, ```[USERPASS]``` and ```[ROOTPASS]``` fields in ```Dockerfile```

* Change ```[HOST_USERNAME]``` and ```[USERNAME]``` fields in ```docker-compose.yml```


```bash
docker-compose build
docker-compose up -d
```

## Shortcut to container (Optional)
Add this line into your ```.bashrc``` or ```.zshrc```
```bash
alias darch="docker exec -it archlinux /bin/zsh"
```

### Arch container includes:
* base-devel
* git
* sudo
* zsh