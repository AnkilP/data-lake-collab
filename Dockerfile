FROM gcr.io/spark-operator/spark-py:v3.0.0
LABEL maintainer="Ankil Patel <ankil335@gmail.com>"

WORKDIR /home/user

USER root
RUN useradd user && chown -R user /home/user
USER user

COPY requirements.txt /home/user
ENV PATH "$PATH:/home/user/.local/bin"

RUN pip3 install --upgrade pip
RUN pip3 install --user --no-cache-dir -r /home/user/requirements.txt

FROM alpine:latest AS prereq-build
LABEL maintainer="Ankil Patel <ankil335@gmail.com>"

RUN apk add --update --no-cache g++ make yasm m4 linux-headers perl

RUN wget http://mpir.org/mpir-3.0.0.tar.bz2 && tar -xjf mpir-3.0.0.tar.bz2 && rm mpir-3.0.0.tar.bz2
WORKDIR  mpir-3.0.0
RUN ./configure --enable-cxx --prefix=/mpir && make
RUN make check
RUN make install
RUN rm -rf /mpir/share



