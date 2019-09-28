FROM gcc:4.9 as build
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
RUN make
CMD ["./main.out"]

