---
layout: post
title:  "Membaca Sinyak GSM"
date:   2020-10-09 10:55
tags: [network]
category: Archive
description: ""
---

***Daftar Isi***
{: .no_toc .text-delta }

- TOC
{:toc}

# Membaca Sinyal GSM
Sinyal yang baik itu:<br>
* RSSI < 70
* RSRP < 90
* RSRQ < 15
* SINR < 15

Network Performance

| RF Conditions&nbsp;&nbsp;&nbsp; | RSRP (dBm)&nbsp;&nbsp;&nbsp; | RSRQ (dB)&nbsp;&nbsp;&nbsp; | SINR (dB)&nbsp;&nbsp;&nbsp; |
| :--- | :--- | :--- | :--- |
| Excellent | >= -80 | >= -10 | >= 20 |
| Good | -80 to -90 | -10 to -15  | 13 to 20 |
| Mid Cell | -90 to -100 | -15 to -20 | 0 to 13 |
| Cell Edge | <= -100 | < -20 | <= 0 |



* **RSSI ( Received Signal Strength Indicator )**<br>
merupakan power sinyal yang diterima user dalam rentang frekuensi tertentu termasuk noise dan interferensi ( disebut juga wideband power ).

* **RSRP ( Reference Signal Received Power )**<br>
merupakan sinyal LTE power yang diterima oleh user dalam frekuensi tertentu. semakin jauh jarak antara site dan user, maka semakin kecil pula RSRP yang diterima oleh user. RS merupakan Reference Signal atau RSRP di tiap titik jangkauan coverage. user yang berada di luar jangkauan maka tidak akan mendapatkan layanan LTE.

* **RSRQ (Received Signal Reference Quality)** <br>
Merupakan perbandingan antara RSRP dan RSSI, parameter yang menentukan kualitas dari sinyal yang diterima.

* **SINR ( Signal to Interference Noise Ratio )**<br>
merupakan parameter yang menyatakan tingkat kualitas sinyal yang diterima oleh user dalam satuan dB.  SINR merupakan perbandingan kekuatan sinyal terima dengan derau/interferensi