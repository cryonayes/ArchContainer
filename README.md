# Arch Linux with GUI

### An Arch Linux container with GUI support.  
### This container uses host machine's X11 server for displaying.  

## Installation
    [USERNAME] = username for container user  
    [USERPASS] = password for container user  
    [ROOTPASS] = password for container root  
    [HOST_USER_ID] = uid of host user

* Change ```[USERNAME]```, ```[USERPASS]``` and ```[ROOTPASS]``` fields in ```Dockerfile```

* Change ```[USERNAME]``` and ```[HOST_USER_ID]``` fields in ```docker-compose.yml```


```bash
docker-compose build
docker-compose up -d
```

## Shortcut to container (Optional)
Add this line into your ```.bashrc``` or ```.zshrc```
```bash
alias arch="docker exec -it arch_gui /bin/zsh"
```

### Arch container includes:
* base-devel
* git
* sudo
* zsh
* vim
