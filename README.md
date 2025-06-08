# Распределённый запуск

**_Стек_**
jenkins, jmeter, sh, linux, vm (any), java, springboot, rest-api, groovy


**_Виртуализация_**

Требуется 5 виртуальных машин:
1. Jenkins
2. Jmeter master
3. Jmeter slave (server)
4. Jmeter slave (server)
5. Stub host

**_Конфигурирование_**

1. Jenkins на первой машине должен иметь 4 подключённых агента - по логинам суперюзера машины.
2. Jenkins должен иметь единственный пайплайн - Pipline script from SCM - который должен быть указан в виде ссылки на этот репо с веткой ```main```
3. Внесены изменения в ```/etc/hosts``` : ```XXX.XXX.XXX.XXX HOST_NAME``` вместо существующего ```127.0.0.1 HOST_NAME```
4. В домашней директории пользователя должна быть папка ```distrib``` и в ней папка с jmeter
5. Jmeter должен быть сконфигурирован на использование ```jks```
6. Jmeter на второй машине в строке ```remote_hosts``` должен иметь: ```remote_hosts=HOST_1_ADDRESS:HOST_1_PORT,HOST_2_ADDRESS:HOST_2_PORT```
7. Третья и четвертая машина должны иметь демона в виде:

```
[Unit]
Description=JMeter Server
After=network.target

[Service]
WorkingDirectory=/home/user/distrib/apache-jmeter-5.6.3/bin
ExecStart=/home/user/distrib/apache-jmeter-5.6.3/bin/jmeter-server
Restart=always

[Install]
WantedBy=multi-user.target
```

8. Пятая машина должна иметь докер и maven - т.к. они оба используются для "чистого" билда заглушки и её деплоя

**_Конфигурирование_**

Запустить джобу. Она соберёт и запустит заглушку на 5ом хосте, запустит распределённый запуск со 2го хоста на 3ий и 4ый.
Проверку можно будет осуществить чтением логов с докер-контейнера.

**_\\ Timur Shamsrakhmanov \\_** \
**_\\ June 2025  \\_**