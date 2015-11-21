FROM seapy/fluentd-es
MAINTAINER Minwoo Lee "ermaker@gmail.com"

# Install Fluentd plug-in
RUN /usr/sbin/td-agent-gem install \
  fluent-plugin-docker-format \
  fluent-plugin-record-reformer \
  fluent-plugin-secure-forward \
  fluent-plugin-slack

# Restore the entrypoint
ENTRYPOINT ["/usr/sbin/td-agent"]
