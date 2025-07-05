---
layout: post
title:  "Python : Http Server Transfer File Linux - Android"
date:   2020-10-13 23:19
tags: [network, web, aplikasi, python]
category: Archive
description: ""
---
# Cek IP
   
    ifconfig | more
   
# Buat Server
pindah ke directory yang akan di jadikan server

    cd /home/user/

Python 2

    python -m SimpleHTTPServer 8000
 
Paython 3

    python3 -m http.server 8000
   
# Penggunaan
  
    http://[IP SERVER]:8000

ex

    http://192.168.100.1:8000
   
# Referensi
 * <https://docs.python.org/2/library/simplehttpserver.html>
