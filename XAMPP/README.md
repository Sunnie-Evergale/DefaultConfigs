# XAMPP config
The calm before the storm

## Vhosts

Define vhosts in XAMPP
xampp -> apache -> conf -> extra

Edit **httpd-vhost.conf**

```
<VirtualHost *:80>
    DocumentRoot "C:\xampp\htdocs\sites\stormy"
    ServerName stormy.local
</VirtualHost>
```

## Hosts
**Windows**

Add hosts in drivers.
```
C:\Windows\System32\drivers\etc
```
Edit hosts with notepad++ theb add this line
```
127.0.0.1	stormy.local
```
For some reason, hosts only accepts 3 local vhosts. Comment old ones
