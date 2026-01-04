---
tags:
  - cb
创建时间: 2025-02-06 17:43:54
三观: Happy
title: "[[vscode]]"
---

快捷键

- `command + i` 智能提示（触发建议） `editor.action.triggerSuggest`
- `shift + tab` 去除缩进 `outdent`
- `command + option + .` 快速修复 `editor.action.autoFix`
- `command + k commad + i` 显示悬停 `editor.action.showHover`（鼠标放置到代码符号处）
- `command + F2` 修改所有匹配项（相当于查找替换）
    
- `option + shift + F` 格式化文档
    
    - `editor.action.formatDocument` 格式化整个文档
        
    - `editor.action.formatSelection` 格式化选中内容
        
- `option + shift + o` 组织导入 `editor.action.organizeImports`
    
- `ctrl + shift + r` 重构 `editor.action.refactor`
    
- `editor.action.rename` 重命名 `editor.action.refactor`







```dataviewjs
dv.taskList(dv.current().file.tasks.where(t => t.text.includes("")))
```



```

```