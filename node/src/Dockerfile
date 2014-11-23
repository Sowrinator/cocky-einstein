# RUNNING WITH FIG
# docker run -v $(pwd):/app -v /var/run/docker.sock:/var/run/docker.sock -ti fig up -d

FROM    centos:centos6

# Enable EPEL for Node.js
RUN     rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
# Install Node.js and npm
RUN     yum install -y npm

# Bundle app source
COPY . /src
# Install app dependencies
RUN cd /src; npm install

# Run app
CMD ["node", "/src/script.js"]
