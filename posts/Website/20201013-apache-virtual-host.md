---
layout: post
title:  "Apache : Virtual Host"
date:   2020-10-13 12:36
tags: [linux, aplikasi, web]
category: Archive
description: ""
---

Apache memungkinkan kita untuk menjalankan beberapa situs dalam sebuah server apache.<br>
Ubuntu menggunakan dua (2) directory untuk virtual host, yaitu:

`/etc/apache2/sites-available`<br>
`/etc/apache2/sites-enabled`

Folder `site-enabled` berisi symlink ke `site-available`, dengan cara ini kita dapat mengkonfigurasi dengan aman di `site-available` jika di disable dengan cara menghilangkan symlink.


***Daftar Isi***
{: .no_toc .text-delta }

- TOC
{:toc}

# File Konfigurasi Virtual Host

Cara yang paling mudah, copy `/` contek `default.conf`
```
 sudo cp /etc/apache2/sites-available/000-default.conf \
         /etc/apache2/sites-available/finalarchive.co.id.conf
```
Isinya kira-kira
```
 <VirtualHost *:80>
     # The ServerName directive sets the request scheme, hostname and port that
     # the server uses to identify itself. This is used when creating
     # redirection URLs. In the context of virtual hosts, the ServerName
     # specifies what hostname must appear in the request's Host: header to
     # match this virtual host. For the default virtual host (this file) this
     # value is not decisive as it is used as a last resort host regardless.
     # However, you must set it for any further virtual host explicitly.
     #ServerName www.example.com
 
     ServerAdmin webmaster@localhost
     DocumentRoot /var/www
 
     # Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
     # error, crit, alert, emerg.
     # It is also possible to configure the loglevel for particular
     # modules, e.g.
     #LogLevel info ssl:warn
 
     ErrorLog ${APACHE_LOG_DIR}/error.log
     CustomLog ${APACHE_LOG_DIR}/access.log combined
 
     # For most configuration files from conf-available/, which are
     # enabled or disabled at a global level, it is possible to
     # include a line for only one particular virtual host. For example the
     # following line enables the CGI configuration for this host only
     # after it has been globally disabled with "a2disconf".
     #Include conf-available/serve-cgi-bin.conf
 </VirtualHost>
```
Ubah di sesuaikan dengan virtual host kita,
```
 <VirtualHost *:80>
     ServerName www.finalarchive.co.id
     ServerAlias finalarchive.co.id
     DocumentRoot /usr/local/src/webmirror/www.finalarchive.co.id/

     <Directory /usr/local/src/webmirror/www.finalarchive.co.id>
         Options -Indexes +FollowSymLinks +MultiViews
         AllowOverride All
         Require all granted
     </Directory>
 
     ErrorLog ${APACHE_LOG_DIR}/www.finalarchive.co.id-error.log 
 
     # Possible values include: debug, info, notice, warn, error, crit,
     # alert, emerg.
     LogLevel warn
 
     CustomLog ${APACHE_LOG_DIR}/www.finalarchive.co.id-access.log combined 
  </VirtualHost>
```
Arti masing-masing parameter

* **ServerName dan ServerAlias**: Memberitahukan Apache akan virtual host yang akan di akses
* **DocumentRoot**: Ubah sesuai dengan folder tempat meletakan file untuk host tersebut
* **Options -Indexes**: -Indexes menghentikan orang untuk bisa masuk ke directory dan melihat file yang ada di situ.
* **AllowOverride**: Set ke "all" untuk allow .htaccess files di virtual host (dan sub-directory)
* **ErrorLog, CustomLog**: Buat log file untuk domain virtual tersebut.


# Cara Mengaktifkan Konfigurasi virtual host

Misalnya kita mempunyai konfigurasi virtual host (finalarchive.co.id.conf) di /etc/apache2/sites-available/finalarchive.co.id.conf yang belum di enable. Untuk mengaktifkannya cukup menggunakan,
```
 sudo a2ensite finalarchive.co.id.conf  # membuat symlink dari site-enabled ke site-available
 sudo service apache2 reload         # reload pache config agar host virtual yang baru jadi masuk
 sudo systemctl reload apache2
```
Untuk mendisable,
```
 sudo a2dissite finalarchive.co.id.conf  #Remove symlink
 sudo service apache2 reload
 sudo systemctl reload apache2
```
# Referensi

* https://serversforhackers.com/c/configuring-apache-virtual-hosts

# Pranala Menarik

* [[Internet Offline]]
