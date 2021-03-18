FROM ubuntu
COPY summCounter.s .
RUN apt update
RUN apt install gcc -y
RUN apt install libc6-dev-i386 -y
RUN gcc -m32 summCounter.s -o prog -g
