FROM rabbitmq:alpine

RUN cd /usr/lib/rabbitmq/lib/rabbitmq_server-$RABBITMQ_VERSION && \
    wget https://github.com/deadtrickster/prometheus_rabbitmq_exporter/releases/download/v3.7.2.1/accept-0.3.3.ez && \
    wget https://github.com/deadtrickster/prometheus_rabbitmq_exporter/releases/download/v3.7.2.1/prometheus-3.4.5.ez && \
    wget https://github.com/deadtrickster/prometheus_rabbitmq_exporter/releases/download/v3.7.2.1/prometheus_cowboy-0.1.4.ez && \
    wget https://github.com/deadtrickster/prometheus_rabbitmq_exporter/releases/download/v3.7.2.1/prometheus_httpd-2.1.8.ez && \
    wget https://github.com/deadtrickster/prometheus_rabbitmq_exporter/releases/download/v3.7.2.1/prometheus_process_collector-1.3.1.ez && \
    wget https://github.com/deadtrickster/prometheus_rabbitmq_exporter/releases/download/v3.7.2.1/prometheus_rabbitmq_exporter-v3.7.2.1.ez && \
    rabbitmq-plugins enable --offline accept && \
    rabbitmq-plugins enable --offline prometheus && \ 
    rabbitmq-plugins enable --offline prometheus_cowboy && \
    rabbitmq-plugins enable --offline prometheus_httpd && \
    rabbitmq-plugins enable --offline prometheus_rabbitmq_exporter && \
    rabbitmq-plugins enable --offline prometheus_process_collector

RUN rabbitmq-plugins enable --offline rabbitmq_management
RUN rabbitmq-plugins enable --offline rabbitmq_mqtt rabbitmq_web_mqtt
RUN rabbitmq-plugins enable --offline rabbitmq_amqp1_0
RUN rabbitmq-plugins enable --offline rabbitmq_auth_backend_ldap
RUN rabbitmq-plugins enable --offline rabbitmq_jms_topic_exchange

ADD rabbitmq.config /etc/rabbitmq/

RUN chmod 777 /etc/rabbitmq/rabbitmq.config

RUN apk update && apk add tzdata && cp /usr/share/zoneinfo/Europe/Moscow /etc/localtime && echo "Europe/Moscow" >  /etc/timezone

ENV TZ Europe/Moscow

EXPOSE 1883 4369 5672 15672

