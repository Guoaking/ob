

https://github.com/SilentVoid13/Templater

https://silentvoid13.github.io/Templater/

https://shbgm.ca/blog/obsidian/Templater+Snippets

https://silentvoid13.github.io/Templater/settings.html


模版增强
快捷输入
### 语法
命令: <%  %>
函数: 



### 内部函数
它们是插件内构建的**预定义**函数。例如， `tp.date.now`是一个内部函数，它将返回当前日期。
[内部函数官方手册](https://silentvoid13.github.io/Templater/internal-functions/overview.html)


多光标, 跳光标
```javascript 
<% tp.file.cursor(1) %>Content<% tp.file.cursor(1) %>
```



### 用户函数

用户可以定义自己的功能。它们要么是[系统命令](https://silentvoid13.github.io/Templater/user-functions/system-user-functions.html)，要么[是用户脚本](https://silentvoid13.github.io/Templater/user-functions/script-user-functions.html)。