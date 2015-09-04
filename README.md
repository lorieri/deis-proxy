# Deis Transparent Proxy

## Requirements

 * access to a HTTP proxy server

## New

 * starts in the early-docker

## How does it work ?

```
+-----------+                      _  _     
|   PROXY   |     HTTP/HTTPS      ( `   )_   DEIS  
| (Squid ?) | <---------------- (    )    `)   
+-----------+                  (_   (_ .  _) _)
```
## How to use it

  * Use the content of the file user-data.example to configure your CoreOS user-data
    * the "no_proxy" equivalent is the RETURN rules in the iptables file, edit it in case you need
  * or manually run the iptables.sh script, configure the .service files and start the units
```
$ sudo bash iptables.sh # in the coreos host
$ fleetctl start deis-proxy-iptables.service
$ fleetctl start deis-proxy.service
``` 
