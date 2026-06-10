#BLOCK A
#FROM defines the base image, the starting point of our container, instead of start from cero.
#Use kalilinux/kali-rolling image because it is continuously updated and is always up to date.
#All the tools that we install below are applied to this image
FROM kalilinux/kali-rolling:latest
#BLOCK B
#When it comes to create a Image, Docker builds images in "layers". Each instruction creates a new layer that get cached.
#So the reason to the order is important because if you modify the first lines the other layers enter in the rebuild, but
#if you only modify the lastest layers in the Docker the other layers dont rebuild only the last ones because Dockerfile read up to down. 
 

#BLOCK C
#ENV come from Enviroment Variables
#ENV sets environment variables that persist throughout the build and container run. Like globlal settings.
# DEBIAN_FRONTEND=noninteractive: Says to the apt dont make interactive questions, an example when you try donwload some thing most of the time need a confirmation Y/N
#so when you rebuild to make the enviroment nobody can accepts that things and and prevents it from freezing.
#LANG & LC_ALL: sets the default lenguage and also provides the chance to use special characters. 
#TERM: Ensures terminal can supports colors.
# \: This inverted slash is useful to when you try to write commands instead of write a large one you can divided in differents lines like this:
ENV DEBIAN_FRONTEND=noninteractive \
    LANG=es_ES.UTF-8 \
    LC_ALL=es_ES.UTF-8 \
    TERM=xterm-256color





#BLOCK D
#Wireshark is a network protocol analyzer, called a packet analyzer, designed to provide visibility into the traffic that occurs on a network or between machines.
#Most of the time during the installation Wireshark ask if non-root users can capture packages.
#Remember the before configurations, the build is not interactive, so use debconf-set-selections to pre-answer "true".
#In this case are we root all the time so debconf-set-selections respond "false" in advance.  
RUN echo "wireshark-common wireshark-common/install-setuid boolean false" \
    | debconf-set-selections



#BLOCK E
#IMPORTANT: The use of && to make a chain of commands so, if the last commands fail the next command not run. 
#apt-get update: This update the list of packages.
#apt-get install: this is for the installations of all the packages of the tools you want in the image.
#-y: Respond (yes) to all the questions of each confirmation to instalation for the packages
#--no-install-recommends: Only install the "essentials" and refuse the extras to save storage.

#The reason to make a big RUN instead of multiple ones is beacuase for each run make a layer, so more layers make a more big image.
#And also less layers when you modify lines make the rebuild less longer. 

RUN apt-get update && apt-get install -y --no-install-recommends \
    \
    #Text editors, useful for scripting.
    neovim \
    vim \
    zsh \
    bash-completion \
    \
    #Fourth generations tools
    #You can see tools for text processing and filtering tools like grep.
    perl \
    make \
    gawk \
    sed \
    grep \
    \
    #Basic UNIX Utilities
    # coreutils give you cat, ls, head, tail, sort, cut, tr, etc.
    # findutils provides find y xargs.
    # procps (process management) ps, top, kill.
    # less = pager to read long files.
    # tree = You can see the directories like a tree
    # jq = Processes JSON from the command line.
    coreutils \
    findutils \
    procps \
    less \
    tree \
    jq \
    \
    #Manual pages
    #The base image of Kali dont includes information, for practical porpuses reinstall it.
    man-db \
    manpages \
    manpages-posix \
    \
    #Basic web and download utilities
    curl \
    wget \
    git \
    git-lfs \
    ca-certificates \
    locales \
    \
    #Linter tool for check and report error (like scripting in bash)
    shellcheck \
    \
    #Network recognition and scanning
    #nmap = Popular port scanner.
    #masscan = Massive scan of big range of IPs
    nmap \
    masscan \
    \
    #Network packet capture and analysis
    #tcpdump = classic terminal-based capture tool.
    #tshark = terminal-based version of Wireshark.
    tcpdump \
    tshark \
    \
    #Varied network utilities
    netcat-traditional \
    socat \
    dnsutils \
    whois \
    traceroute \
    mtr-tiny \
    iproute2 \
    net-tools \
    iputils-ping \
    \
    #Tor and similars for anonymity
    # tor = Tor web client
    # torsocks = Wrapped for every command pass with Tor
    # proxychains4 = Chain multiple proxies
    # obfs4proxy = Obfuscates Tor traffic to evade blocking.
    tor \
    torsocks \
    proxychains4 \
    obfs4proxy \
    \
    #Command-line tool that simplifies interaction with HTTP servers and APIs.
    httpie \
    \

#BLOCK F
#We use 'sed' to uncomment the Spanish locale line inside /etc/locale.gen.
#Then 'locale-gen' compiles that locale so the system can use it.
 && sed -i 's/# es_ES.UTF-8/es_ES.UTF-8/' /etc/locale.gen \
 && locale-gen \
 \

 #BLOCK G
#apt-get clean: Clears out the local repository of retrieved package files.
#rm -rf /var/lib/apt/lists/* :deletes the cached package lists. 
#Doing this in the big RUN layer as the installation prevents these useless 
#temporary files from taking up megabytes of space in the final Docker image.
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

 #BLOCK H
 #In default Docker use sh, for RUN commands. 
 #Also Sh is older than Bash, and Bash include more features like the use of [] or [[]].
 #CHnage the configuration to bash so we can use advanced bash features
 #in any subsequent RUN commands during the build process
SHELL ["/bin/bash", "-c"]

# BLOCK I
# WORKDIR sets the default directory for any subsequent RUN, CMD, or ENTRYPOINT instructions.
#Sets Workspaces here to the terminal run near to the class files.
WORKDIR /workspaces


#BLOCK J
#This configures Git globally for the container system.
#safe.directory '*': Prevents ownership errors by trusting all directories.
#init.defaultBranch main: Establishes main as the starting branch for new repositories.
#pull.rebase false: Forces standard merge commits instead of rebasing during a git pull.
#git lfs install --system: Initializes Git Large File Storage globally to handle bulky assets seamlessly.
RUN git config --system --add safe.directory '*' \
 && git config --system init.defaultBranch main \
 && git config --system pull.rebase false \
 && git lfs install --system

# BLOCK K
# 'chsh' changes the login shell. Here, we are changing the root user's 
# default shell from bash to zsh.
RUN chsh -s /usr/bin/zsh/ root


# BLOCK L
# A "heredoc"  allows us to pass a multi-line block of text into 
# a command without writing multiple 'echo' statements.
# The PROMPT variable configures how the terminal prompt looks with colors, and characters like ok when
#a command runs correctly and notok when the command fails.
RUN cat>> /root/.zshrc <<'EOF'

PROMPT='%F{cyan}[Andres_Pesantez]%f %F{yellow}%1~%f %(?.%F{green}ok%f.%F{red}notok %?%f) %# '
EOF

CMD ["/usr/bin/zsh"]



