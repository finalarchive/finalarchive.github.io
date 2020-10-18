---
layout: post
title:  "Setting Huawei HG8245H Model Bridge"
date:   2020-10-17 23:20
categories: [network, hostpot]
permalink: /:year/:month/:title
---

***Daftar Isi***
{: .no_toc .text-delta }

- TOC
{:toc}

## Login Sebagi Super User

* Huawai HG245H Ex. IndiHome

  Username : Support<br>
  Password: theworldinyourhand<br>
 
  Username : telecomadmin<br>
  Password: admintelecom<br>
  
* Huawai HG245H Ex. GIG Indosat

  Username : telecomadmin<br>
  Password : g1g.4dm1n<br>
 
## Setting
* Konfigurasi interface Lan, Klik **LAN**
	* **LAN Port Work Mode** Cetang Port LAN yang akan diaktifkan.
	* **LAN Host Configuration**
		>**Primary Address**
		>Primary IP Address: 10.10.10.4 [No IP Bridge- digunakan untuk login ke modem]
		>Primary Address Subnet Mask: 255.255.255.0
		
		>**Secondary Address**
		>Enable secondary address:	[dikosongkan]
	
* Konfigurasi Interface WAN, Klik **WAN** --> **WAN Configuration** --> **New** ubaha parameter sebagai berikut :

  >**Basic Information**
  >Enable WAN : [V]
  >Encapsulation Mode : IPoE
  >Protocol Type : IPv4
  >WAN Mode : Bridge WAN
  >Service Type : OTHER
  >Enable VLAN : [ ]
  >Binding Options : [Ceklis Port Lan atau SSID yang akan di Binding]
  
  >**IPv4 Information**
  >Multicast VLAN ID: [ ]
  
  **Apply**
  
* Setting SSID Klik  **WLAN**

  * ** WLAN Advanced Configuration**

	  >[V] Enablle WLAN  

	  Ubah parameter sebagai berikut ;

	  >**SSID Configuration Details**
	  >SSID Name: [Nama SSID]
	  >Enable SSID: [V]	
	  >Number of Associated Devices: 32
	  >Broadcast SSID: [V]	
	  >Enable WMM: [V]	
	  >Authentication Mode: Open
	  >Encryption Mode: None
  
  	**Apply**
  
  * **WLAN Advanced Configuration**
  
    >**Advanced Configuration**
	  >Channel: [Isi nomor channel yang bagus]
    >Channel Width:	20 Mhz
    >Mode: 108.11 b/g/h
  
  
