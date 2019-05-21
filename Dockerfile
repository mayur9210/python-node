FROM python:2.7

RUN \
  cd /tmp && \
  wget http://nodejs.org/dist/v4.4.7/node-v4.4.7.tar.gz && \
  tar xvzf node-v4.4.7.tar.gz && \
  rm -f node-v4.4.7.tar.gz && \
  cd node-v* && \
  ./configure && \
  CXX="g++ -Wno-unused-local-typedefs" make && \
  CXX="g++ -Wno-unused-local-typedefs" make install && \
  cd /tmp && \
  rm -rf /tmp/node-v* && \
  npm install -g npm && \
  echo -e '\n# Node.js\nexport PATH="node_modules/.bin:$PATH"' >> /root/.bashrc

RUN /usr/local/bin/npm install -g gulp@4.9.1

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]
