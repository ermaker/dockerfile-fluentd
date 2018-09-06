FROM fluent/fluentd
MAINTAINER Minwoo Lee <ermaker@gmail.com>

RUN apk add --update --virtual .build-deps \
        sudo build-base ruby-dev \
 && sudo gem install \
        bson_ext \
        fluent-plugin-beats \
        fluent-plugin-elasticsearch \
        fluent-plugin-mongo \
        fluent-plugin-out-http \
        fluent-plugin-record-reformer \
        fluent-plugin-rewrite-tag-filter \
        fluent-plugin-slack \
 && sudo gem sources --clear-all \
 && apk del .build-deps \
 && rm -rf /var/cache/apk/* \
           /home/fluent/.gem/ruby/2.4.0/cache/*.gem
