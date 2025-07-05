---
layout: post
title:  "Install Paket Printer Epson L120"
date:   2020-10-25 21:18
tags: [linux, ubuntu, aplikasi]
category: Archive
description: ""
---

***Daftar Isi***
{: .no_toc .text-delta }

- TOC
{:toc}

## Persiapan
```
sudo su
apt update
apt install lsb
```
Apabila terjadi error

    apt --fix-broken install

Download Driver Epson L120 [disini](http://download.ebz.epson.net/dsc/du/02/DriverDownloadInfo.do?LG2=EN&CN2=SG&CTI=4&PRN=L120%20Series&OSC=LX)<br>
1. epson-printer-utility_1.1.1-1lsb3.2_amd64.deb
2. epson-inkjet-printer-201310w_1.0.0-1lsb3.2_amd64.deb

Install<br>

    dpkg -i epson-printer-utility_1.1.1-1lsb3.2_amd64.deb epson-inkjet-printer-201310w_1.0.0-1lsb3.2_amd64.deb


## Referensi
* <http://download.ebz.epson.net/dsc/du/02/DriverDownloadInfo.do?LG2=EN&CN2=SG&CTI=4&PRN=L120%20Series&OSC=LX>
