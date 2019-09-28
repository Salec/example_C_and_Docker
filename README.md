## Instructions

### To build: **You neeed to execute this in the project folder**
```
docker build -t my-gcc-app .
```

### To run in docker:
```
docker run -it --rm --name my-running-app my-gcc-app
```

You are connected interactively to the image.
if you run it without the --rm parameter, the files with the accounts will  persist

### To generate executable in build
```
docker run --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp gcc:4.9 make
```

Now you can find the exec in build - is named main.out -

### To run locally
```
cd build 
./main.out
```


### To clean generated files
```
docker run --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp gcc:4.9 make clean
```



#### Original Instructions

from : https://hub.docker.com/_/gcc/

How to use this image
Start a GCC instance running your app

The most straightforward way to use this image is to use a gcc container as both the build and runtime environment. In your Dockerfile, writing something along the lines of the following will compile and run your project:
```
FROM gcc:4.9
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
RUN gcc -o myapp main.c
CMD ["./myapp"]
```
Then, build and run the Docker image:
```
$ docker build -t my-gcc-app .
$ docker run -it --rm --name my-running-app my-gcc-app
```
Compile your app inside the Docker container

There may be occasions where it is not appropriate to run your app inside a container. To compile, but not run your app inside the Docker instance, you can write something like:
```
$ docker run --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp gcc:4.9 gcc -o myapp myapp.c
```
This will add your current directory, as a volume, to the container, set the working directory to the volume, and run the command gcc -o myapp myapp.c. This tells gcc to compile the code in myapp.c and output the executable to myapp. Alternatively, if you have a Makefile, you can instead run the make command inside your container:
```
$ docker run --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp gcc:4.9 make
```