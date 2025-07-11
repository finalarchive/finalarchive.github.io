# Interfaces up/down
## Mengunakan ip

#### Cek network yang tersedia

    ip link show

#### Pengunaan
    ip link set dev <interface> up
    ip link set dev <interface> down

**Contoh**

    ip link set dev eth0 up
    ip link set dev eth0 down

## Mengunakan Ifconfig

#### Cek network yang tersedia
    ifconfig -a

#### Pengunaan

    /sbin/ifconfig <interface> up
    /sbin/ifconfig <interface> down

**Contoh**

    /sbin/ifconfig eth0 up
    /sbin/ifconfig eth0 down


**Edit**

Ubuntu 20.04

    nano /etc/netplan/00-installer-config.yaml

* Contoh isi
```
 network:
   ethernets:
     enp0s3:
       dhcp4: true
   version: 2
```
* Untuk IP Static
```
 network:
   version: 2
   ethernets:
     enp4s0f2:
       addresses: [192.168.100.2/24]
       gateway4: 192.168.20.1
       nameservers:
         addresses: [192.168.100.1, 8.8.8.8]
```

**Kemudian lakukan**

    sudo netplan apply
    sudo reboot