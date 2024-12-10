---

tags:
  - cb
创建时间: 2024-11-10 21:51:54
三观: Happy
title: "[[macos]]"
---


## DNS

```plain_text
networksetup -setdnsservers Wi-Fi 8.8.8.8 114.114.114.114 180.76.76.76

清空dns缓存
dscacheutil -flushcache


```

可以一次设置多个DNS， 常用的DNS：

- 114DNS： 114.114.114.114 114.114.115.115
- 阿里DNS： 223.5.5.5 223.6.6.6
- 百度DNS： 180.76.76.76
- Google DNS： 8.8.8.8 8.8.4.4
```


dscacheutil -flushcache




```



一个命令行时间
https://github.com/chubin/wttr.in

```shell
curl "wttr.in/~BeiJing+HaiDian?format=4" -H 'Accept-Language:zh-CN'
```

BeiJing+HaiDian: ☀️   🌡️+2°C 🌬️↓4km/h

