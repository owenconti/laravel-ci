FROM laravelphp/vapor:php73

# Install composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN ln -s /usr/local/bin/composer /usr/bin/composer

# Install Node
RUN touch ~/.profile
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
ENV NODE_VERSION 10.16.3
RUN source ~/.nvm/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default
ENV NODE_PATH /root/.nvm/v$NODE_VERSION/lib/node_modules
ENV PATH /root/.nvm/versions/node/v$NODE_VERSION/bin:$PATH

# Install yarn
RUN curl -o- -L https://yarnpkg.com/install.sh | bash
ENV PATH /root/.yarn/bin:/.config/yarn/global/node_modules/.bin:$PATH
RUN ln -s /root/.nvm/versions/node/v10.16.3/bin/node /usr/bin/node

ENTRYPOINT ["tail", "-f", "/dev/null"]
