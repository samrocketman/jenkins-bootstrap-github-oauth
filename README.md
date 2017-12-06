# jenkins-bootstrap for github-oauth-plugin testing

This bootstrapper is for testing pull requests from the Jenkins [GitHub
Authentication Plugin][plugin].  This project can be bootstrapped below or
installed via RPMs in releases.

# Requirements

- Windows, Mac OS X, or Linux.
- More than two CPU cores recommended.
- More than 6GB of RAM recommended if running Jenkins.

Optional requirements (required for Windows):

- [VirtualBox][vbox]
- [Vagrant][vagrant]

# Getting Started

Clone this repository and all submodules.

    git clone --recursive git@github.com:samrocketman/jenkins-bootstrap-github-oauth.git

### Bootstrap (Linux and Mac only)

    ./jenkins_bootstrap.sh

### Vagrant bootstrap (all platforms)

This repository optionally uses [Vagrant][vagrant].  To bootstrap Jenkins simply
run the following to start Jenkins.

    vagrant up
    export VAGRANT_JENKINS=1
    ./jenkins_bootstrap.sh

### After provisioning

A new Jenkins instance will be available on port 8080.

1. Visit `http://localhost:8080/`.
2. Configure the github-oauth plugin according to the [Jenkins wiki page][wiki].

# Additional Instructions

<details><summary>Click this to expand and see additional details</summary>

### Common gradle tasks

The following tasks would be executed with `./gradlew TASK`.  List of common
TASKs include:

- `clean` - cleans the build directory and all bootstrap related files.
- `buildRpm` - builds an RPM package for RHEL based Linux distros.
- `buildDeb` - builds a DEB package for Debian based Linux distros.
- `packages` - executes both `buildRpm` and `buildDeb` tasks.
- `getjenkins` - Downloads `jenkins.war` to the current directory.
- `getplugins` - Downloads Jenkins plugin HPI files to `./plugins`.

### Operating system packages

Generate RPM and DEB packages of your Jenkins instance.

    ./gradlew packages

The system packages will be located in `./build/distributions/`.

### Upgrade Jenkins and plugins

To upgrade Jenkins master and plugin versions do the following:

    ./jenkins_bootstrap.sh
    ./jenkins-bootstrap-shared/scripts/upgrade/upgrade_build_gradle.sh
    git add -A && git commit -m 'jenkins upgraded'

### Other Usage

For service control and other usage see [`USAGE`](USAGE.md).

</details>

# License

* [ASL 2](LICENSE)
* [3rd party licenses](3rd_party)

[plugin]: https://github.com/jenkinsci/github-oauth-plugin
[vagrant]: https://www.vagrantup.com/
[vbox]: https://www.virtualbox.org/
[wiki]: https://wiki.jenkins.io/display/JENKINS/GitHub+OAuth+Plugin
