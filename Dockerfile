FROM iron/ruby

ENV APP_NAME clark_api

WORKDIR /usr/$APP_NAME

ADD . /usr/$APP_NAME

ENTRYPOINT ["rails", "s"]
