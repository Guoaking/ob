---
tags:
  - cb
创建时间: 2024-12-17 10:06:45
三观: Happy
title: "[[yabai]]"
天气: "🌱北京: ☀️   🌡️+9°C 🌬️↑4km/h"
---


```dataviewjs
dv.taskList(dv.current().file.tasks.where(t => t.text.includes("")))
```

- [ ] 自动把应用搞到桌面上


https://github.com/koekeishiya/yabai/issues/2097

`areoaspace` 有点试图通过采用非常具体的解决方法来创建一个不同的 macOS，并且“不太好用”macOS 功能，而是与 macOS 一起运行，而不是致力于替换东西。

`yabai` 目标是增强 macOS 体验，而不是取代它。 
当我想要提高工作效率时，我可以使用键盘快捷键，而不需要愚蠢地缓慢的动画。当我只想放松和浏览并且并不真正关心速度时，我可以使用触摸板手势进行导航（故意使用动画）。

`Amethyst`


* display:  显示器概念
* space: 桌面概念
* 



## 常用操作

```bash







```

### display显示器相关



### space桌面相关

```bash


yabai -m space --display <DISPLAY_SEL>
yabai -m space <SPACE_SEL> --display <DISPLAY_SEL>

yabai -m query --spaces | jq '.[] | {index,label,display}'



```




### 事件回调



## 禁用sip
```bash
csrutil enable --without fs --without debug --without nvram
```


```bash 
csrutil status
System Integrity Protection status: enabled.
```



