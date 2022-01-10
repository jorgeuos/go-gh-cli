# go-gh-cli

A Go CLI tool for Github API

**Disclaimer**

I'm well aware of the official gh_api cli tool. This repo is purely for Go training and self purpose. Feel free to use it, download it, modify it, create feature requests or add issues. I will probably try to address all of your needs, but bare with me. I'm doing this on my own time for fun. I take no responsibility for any damage caused to you or your projects by using this application.

## Code structure

I'm gonna try to follow best practice, as described in the official [docs](https://go.dev/doc/code). I also read a bunch of good articles, blogposts, stackoverflow topics and watched a bunch of tutorials, especially about how to structure go apps.  
Find useful links in the bottom of this readme.

## Setup dev environment

The [Dockerfile](./Dockerfile) is set up to run a dev env for snadbox mode or if you want to build your binaries.
### The dev sandbox

```docker
docker build --target dev . -t go
docker run -it -v "$PWD/ggc":/go/src/github.com/jorgeuos/go-gh-cli go sh
```
Now we're inside the container:
```golang
go version
go help
```

### Build your app and run it

Build image:
```
docker build --target build . -t go-build
```

### Build a runnable docker with the executable
Run go app from image:
```docker
docker build . -t ggc
```

## Known Issues
If you're experiencing issues with the build, it could be because GOPATH in the docker build is not set, weird I know, or other issues that I yet have to discover, e.g. using local packages/modules in import, which usally never is a good idea anyways and goes against the go standards(recommendations).  
A simple workaround would be to remove the `RUN go build` command and try run it manually. The container won't be able run the compiled executable, but this way you can get the binary mounted to your app dir.


Compile go app from image:
```docker
docker run -it -v "$PWD/ggc":/go/src/github.com/jorgeuos/go-gh-cli go-build go build
```

## A collection of useful links 

So I started a cuople of days ago to try to build a CLI tool in Go. I thought to myself that this should be an easy task. But since I have black belt in the art of side tracks, I ended up deep diving into Go projects source code, reading about strucural patterns and watching videos. So this project is probably 95% learning and 5% code, usally I do the other way around 😁.

* Go Docs - How to Write Go Code => [Link](https://go.dev/doc/code)
* Go Standard Project Layot - A community effort => [Link](https://github.com/golang-standards/project-layout)
* Go by example - A must read for beginners => [Link](https://gobyexample.com/)
* Marcel Dempers YouTube series => [Link](https://github.com/marcel-dempers/docker-development-youtube-series/tree/master/golang/introduction)
* Workshop presentation by Steve Francia aka SPF13 and Ashley McNamara - Building An Awesome CLI App In Go – OSCON 2017  
    (Can't believe all the project this guy is involved in, I mean is there anything he din't contribute to?) => [Link](https://spf13.com/presentation/building-an-awesome-cli-app-in-go-oscon/)
* Steve Francia - spf13 => [Link](https://github.com/spf13)
    * Cobra - Pretty much the standard CLI Library => [Link](https://github.com/spf13/cobra)
    * Viper - Conf for Go apps, works well with Cobra => [Link](https://github.com/spf13/viper)
    * Hugo => [Link](https://github.com/gohugoio/hugo)
    * 7 common mistakes in Go and when to avoid them => [Link](https://www.youtube.com/watch?v=29LLRKIL_TI&ab_channel=DataCouncil)
* Some other good Go projects inspo:
    * The Github CLI => [Link](https://github.com/cli/cli)
    * K8s - Everyday I'm shuffeling containers! => [Link](https://github.com/kubernetes/kubernetes)
    * Grafana - One of my most used tools, for monitoring at least => [Link](https://github.com/grafana/grafana)
    * Loki => [Link](https://github.com/grafana/loki)
    * Terraform => [Link](https://github.com/hashicorp/terraform)
    * Vault => [Link](https://github.com/hashicorp/vault)
    * Prometheus => [Link](https://github.com/prometheus/prometheus)
    * Etherium => [Link](https://github.com/ethereum/go-ethereum)
* Article - How to create a CLI tool in Golang => [Link](https://levelup.gitconnected.com/tutorial-how-to-create-a-cli-tool-in-golang-a0fd980264f)
* Article - How to structure a Go project? => [Link](https://vsupalov.com/go-folder-structure/)
* Article - How to Structure a Go Command-Line Project => [Link](https://medium.com/swlh/how-to-structure-a-go-command-line-project-788c318a1d8c)
* Go CLI solutions => [Link](https://go.dev/solutions/clis)
* go.mod files - go.mod and I had a rough patch, but we're good now. => [Link](https://go.dev/ref/mod#go-mod-file)
* Stackoverflow - Oh Stackoverflow... *"The master has failed more times than the beginner has even tried."* - by Stephen McCranie, 2017, or ancient Chinese saying, this quote gives me hope that I still some day will learn Go 😅.  
But in the end I figured out that it, actually, might be an issue with Docker. So there might be hope for me still.
    * How can I "go run" a project with multiple files in the main package? => [Link](https://stackoverflow.com/questions/28081486/how-can-i-go-run-a-project-with-multiple-files-in-the-main-package)
    * Docker build fails with local go package import => [Link](https://stackoverflow.com/questions/46875561/docker-build-fails-with-local-go-package-import)
    * Does it make sense to have two packages in the same directory? => [Link](https://stackoverflow.com/questions/20427890/does-it-make-sense-to-have-two-packages-in-the-same-directory)
    * Accessing local packages within a go module (go 1.11) => [Link](https://stackoverflow.com/questions/52026284/accessing-local-packages-within-a-go-module-go-1-11)
    * Go: local import in non-local package => [Link](https://stackoverflow.com/questions/30885098/go-local-import-in-non-local-package)
    * Import cycle not allowed => [Link](https://stackoverflow.com/questions/28256923/import-cycle-not-allowed)
    * Error in importing custom packages in Go Lang => [Link](https://stackoverflow.com/questions/25501875/error-in-importing-custom-packages-in-go-lang)
    * "package XXX is not in GOROOT" when building a Go project => [Link](https://stackoverflow.com/questions/61845013/package-xxx-is-not-in-goroot-when-building-a-go-project)


