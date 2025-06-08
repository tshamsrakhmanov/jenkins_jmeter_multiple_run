# Распределённый запуск

## Стек: jenkins, jmeter, sh, linux, vm (any), java, springboot, rest-api, groovy


## Пайплайн запуска

Требуется 5 виртуальных машин:
1. Jenkins
2. Jmeter master
3. Jmeter slave (server)
4. Jmeter slave (server)
5. Stub host

На дженкинсе необходимо настроить пайплайн, который будет работать с этого гита - и указать чтение и исполнение груви-скрипта test_jenkins_script.groovy.
Вторая+третья+четвёртая+пятая машины должны быть сконфигурированы:
1. Внесены изменения в /etc/hosts: ```XXX.XXX.XXX.XXX HOST_NAME``` вместо существующего ```127.0.0.1 HOST_NAME```
2. В домашней директории пользователя должна быть папка distrib и в ней папка с jmeter
3. Jmeter должен быть сконфигурирован на использование jsk
4. Третья и четвертая машина должны иметь демона в виде:

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

5. Пятая машина должна иметь докер и maven - т.к. они оба используются для "чистого" билда заглушки и её деплоя

