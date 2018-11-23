FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y build-essential make git && \
    apt-get clean

RUN cd /usr/src && git clone -b BenchNov2018 https://github.com/klausseiler/sqlite-bench.git
# Alternative local build
# COPY . /usr/src/sqlite-bench/
RUN mkdir /testdb
WORKDIR /usr/src/sqlite-bench
RUN make
ENV PATH /usr/src/sqlite-bench:$PATH

ENTRYPOINT ["sqlite-bench", "--raw=1"]
CMD ["--help"]
