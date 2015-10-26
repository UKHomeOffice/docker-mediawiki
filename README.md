# docker-mediawiki

[![Build Status](https://travis-ci.org/UKHomeOffice/docker-mediawiki.svg?branch=master)](https://travis-ci.org/UKHomeOffice/docker-mediawiki)

For this to work, PHP will be running in another container separate to mediawiki
This will be handled currently as a sidekick container in a pod for Kubernetes, but also could be
just a bound container also.

For additional extensions, modify the extensions.txt with the git hash. These can be found at https://extdist.wmflabs.org/dist/extensions/ .
The contents of the file will look like

```
TwoFactorAuthentication:3e8f4ce
```
### Prerequisities


In order to run this container you'll need docker installed.

* [Windows](https://docs.docker.com/windows/started)
* [OS X](https://docs.docker.com/mac/started/)
* [Linux](https://docs.docker.com/linux/started/)

### Usage

#### Container Parameters

Parameters passed to the container will be passed onto Selenium Server.

```shell
docker run -e MEDIAWIKI_VERSION=<version> \
       quay.io/ukhomeofficedigital/mediawiki:v0.5.1 \
       
```

Passing no parameters will start mediawiki 

```shell
docker run \
       quay.io/ukhomeofficedigital/mediawiki:v0.5.1
```

You can also run arbitrary stuff

```shell
docker run \
       quay.io/ukhomeofficedigital/mediawiki:v0.5.1 \
       bash
```

## Kubernetes

For example Kubernetes files see [/kb8](/kb8)

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md)

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the
[tags on this repository][tags].

[tags]: https://github.com/UKHomeOffice/docker-mediawiki/tags

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
