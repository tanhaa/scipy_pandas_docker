# scipy_pandas_docker
A python2 / 3 docker file with scipy and pandas/numpy installed 

This dockerfile provides a Centos 7 box with Python2, Python3 installed along with some useful python packages for scientific computing such as:
* pandas
* scipy
* scikit-learn
* ipython
* see dependencies.txt and dependencies.dev.txt

The dockerfile also contains Nodejs and NPM + Flask allowing one to run a web application in flask in this container

Supervisord is also installed under python2.

There is no entrypoint cmd in this container, but using docker-compose, one can easily use this and run
`/usr/bin/supervisord -c /etc/supervisord.conf` as a command.  Simply place the applications that need to be started by
supervisord under /etc/supervisor.d/