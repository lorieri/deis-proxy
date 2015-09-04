iptables -t nat -N REDSOCKS
iptables -t nat -C REDSOCKS -d 0.0.0.0/8 -j RETURN      || iptables -t nat -A REDSOCKS -d 0.0.0.0/8 -j RETURN
iptables -t nat -C REDSOCKS -d 10.0.0.0/8 -j RETURN     || iptables -t nat -A REDSOCKS -d 10.0.0.0/8 -j RETURN
iptables -t nat -C REDSOCKS -d 127.0.0.0/8 -j RETURN    || iptables -t nat -A REDSOCKS -d 127.0.0.0/8 -j RETURN
iptables -t nat -C REDSOCKS -d 169.254.0.0/16 -j RETURN || iptables -t nat -A REDSOCKS -d 169.254.0.0/16 -j RETURN
iptables -t nat -C REDSOCKS -d 172.16.0.0/12 -j RETURN  || iptables -t nat -A REDSOCKS -d 172.16.0.0/12 -j RETURN
iptables -t nat -C REDSOCKS -d 192.168.0.0/16 -j RETURN || iptables -t nat -A REDSOCKS -d 192.168.0.0/16 -j RETURN
iptables -t nat -C REDSOCKS -d 224.0.0.0/4 -j RETURN    || iptables -t nat -A REDSOCKS -d 224.0.0.0/4 -j RETURN
iptables -t nat -C REDSOCKS -d 240.0.0.0/4 -j RETURN    || iptables -t nat -A REDSOCKS -d 240.0.0.0/4 -j RETURN

iptables -t nat -C REDSOCKS -p tcp --dport 443:8443 -j REDIRECT --to-ports 12346 || iptables -t nat -A REDSOCKS -p tcp --dport 443:8443 -j REDIRECT --to-ports 12346
iptables -t nat -C REDSOCKS -p tcp -j REDIRECT --to-ports 12345 || iptables -t nat -A REDSOCKS -p tcp -j REDIRECT --to-ports 12345

iptables -t nat -C PREROUTING -p tcp -j REDSOCKS        || iptables -t nat -A PREROUTING -p tcp -j REDSOCKS
iptables -t nat -C OUTPUT     -p tcp -j REDSOCKS        || iptables -t nat -A OUTPUT     -p tcp -j REDSOCKS
