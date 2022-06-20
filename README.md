# Workstation Builder

This project aims to build a workstation focused on software development by installing and
configuring the selected applications.

## Compatibility

Tests were performed on Linux Ubuntu 20.04+.

## Setup

You must copy the file setup.sh.example, rename it to setup.sh. and edit the file informing what you want to install or not.

To do this simply open the file and inform with true or false what you want to install.

If you want an entire block not to be installed, hit false that it will not be executed.

## How to run the script

1. Download the .zip project in the directory of your choice.
2. Unzip it and go into the root of the project.
3. Make a copy of the file `setup.sh.example` renaming it to `setup.sh`.
4. In `setup.sh` selected with `true` the packages to be installed. 
5. Run the command: `./build.sh`.
6. Remove the `setup.sh` file.

The process will ask if you want to continue

**Because a lot of software is installed, it may take a long time, depending on your internet connection.**

### Log

At the end of the process a log file is generated.

Path: `/log/installation_log.txt`

## Based on

This project is based on the [Workstation Configuration](https://github.com/Diego-Brocanelli/workstation_configuration) 
project created by [Diego Brocanelli](https://github.com/Diego-Brocanelli) and adapted to support other app 
installations. Thanks to Diego Brocanelli for the inspiration.

## License

[MIT](LICENSE)
