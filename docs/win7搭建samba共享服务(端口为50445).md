**win7搭建samba共享服务，端口为50445**



samba server(软终端)：假设其IP为192.168.10.10
```
netsh interface portproxy add v4tov4 listenport=50445 connectaddress=192.168.10.10 connectport=445 protocol=tcp
```

samba client(vm)：其中的192.168.10.10为samba server的IP
```
sc config smb start= demand
sc config iphlpsvc start= auto
sc config FDResPub start= demand
netsh interface portproxy add v4tov4 listenaddress=127.0.0.1 listenport=445 connectaddress=192.168.10.10 connectport=50445 protocol=tcp

配置完成之后，需要重启机器
```

访问方法
在samba client，直接输入\\127.0.0.1进行访问

