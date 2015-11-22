FROM seapy/fluentd-es
MAINTAINER Minwoo Lee "ermaker@gmail.com"

# Install Fluentd plug-in
RUN /usr/sbin/td-agent-gem install \
  fluent-plugin-color-stripper \
  fluent-plugin-docker-format \
  fluent-plugin-parser \
  fluent-plugin-record-reformer \
  fluent-plugin-rewrite-tag-filter \
  fluent-plugin-secure-forward \
  fluent-plugin-slack

# install fixed-version plugin
RUN apt-get update && \
  apt-get install -y git && \
  apt-get clean

RUN git clone https://github.com/ermaker/fluent-plugin-color-stripper
  -b strip_dangling_colors && \
  cd fluent-plugin-color-stripper && \
  /usr/sbin/td-agent-gem build fluent-plugin-color-stripper.gemspec && \
  /usr/sbin/td-agent-gem install fluent-plugin-color-stripper-0.0.3.gem && \
  cd .. && \
  rm -rf fluent-plugin-color-stripper

# Restore the entrypoint
ENTRYPOINT ["/usr/sbin/td-agent"]
