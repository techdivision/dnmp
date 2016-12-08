# dnmp
All in one webstack docker image.

## Services
- java
- elasticsearch
- mysql
- nginx
- nodejs
- php
- postfix
- redis
- varnish (port: 81)

## PHP xdebug 
php xdebug is disabled by default. You can use the following environment variables to setup xdebug.
- **XDEBUG_ENABLE** (true|false)
- **XDEBUG_REMOTE_AUTOSTART** (true|false)
- **XDEBUG_REMOTE_HOST**
- **XDEBUG_REMOTE_PORT** (php default: 9000)
### usage
`docker run -e XDEBUG_ENABLE=true -e XDEBUG_REMOTE_AUTOSTART=true -e XDEBUG_REMOTE_HOST=192.168.2.2 techdivision/dnmp`   

To disable xdebug later simple run `docker exec -it <name> setup-xdebug -r -d` or to enable `docker exec -it <name> setup-xdebug -r -e`. To see all parameters run `docker exec -it <name> setup-xdebug --help`  