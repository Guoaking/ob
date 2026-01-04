
TCP 传输层 (4)
IP 网络层 (3)

![](Pasted%20image%2020240611145216.png)

面向链接的, 可靠的, 基于字节流的传输层协议
特点: 
1. 点对点
2. 双向传递
3. 字节流 (报文段, 有序接收, 重复丢弃)
4. 流量缓冲: 解决速度不匹配
5. 可靠 (重发/重传)
6. 拥塞控制

在 linux 中
`sysctl -a`

`net.ipv4.tcp_syn_retries` 表示 TCP 主动链接端 SYN 数据包的最大重传次数
`net.ipv4.tcp_synack_retries` 表示 TCP 链接的被动端的 SYN+ACK 包的最大重传次数

`netstat -s` 显示每个协议的统计信息 (3, 4 层)

在 linux 中内核会维护 2 个队列

### 全链接队列 (accept)

`ss -ant` 查看全链接队列 `ss -lnt`
Recv-Q: 当前全链接队列的大小, 当前已完成三次握手并等待服务端 accept () 的 TCP 链接个数
Send-Q: 当前全连接队列的最大队列长度

**非 Listen 状态**
Recv-Q： 已收到但未被应用进程读取的字节数；
Send-Q： 已发送但未收到确认的字节数；

全链接队列的最大值取决于 min(somaxconn , backlog)
Somaxconn:  `cat /proc/sys/net/core/somaxconn`
Backlog: `backlog 大小，Nginx 默认值是511，可以通过修改配置文件设置其长度；`


### 半链接队列 (SYN )

```Bash
$ netstat -antpl | grep SYN_RECV | wc -l
查看服务器端当前 TCP 半连接队列大小


$ netstat -s | grep "SYNs to LISTEN"
查看半连接队列溢出， SYNs to LISTEN sockets dropped
也是历史累计值，如果有增长，说明半连接队列有溢出
```

最大值
`sysctl -a | grep net.ipv4.tcp_max_syn_backlog`
`sysctl -a | grep net.core.somaxconn`

本地端口的可用范围 
`sysctl -a | grep net.ipv4.ip_local_port_range`



![](Pasted%20image%2020240611150843.png)

Established

握手: syn -> ack/syn -> ack
挥手: fin 1 -> ack 1 -> fin 2 -> ack 2