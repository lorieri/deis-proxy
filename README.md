# Deis Transparent Proxy

## Requirements

 * access to a HTTP proxy server

## How does it work ?

```
+-----------+                      _  _     
|   PROXY   |     HTTP/HTTPS      ( `   )_   DEIS  
| (Squid ?) | <---------------- (    )    `)   
+-----------+                  (_   (_ .  _) _)
```
## How to use it

  * append the content of the file user-data.example into your CoreOS user-data
    * configure the http_proxy and https_proxy variables
    * the "no_proxy" equivalent is the RETURN rules in the iptables file, edit it in case you need
  * after you install CoreOS or run the user-data, load the units
```
$ fleetctl start deis-proxy-iptables.service
$ fleetctl start deis-proxy.service
``` 
