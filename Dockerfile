############################################################ 
# Dockerfile based on Ubuntu Image (NajlaBH-MAY-2017)
############################################################ 

# Set the base image to use to Ubuntu
FROM ubuntu:latest

# Set the file maintainer (your name - the file's author) 
MAINTAINER "Najla BEN HASSSINE" <bhndevtools@gmail.com>

USER root

#ENV
ENV DEBIAN_FRONTEND noninteractive
ARG DISPLAY=local
ENV DISPLAY ${DISPLAY}
ENV HOME /home/najlanetbeans

RUN export DEBIAN_FRONTEND=noninteractive
RUN export LANGUAGE=en_US.UTF-8
RUN export LANG=en_US.UTF-8
RUN export LC_ALL=en_US.UTF-8


#PACKAGES NEEDED INSTALL
#RUN apt-get update && apt-get install --assume-yes apt-utils
RUN apt-get update -yy -q && apt-get upgrade -yy -q
RUN apt-get install -yy -q sudo vim less net-tools inetutils-ping \
            curl git telnet nmap socat dnsutils netcat tree htop unzip sudo \
            software-properties-common pkg-config wget \
            build-essential python-dev liblapack-dev libatlas-dev \
            gfortran libfreetype6 libfreetype6-dev libpng12-dev python-lxml \
            libyaml-dev g++ libffi-dev libhunspell-1.3-0 libpgm-dev \
            libsodium-dev

RUN apt-get install software-properties-common
RUN sudo apt-get update && apt-get install apparmor -y
RUN sudo apt-get install libxrender1 libxtst6 libxi6 dialog -y 

RUN sudo rm -rf /var/lib/apt/lists/*

RUN sudo apt-get update -y
	
#___JAVA INSTALL ___
USER root
# Install Java.
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update -y && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

RUN sudo apt-get install oracle-java8-set-default
RUN java -version

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle


#___JAVA NETBEANS ___

#RUN adduser --disabled-login --disabled-password najlanetbeans 
RUN adduser --disabled-password --gecos '' najlanetbeans
RUN mkdir -m 700 /data && \
    mkdir -m 700 $HOME/.netbeans && \
    mkdir -m 700 $HOME/NetBeansProjects && \
    chown -R najlanetbeans:najlanetbeans /data $HOME/.netbeans $HOME/NetBeansProjects

#___JAVA MAVEN ___

RUN sudo apt-get install -y software-properties-common
RUN sudo apt-add-repository universe
RUN sudo apt-get update -y 
RUN apt-get install -y maven


RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get update -y


EXPOSE 4040 8080 8081
EXPOSE 9001
EXPOSE 9000
EXPOSE 4567
EXPOSE 4040
EXPOSE 7077

RUN wget http://bits.netbeans.org/netbeans/8.2/community/zip/netbeans-8.2-201610071157.zip -O ~/netbeans.zip && \
    unzip ~/netbeans.zip -d ~ && \
    rm ~/netbeans.zip


#CMD [ "/home/najlanetbeans/netbeans/bin/netbeans", "--jdkhome", "/opt/jdk" ]

RUN useradd najlanetbean \
    && mkdir -p /etc/sudoers.d/ \
    && echo "najlanetbean ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/najlanetbean \
    && chmod 0440 /etc/sudoers.d/najlanetbean

# Define working directory.
RUN sudo chmod -R 777 /home/najlanetbeans/netbeans
RUN sudo mkdir -p /home/najlanetbeans/NetbeansProject
RUN sudo chmod -R 777 /home/najlanetbeans/NetbeansProject

USER najlanetbean
#----------------------------- Be aware user access 777 not recommended -------------
RUN sudo mkdir -p /home/najlanetbean/.netbeans/8.2
RUN sudo chmod -R 777 /home/najlanetbean/.netbeans/8.2
RUN sudo mkdir -p /home/najlanetbean/.cache/netbeans/8.2/lastModified
RUN sudo chmod -R 777 /home/najlanetbean/.cache/netbeans/8.2/lastModified
RUN sudo chmod -R 777 /home/najlanetbeans/NetbeansProject

RUN sudo chmod -R a+rwX /home/najlanetbean/
RUN sudo chmod -R a+rwX /home/najlanetbeans/netbeans/
RUN sudo chmod -R a+rwX /home/najlanetbeans/NetbeansProject

ENV HOME /home/najlanetbean

WORKDIR /home/najlanetbeans

CMD [ "/home/najlanetbeans/netbeans/bin/netbeans" ]
