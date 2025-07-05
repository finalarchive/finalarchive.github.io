---
layout: post
title:  "Setting Huawei HG8245H Model Bridge"
date:   2020-10-17 23:20
tags: [network, hostpot]
category: Archive
description: ""
---

***Daftar Isi***
{: .no_toc .text-delta }

- TOC
{:toc}

## Login Sebagi Super User

* Huawai HG245H Ex. IndiHome

  Username : **Support**<br>
  Password: **theworldinyourhand**<br>
 
  Username : **telecomadmin**<br>
  Password: **admintelecom**<br>
  
* Huawai HG245H Ex. GIG Indosat

  Username : **telecomadmin**<br>
  Password : **g1g.4dm1n**<br>
 
## Setting
* Konfigurasi interface Lan, Klik **LAN**
	* **LAN Port Work Mode** Cetang Port LAN yang akan diaktifkan.
	* **LAN Host Configuration**
		>**Primary Address**<br>
		>Primary IP Address: 10.10.10.4 [No IP Bridge- digunakan untuk login ke modem]<br>
		>Primary Address Subnet Mask: 255.255.255.0<br>
		>
		>**Secondary Address**<br>
		>Enable secondary address: [dikosongkan]<br>
	
* Konfigurasi Interface WAN, Klik **WAN** --> **WAN Configuration** --> **New** ubaha parameter sebagai berikut :

  >**Basic Information**<br>
  >Enable WAN : [V]<br>
  >Encapsulation Mode : IPoE<br>
  >Protocol Type : IPv4<br>
  >WAN Mode : Bridge WAN<br>
  >Service Type : OTHER<br>
  >Enable VLAN : [ ]<br>
  >Binding Options : [Ceklis Port Lan atau SSID yang akan di Binding]
  >
  >**IPv4 Information**<br>
  >Multicast VLAN ID: [ ]<br>

  **Apply**

* Setting SSID Klik  **WLAN**

  * **WLAN Advanced Configuration**

	  >[V] Enablle WLAN

	  Ubah parameter sebagai berikut ;

	  >**SSID Configuration Details**<br>
	  >SSID Name: [Nama SSID]<br>
	  >Enable SSID: [V]	<br>
	  >Number of Associated Devices: 32<br>
	  >Broadcast SSID: [V]<br>
	  >Enable WMM: [V]<br>
	  >Authentication Mode: Open<br>
	  >Encryption Mode: None<br>
  
  	**Apply**

  * **WLAN Advanced Configuration**

    >**Advanced Configuration**
	>Channel: [Isi nomor channel yang bagus]<br>
	>Channel Width:	20 Mhz<br>
	>Mode: 108.11 b/g/h
