

https://github.com/blacksmithgu/obsidian-dataview




## 常规操作

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


## js



[dataview API](https://blacksmithgu.github.io/obsidian-dataview/api/code-reference/)

[函数说明](https://coffeetea.top/zh/dataview/dataviewjs-fuction.html)

### dv.current()🍇查询当前页
```js


```


### dv.page(path)🍊查询路径

```js
dv.page("Index") => 查询文件路径为 /Index 文件夹
dv.page("books/The Raisin.md") => 查询文件路径为 /books/The Raisin.md
```


###  dv.pages(source)    🍈查询指定页

```js
dv.pages() //查询库全部文件，类似于 from "" 
dv.pages("#books") //查询所有的 #books 标签，类似于 from #books
dv.pages('"folder"') //查询所有的文件夹 "folder"，必须有""双引号 
dv.pages("#yes or -#no") //查询标签#yes 或者 不包含#no标签的 
dv.pages('"folder" or #tag')//查询文件夹"folder" 或者 标签#tag

```


### dv.pagePaths(source) 🍉查询对象


```js
dv.pagePaths("#books") //页面路径中包含#books标签
```



```dataviewjs 

var i = [dv.pages().length,dv.pages(`"00_inbox"`).length,dv.pages(`"00_inbox"`).length, dv.pages().file.etags.distinct().length]

dv.paragraph(`总共有 **${i[0]}** 个文件`) 
dv.paragraph(`其中==笔记== **${i[1]}** 篇，==收集文章== **${i[2]}** 篇`) dv.paragraph(`==标签== **${i[3]}**个`)


```


## moment 时间

```js
moment().format('YYYY-MM-DD')
moment(Number(p.file.cday)).get("year")
moment(Number(p.file.cday)).format("yyyy-MM-DD")
```


## 功能：显示文件的时间

```dataviewjs
dv.list(
  dv
    .pages(``)
    .filter((p) => moment(Number(p.file.cday)).format("yyyy-MM-DD") == moment().format('YYYY-MM-DD'))
    .sort((p) => p.file.cday, "desc")
    .map(
      (p) =>
        moment(Number(p.file.cday)).format("yyyy-MM-DD") + " >> " + p.file.link,
    ),
);

```


```dataviewjs
for(let i of dv.pagePaths(`"00_inbox"`).groupBy(p=>p.split("/")[1])){
	dv.paragraph(`### ${i.key}`);
	let a = dv.pages(`"00_inbox/${i.key}"`).length
	dv.paragraph(`共有==${a}==篇`);
	dv.list(
		dv.pages(`"00_inbox"`)
			.filter(p=>p.file.folder.split("/")[1]==i.key)
			.map(p=>p.file.link+' - '+moment(moment().diff(moment(Number(p.file.cday)),'days'))+'天' )
	);
}
```



```dataviewjs
for (let page of dv.pages()) {
	//console.log(page)
}
```


## 每月笔记数量的折线图
```dataviewjs
var y = "2024"
var m = Array(12).fill(0).map(function(v,i){return i});
var d = [31,29,31,30,31,30,31,31,30,31,30,31]

for(let i of m)
{
    var n = Array(d[i]).fill(0).map(function(v,i){return i+1});
    var data = Array(d[i]).fill(0);

    for(let j of dv.pages(``).filter(p=>String(p.file.cday).split("-")[0]==y && String(p.file.cday).split("-")[1]==i+1).groupBy(p=>String(p.file.cday).split("-")[2].slice(0,2)))
         data[j.key-1] = dv.pages(``).filter(p=>String(p.file.cday).split("-")[2].slice(0,2)==j.key).length;

    if(data.every(p=>p==0))
        continue
    dv.header(4, i+1+"月");
    dv.paragraph(`\`\`\`chart
type: line
labels: [${n}]
series:
- title: 200-笔记
  data: [${data}]
labelColors: true
\`\`\``)
}
```



```dataviewjs
const term = "00_inbox"
const files = dv.pages(`"00_inbox"`).filter(p=>String(p.tags)sort(p=>p.file.name)
const b = files.map(async function(p){
    var x = await app.vault.readRaw(p.file.path);
    x = x.split("\n### ").filter(p=>p.slice(0,term.length)==term)[0];
    dv.paragraph("## "+p.file.name+"\n\`\`\`ad-note\ntitle: DailyNote\n"+x.slice(term.length)+"\n\`\`\`");
}
)
```


## list task
dv.taskList(dv.current().file.tasks)
dv.taskList(dv.page("perions/体检.md").file.tasks)

```dataviewjs
dv.taskList(dv.pages('"perions"').file.tasks.where(t => t.text.includes("")))
```


