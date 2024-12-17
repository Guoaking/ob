---
<%*
 let title  = tp.file.title;
 if (title.startsWith("未命名")) {
	title = await tp.system.prompt("输入文件名");
	if(!title) return;
 }
 if (title == "") {
 title = "怎么未命名啊"
 } else {
 await tp.file.rename(title);
 }
-%>

tags:
  - cb
创建时间: <% tp.date.now("YYYY-MM-DD HH:mm:ss") %>
三观: <% tp.system.suggester(["Happy", "Sad", "Confused"], ["Happy", "Sad", "Confused"]) %>
title: "[[<% title %>]]"
天气: "🌱北京<% tp.user.tianqi("") %>"
---

**<% tp.date.now("YYYY-MM-DD") %>**🌱<% tp.user.tianqi("") %>




```dataviewjs
dv.taskList(dv.current().file.tasks.where(t => t.text.includes("")))
```


