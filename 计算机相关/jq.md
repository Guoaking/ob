
```

jq '.data| length'



cat  cale_all.json | jq  . > cale.json


cat cale.json  | jq '.data[]|{ "name":.name,"value":.value,"description":.description}' > cale_sip.json


cat cale.json  | jq '.data[]| select(.value != "")| { "name":.name,"value":.value,"description":.description}' > cale_sip.json


cat cale.json  | jq '.data[]| select(.value != "")| [{ "name": .[].name, "value": .[].value }]' > cale_sip1.json


cat cale.json  | jq '.data| [{ "name": .[].name, "value": .[].value }]' > cale_sip1.json


cat cale.json  | jq '.data| map(select(.value != "") | { "name": .name, "value": .value })' > cale_sip1.json

cat cale.json  | jq '.data| map(select(.value | contains("user_id")) | { "name": .name, "value": .value,"description":.description })' > cale_sip1.json


cat cale_sip1.json | jq 'map(.value | fromjson)'


cat cale.json | jq '.data| map(select(.value != "") | { "name": .name, "value": .value }) | map(.value | fromjson) | .[].user_id '  

cat cale.json | jq '.data| map(select(.value != "") | { "name": .name, "value": .value }) | map(.value | fromjson) | .[].user_id '  

cat cale.json  | jq '.data| map(select(.value | contains("user_id")) | { "name": .name, "value": .value,"description":.description })| map(.value | fromjson) | .[].user_id' 


cat im_all.json |jq '.data| map(select(.value | contains("user_id")) | { "name": .name, "value": .value,"description":.description })| map(.value | fromjson) | .[].user_id' 


cat search_all.json  |jq '.data| map(select(.value | contains("user_id")) | { "name": .name, "value": .value,"description":.description })| map(.value | fromjson) | .[].user_id' 


7348385919433360233


cat ~/Downloads/search_all.json  |jq '.data| map(select(.value | contains("user_id")) | { "name": .name, "value": .value,"description":.description })| map(.value | fromjson) | map(select(.tenant_id ==7348385919433360233 ) | {"user_id":.user_id,"tenant_id":.tenant_id}) | .[].user_id '



cat ~/Downloads/im_all.json  |jq '.data| map(select(.value | contains("user_id")) | { "name": .name, "value": .value,"description":.description })| map(.value | fromjson) | map(select(.tenant_id ==7348385919433360233 ) | {"user_id":.user_id,"tenant_id":.tenant_id}) | .[].user_id '


cat ~/Downloads/cale.json   |jq '.data| map(select(.value | contains("user_id")) | { "name": .name, "value": .value,"description":.description })| map(.value | fromjson) | map(select(.tenant_id ==7348385919433360233 ) | {"user_id":.user_id,"tenant_id":.tenant_id}) | .[].user_id '







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
7349120198177194857
7349121247860507498
7349121237899019113
7349121194081125226
7349120254926127977
7349121227002217322
7349121216600343402
7349120175087551337
7349120829549970281
7349120840002175849
7349120850357912425
7349120243526009705
7349120231958119274
7349121206043280234
7349120186202456938
7349121194081125226
7349121184115458921
7349121173721973609
7349121184115458921
7349121152914031465
7349120221078094697
7349121142398911337
7349121131661493098
7349121121171538794
7349121111210066793
7349121247860507498
7349120254926127977
7349120243526009705
7349121237899019113
7349120231958119274
7349121227002217322
7349120175087551337
7349121206043280234
7349121194081125226
7349120221078094697
7349120209032053610
7349121184115458921
```