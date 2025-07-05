---
layout: post
title:  "Excel : Membuat Tombol Print"
date:   2020-10-15 18:48
tags: [aplikasi, msexcel]
category: Archive
description: ""
---

* `Insert` --> `Shapes` --> kemudian pilih Shapes yang berbentuk kotak
* Klik Kanan `Assign Macro`
* Isi Mikro Name : Print --> `New`
* Masukkan Kode berikut pada Module(code)
  ``` vba
  Sub Cetak()
  ActiveSheet.PrintOut
  End Sub
   ```
   
# Syntax Menarik
 
|Code VBA |	Fungsi|
| :--- | :--- |
|ActiveWorkbook.PrintOut|Mencetak workbook yang aktif|
|Worksheets.PrintOut| Mencetak semua Worksheet|
|Sheets.PrintOut |	Mencetak semua Sheet|
|Sheets("Sheet1").PrintOut |	Mencetak Sheet 1 saja|
|Sheet1.PrintOut |	Mencetak Sheet 1 saja|
|Sheets(Array("Sheet1","Sheet3")).PrintOut  | 	Mencetak Sheet1 dan Sheet3 (Sheet yg ada dalam Array)|
|Selection.PrintOut |	Mencetak Range yang di Select atau di blok|
|Range ("A1:F10").PrintOut |	Mencetak data di range A1:F10|


# Referensi
* <https://www.rumusexcel.com/2014/05/cara-membuat-tombol-cetak-di-excel.html>
