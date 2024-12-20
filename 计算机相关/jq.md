{}Jq 文档

官方: https://jqlang.github.io/jq/manual/v1.7/#streaming

中文 1.5: https://alingse.github.io/jq-manual-cn/manual/v1.5/


 ### 序列化/反序列化（Serialization/Deserialization）


| Option | Description              |
| ------ | ------------------------ |
| `-R`   | 序列化 (將 JSON 格式轉成可以傳輸的字串) |
| `-r`   | 反序列化 (將字串轉回 JSON 格式)     |

```bash
sed 's/"//g'
```




```shell

jq '.data| length'



cat cale.json  | jq '.data| map(select(.value | contains("user_id")) | { "name": .name, "value": .value,"description":.description })| map(.value | fromjson) | .[].user_id' 


cat ~/Downloads/search_all.json  |jq '.data| map(select(.value | contains("user_id")) | { "name": .name, "value": .value,"description":.description })| map(.value | fromjson) | map(select(.tenant_id ==7348385919433360233 ) | {"user_id":.user_id,"tenant_id":.tenant_id}) | .[].user_id '



cat ~/Downloads/im_all.json  |jq '.data| map(select(.value | contains("user_id")) | { "name": .name, "value": .value,"description":.description })| map(.value | fromjson) | map(select(.tenant_id ==7348385919433360233 ) | {"user_id":.user_id,"tenant_id":.tenant_id}) | .[].user_id '



```

```
 jq '[{ "name": .[].name, "value": .[].value }]'
```

```
map(select(.value != "") | { "name": .name, "value": .value })
```

```
map(select(.value | contains("user_id")) | { "name": .name, "value": .value })
```


```
map({ "name": .app, "title": .title })
```


```
map(. + []))

cat 2.txt | jq '.data.list | map(.name )'

```


```
cat gw.all | jq '.data.list | map(select(.real_count==0)|.name)'

```


```
cat code.txt | jq '.data.list[]|.ticket_code' | sed 's/"//g'  | tr '\n' ',' | awk '{print substr($0, 1, length($0) - 1)}'



cat code.txt | jq '.data.list[]|.ticket_code'  | tr '\n' ',' | awk '{print substr($0, 1, length($0) - 1)}'


cat black.txt  | jq '.data.list[]| select(.ticket_type!="license")|.ticket_code' | sed 's/"//g'  | tr '\n' ',' | awk '{print substr($0, 1, length($0) - 1)}'


```
### Socat 

### Netcat ?


### Netstat?


## 磁盘设备

Mount

Lsblk

列出所有的块设备和他们的依赖关系
设备挂载点

磁盘分区表类型: GPT 和 MBR
`parted -l`

`fdisk -l`


块设备 SCSI 设置


## sed

```shell


## 从前往后
sed -n '1,/2024-08-02 19:10/ p' filtered_logs.log > filtered_logs_new.log

## 从后往前
sed -n '/2024-08-02 16:40/,$ p' deploy_task.log > filtered_logs.log ; 

```



```bash 
curl --request GET \
  --url http://lark-edgeproxy-boe.byted.org/ep/api/v1/publicnet/list \
  --header 'Content-Type: application/json' | jq '.data|map({ "unit": .unit, "idc": .idc })' > v1.json



cat v1.json | jq '.|map(select(.unit=="kamigrate" or .idc=="kamigratelark"))' > v2.json




curl --request GET \
  --url http://lark-edgeproxy-boe.byted.org/ep/api/v1/publicnet/list \
  --header 'Content-Type: application/json' | jq '.data|map({ "unit": .unit, "idc": .idc })' | jq '.|map(select(.unit=="kamigrate" or .idc=="kamigratelark"))'






```