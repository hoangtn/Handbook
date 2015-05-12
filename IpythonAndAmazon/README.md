## Run Ipython on a server (This also works if you are using EC2)

1. On the remote server 

```{}
user@remote_host$ ipython notebook --no-browser --port=8887
```

2. On local machine, start an SSH tunnel:

```{}
user@local_host$ ssh -N -f -L localhost:8888:localhost:8887 user@remote_host
```


## Run Ipython in a container (docker) on an AMAZON server (EC2)

1.  On the remote server (EC2), we assume that we have an image **ipython/scipystack**

```{}
user@remote_host$ docker run -it -v $(pwd):/usr/data -w /usr/data -p 8889:8888 ipython/scipystack /bin/bash

```
2. Inside the container (on the remote server), open a notebook

```{}
ipython notebook --ip=0.0.0.0 --no-browser
```

3. On local machine, start an SSH tunnel:

```{}
ssh -i myKey.pem -N -f -L localhost:8882:localhost:8889 ubuntu@remote_host


```

4. On the local machine, open the browser with the port 8882 (whichever you choose)

