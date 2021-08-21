FROM archlinux:latest

RUN echo 'root:[ROOTPASS]' | chpasswd && yes | pacman -Syu && echo -e "\ny\n" | pacman -Sy zsh git xorg-xauth sudo base-devel

RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh) && echo '/bin/zsh' | chsh root"

RUN useradd -m [USERNAME] && echo "[USERNAME]:[USERPASS]" | chpasswd && usermod -a -G wheel [USERNAME] && echo "%wheel        ALL=(ALL)       ALL" >> /etc/sudoers

USER [USERNAME]
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh) && echo -e '[USERPASS]\n/bin/zsh\n' | chsh [USERNAME]"

RUN echo -e 'cd \n\
touch ~/.Xauthority \n\
COOKIE=`cat ~/.dockerCookie` \n\
sh -c "xauth add $DISPLAY $COOKIE"' >> ~/.zshrc

ENTRYPOINT ["tail", "-f", "/dev/null"]
