FROM archlinux:latest

RUN echo 'root:[ROOTPASS]' | chpasswd && yes | pacman -Syu && echo -e "\ny\n" | pacman -Sy zsh git sudo base-devel vim

RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh) && echo '/bin/zsh' | chsh root"

RUN groupadd -g 1000 [USERNAME]
RUN useradd -d /home/[USERNAME] -m [USERNAME] -u 1000 -g 1000
RUN echo "[USERNAME]:[USERPASS]" | chpasswd
RUN usermod -a -G wheel [USERNAME]
RUN echo "%wheel        ALL=(ALL)       ALL" >> /etc/sudoers

USER [USERNAME]
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh) && echo -e '[USERPASS]\n/bin/zsh\n' | chsh [USERNAME]"

ENTRYPOINT ["tail", "-f", "/dev/null"]
