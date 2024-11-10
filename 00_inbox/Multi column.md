---
tags:
  - cb
创建时间: 2024-11-10 23:09:03
三观: Happy
title: "[[Multi column]]"
---

> 一行多个块




> [!multi-column] 
>>[!danger]+  重要紧急
>>```dataview
>>list
>>from 
>>	"Projects"
>>where 
>>	priority = "重要紧急" and
>>	status = "open"
>>sort date asc
>>```
>
>>[!important]+ 重要不紧急
>>```dataview
>>list
>>from 
>>	"Projects"
>>where 
>>	priority = "重要不紧急" and
>>	status = "open"
>>sort date asc
>>```

> [!multi-column]
>>[!warning]+ 紧急不重要
>>```dataview
>>list
>>from 
>>	"Projects"
>>where 
>>	priority = "紧急不重要" and
>>	status = "open"
>>sort date asc
>>```
>
>>[!info]+ 不紧急不重要
>>```dataview
>>list
>>from 
>>	"Projects"
>>where 
>>	priority = "不紧急不重要" and
>>	status = "open"
>>sort date asc
>>```



<progress value="20" max="50"></progress>

