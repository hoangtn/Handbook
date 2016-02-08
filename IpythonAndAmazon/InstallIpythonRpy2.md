# This describes two ways to install notebook tools

## Jupyter

 Step 1: Install anacoda from [https://www.continuum.io/downloads](https://www.continuum.io/downloads)
 
 Step 2: Install r essentials 
 
     conda install -c r r-essentials
 
 Step 3: Install some useful packages to run R
 
 In R
  
        install.packages(c('rzmq','repr','IRkernel','IRdisplay'),
                  
                  repos = c('http://irkernel.github.io/', getOption('repos')),
                  
                  type = 'source')
                  
  
  For Mac computer, if there are errors with the installation of the IRkernel package then one way to resolve is:
  
      brew install czmq zmq
                  

## Ipython


You can use a dockerized version by typing:

    docker pull hoangtn/notebooktools (https://hub.docker.com/r/hoangtn/notebooktools/)

### Download aconda

    wget https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda3-2.3.0-Linux-x86_64.sh

### Install this:

    bash Anaconda3-2.3.0-Linux-x86_64.sh

### Restart/logout, and then

    conda update conda

    conda update ipython ipython-notebook ipython-qtconsole


 ### Install R first:
 
    sudo apt-get install r-base-dev

### Install rpy2

    conda install -c https://conda.binstar.org/r rpy2


### Install extensions

    conda install -c https://conda.binstar.org/ostrokach nbextensions

Link: 
    https://github.com/ipython-contrib/IPython-notebook-extensions/wiki/Home_3x

