## 1. Run Ipython on a server (This also works if you are using EC2)

#### On the remote server 

```{}
user@remote_host$ ipython notebook --no-browser --port=8887
```

#### On the local machine, start an SSH tunnel:

```{}
user@local_host$ ssh -N -f -L localhost:8888:localhost:8887 user@remote_host
```


## 2. Run Ipython in a container (docker) on an AMAZON server (EC2)

####  On the remote server (EC2), assuming that we have an image *ipython/scipystack*

```{}
user@remote_host$ docker run -it -v $(pwd):/usr/data -w /usr/data -p 8889:8888 ipython/scipystack /bin/bash

```
#### Inside the container (on the remote server), open a notebook

```{}
ipython notebook --ip=0.0.0.0 --no-browser
```

#### On the local machine, start an SSH tunnel:

```{}
ssh -i myKey.pem -N -f -L localhost:8882:localhost:8889 ubuntu@remote_host


```

#### On the local machine, open the browser with the port 8882 (the port you choose)

