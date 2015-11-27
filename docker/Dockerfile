FROM ubuntu:wily
ENV DEBIAN_FRONTEND noninteractive
MAINTAINER Nahuel Cuesta Luengo

RUN apt-get update -q && \
    apt-get install -y gnuplot \
                       python-pygments \
                       texlive-binaries \
                       texlive-lang-spanish \
                       texlive-latex-base \
                       texlive-latex-extra \
                       xindy 
RUN apt-get install -y make

WORKDIR /latex
VOLUME ["/latex"]

COPY ./entrypoint.sh /bin

ENTRYPOINT ["/bin/entrypoint.sh"]
