FROM rabbitmq:alpine

RUN rabbitmq-plugins enable --offline rabbitmq_management
RUN rabbitmq-plugins enable --offline rabbitmq_mqtt rabbitmq_web_mqtt
RUN rabbitmq-plugins enable --offline rabbitmq_amqp1.0
RUN rabbitmq-plugins enable --offline rabbitmq_auth_backend_ldap
RUN rabbitmq-plugins enable --offline rabbitmq_jms_topic_exchange

EXPOSE 15671 15672 5672
