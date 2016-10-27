# dnmp
nginx, mysql, php7, redis all in one docker container


### php xdebug 
php xdebug is by default disabled 
- **XDEBUG_ENABLE** (true|false)
- **XDEBUG_REMOTE_AUTOSTART** (true|false)
- **XDEBUG_REMOTE_HOST**
- **XDEBUG_REMOTE_PORT** (php default: 9000)
`docker run -e XDEBUG_ENABLE=true -e XDEBUG_REMOTE_AUTOSTART=true -e XDEBUG_REMOTE_HOST=192.168.2.2`   

To disable xdebug later simple run `docker exec -it <name> setup-xdebug -r -d` or to enable `docker exec -it <name> setup-xdebug -r -e`. To see all parameters run `docker exec -it <name> setup-xdebug --help`  