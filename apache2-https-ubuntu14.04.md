###Cấu hình HTTPS self-sign cho apache2 trên Ubuntu 14.04

`apt-get install apache2`

`a2enmod ssl`

`service apache2 restart`

`mkdir /etc/apache2/ssl`

`openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/apache2/ssl/apache.key -out /etc/apache2/ssl/apache.crt`

```sh
Country Name (2 letter code) [AU]:VN
State or Province Name (full name) [Some-State]:HN
Locality Name (eg, city) []:Hanoi
Organization Name (eg, company) [Internet Widgits Pty Ltd]:Ha Noi
Organizational Unit Name (eg, section) []:VDC
Common Name (e.g. server FQDN or YOUR name) []:vdc.com.vn
Email Address []:nguyencongduc3112@gmail.com
```

`vi /etc/apache2/sites-available/default-ssl.conf`

```sh
SSLCertificateFile /etc/apache2/ssl/apache.crt
SSLCertificateKeyFile /etc/apache2/ssl/apache.key
```

`a2ensite default-ssl.conf`

`service apache2 restart`

*Tắt HTTP (nếu cần)*

`vi /etc/apache2/ports.conf`

```
#Listen 80
```
