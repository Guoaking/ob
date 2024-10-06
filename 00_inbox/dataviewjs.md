

https://github.com/blacksmithgu/obsidian-dataview


[dataview API](https://blacksmithgu.github.io/obsidian-dataview/api/code-reference/)


## Dataview

> https://blacksmithgu.github.io/obsidian-dataview/queries/structure/
> https://github.com/blacksmithgu/obsidian-dataview

> 保存常用查询
> 生成文件夹索引
> https://blacksmithgu.github.io/obsidian-dataview/queries/structure/




1. 搜索 cmd + f
2. 全局  shift+ cmd + f
	1. OR AND
	2. - 

### 查询
1. Query 

```query
搜索
```


* dataview list

> List from "00_inbox"


```dataview
list from "00_inbox"
```

List where 
> List from "00_inbox" where title ="yaml"

```dataview
list from "00_inbox" where title ="yaml" and rating > 5
```



```
[list|table|task] field... as myfield 
from #tag or "folder" or [[link]] or outgoing([[link]])
where field [>|>=|<|<=|=|&|] [value] and or (..)
sort field [ascending|descending|asc|desc] 


task where meta(section).subpath = "1-6级标题名称" 
```




> Table file. Name as name, file. Size as size from "00_inbox" sort file. Size desc

```dataview

table file.name as name, file.size as size from "00_inbox" sort file.size desc
```


```
TypeError: Cannot read properties of null (reading 'addPlugin')

```