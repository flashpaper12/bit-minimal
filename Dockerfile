FROM node:12.18.3
WORKDIR local

RUN npm i @teambit/bvm -g
RUN bvm install
ENV PATH=$PATH:/root/bin

# increase node process memory
ENV NODE_OPTIONS="--max_old_space_size=4096"

RUN bit init --harmony

RUN bit config set analytics_reporting false
RUN bit config set no_warnings false
RUN bit config set interactive false
RUN bit config set error_reporting true

COPY . .
RUN bit install

RUN chmod +x .bin/script.sh
