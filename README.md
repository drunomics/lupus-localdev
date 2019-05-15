# Lupus localdev Setup

Additions for making local development with docker-compose nicer. The setup
plays nice together with projects using [drunomics/devsetup-docker](https://github.com/drunomics/devsetup-docker/tree/2.x).

## Features

 * Runs a central traefik reverse proxy and binds it to localhost, such that
   multiple projects can be run at the same time. It's dashboard is available at http://traefik.localdev.space
   
 * Provides some useful bash aliases and short-cuts, see "Provided commands" below.


## Installation

    git clone git@github.com:drunomics/lupus-localdev.git --branch=2.x ~/.lupus-localdev
    echo "# Add lupus-localdev setup and aliases." >> ~/.bashrc
    echo 'source ~/.lupus-localdev/bashrc' >> ~/.bashrc
    bash

## Usage

By default, traefik is started on boot automatically. So it's automatically avaiable
all the time. However one can manually restart / stop / start it with the provided
`localdev-dcp` command:

    # Stop
    localdev-dcp stop
    # Start
    localdev-dcp start
    # Restart
    localdev-dcp restart

## Provided commands

 - `dcp`  
    A simple short-hand for `docker-compose`.
    
 - `localdev-dcp`  
    Runs docker-compose for the lupus-localdev services, like traefik.

 - `lupus-localdev-update`
    Updates the localdev setup with latest upstream changes. Updates just pull
    in changes in the current branch, what will never including breaking changes.
