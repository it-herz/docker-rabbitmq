FROM rabbitmq:alpine

RUN rabbitmq-plugins enable --offline rabbitmq_management
RUN rabbitmq-plugins enable --offline rabbitmq_mqtt rabbitmq_web_mqtt
RUN rabbitmq-plugins enable --offline rabbitmq_amqp1_0
RUN rabbitmq-plugins enable --offline rabbitmq_auth_backend_ldap
RUN rabbitmq-plugins enable --offline rabbitmq_jms_topic_exchange

EXPORT 1883 4369 5672 15672

