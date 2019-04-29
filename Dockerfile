FROM keymetrics/pm2:latest-stretch

# Node ENV 
RUN mkdir -p /usr/src/app
RUN mkdir -p /root/.ssh
RUN chmod 700 /root/.ssh
WORKDIR /usr/src/app

# copy config
COPY credentials/scope-virtual.properties /usr/src/app/credentials/scope-virtual.properties 
COPY credentials/ssh-config /root/.ssh/config
COPY credentials/id_rsa* /root/.ssh/
COPY credentials/netrc /root/.netrc

# copy node scripts
COPY shell /usr/src/app/shell
COPY ecosystem.config.js /usr/src/app/
COPY package.json /usr/src/app/

RUN npm install 

# add nice to have
RUN apt-get update && apt-get install -y \
  vim-tiny \
  git \
  bash \
  && rm -rf /var/lib/apt/lists/*

# Clone the initial repo & set git proxy

RUN git clone https://github.com/Staatsarchiv-Basel-Stadt/StABS-scope2RDF.git /opt/StABS-scope2RDF.git

#COPY credentials/gitconfig /root/.gitconfig

# cron setup
#RUN crontab -l | cat - config/crontab-docker | crontab -
#RUN cp /usr/share/zoneinfo/UTC /etc/localtime

# logs
#RUN touch /var/log/cron.log
#RUN touch /var/log/mch-cosmo.log

# Run the command on container startup
#CMD cron && tail -f /var/log/cron.log

CMD [ "pm2-runtime", "start", "ecosystem.config.js" ]

