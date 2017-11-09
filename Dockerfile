FROM teradiot/alpine-ruby-libv8

ENV PATH /root/.yarn/bin:$PATH

RUN apk --update --no-cache add bash git curl

RUN curl https://getcaddy.com | bash -s personal

RUN apk --no-cache add --virtual \
        build-deps build-base python openssh postgresql-dev nodejs g++ python; \
        bundle config build.libv8 --enable-debug

RUN /bin/bash \
    && touch ~/.bashrc \
    && curl -o- -L https://yarnpkg.com/install.sh | bash \
    && apk del curl tar binutils

RUN gem install rails nokogiri sassc
