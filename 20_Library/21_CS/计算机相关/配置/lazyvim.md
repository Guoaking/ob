---

tags:
  - cb
创建时间: 2025-04-26 16:00:07
三观: Happy
title: "[[lazyvim]]"
---


```bash
brew install imagemagick. // 用于处理和显示非 PNG 格式的图片。
brew install rust
brew install wget

brew install ghostscript  // pdf

# 安装 tectonic (推荐，较小). 缺少 LaTeX 编译器
brew install tectonic

# 提供更强大的基于代码结构（AST）的搜索和替换。如果需要此高级功能
brew install ast-grep //



brew install eza

Linux下的文件除非所有的fd都关闭了，不然不会真正的删除。你去找进程号，然后/proc/pid/fd 下面找一下对应的文件，复制一下就行了。比如3 ->  xxx.log，你把这个fd=3的文件复制出来就行了


```



```dataviewjs
dv.taskList(dv.current().file.tasks.where(t => t.text.includes("")))
```

