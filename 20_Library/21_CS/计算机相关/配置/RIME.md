---

tags:
  - cb
创建时间: 2025-05-30 21:06:38
三观: Happy
title: "[[RIME ]]"
---


```dataviewjs
dv.taskList(dv.current().file.tasks.where(t => t.text.includes("")))
```



## 设计
「输入引擎 Processors」: 引擎核心，处理按键消息。利用选词扩展实现「以词定字」功能，即在此组件下配置。
「翻译器 Translators」: 翻译器，完成编码到文字的翻译。类似「动态日期时间」、「符号转换」、「用户自定义词典」等功能，即在此组件下配置。
「过滤器 Filters」: 1. - 过滤器，过滤重排候选项，进入候选序列。「emoji」、「简繁转换」、「去重」、「单字优先」、「长句优先」等功能，即在此组件下配置。
「拼写运算」、
「码表」、
「词典」
ji lu

1. Dictionary：字典，亦即词库。
2. Custom_phrase：用户自定义短语。
3. 



### 配置说明
[定制指南](https://github.com/rime/home/wiki/CustomizationGuide)

[配置项解读](https://github.com/LEOYoon-Tsaw/Rime_collections/blob/master/Rime_description.md)
[配置解读2](https://github.com/KyleBing/rime-wubi86-jidian/wiki/Schema.yaml-%E8%AF%A6%E8%A7%A3)

查看应用名称



```bash
yabai -m query --windows  | jq '.[]|{id,app,title}'

osascript -e 'id of app "Visual Studio Code"'


aerospace list-apps


```



[样式配置项解读](https://github.com/LEOYoon-Tsaw/Rime_collections/blob/master/%E9%BC%A0%E9%AC%9A%E7%AE%A1%E4%BB%8B%E9%9D%A2%E9%85%8D%E7%BD%AE%E6%8C%87%E5%8D%97.md)
[样式配置解读2](https://github.com/KyleBing/rime-wubi86-jidian/wiki/%E7%9A%AE%E8%82%A4%E9%85%8D%E7%BD%AE%E8%AF%A6%E8%A7%A3)
[主题调试](https://gjrobert.github.io/Rime-See-Me-squirrel/)

### 配置方案 

需求: 中文不选择, 英文有提示, 中英混输, 中拼音混输


虎码
小鹤音形
墨奇方案

[配置方案:凇鹤拼音 —— Rime 简体中文输入法方案，整合了雾凇拼音和小鹤双拼/音形方案的拼音输入法。](https://github.com/kchen0x/rime-crane?tab=readme-ov-file)


ocm
ola
ovs
ofd

oar





[万象方案](https://github.com/amzxyz/rime_wanxiang_pro)
[白霜拼音](https://github.com/gaboolic/rime-frost)
[配置方案:雾凇拼音](https://github.com/iDvel/rime-ice)


[临时英文方案](https://github.com/KyleBing/rime-wubi86-jidian/issues/154)

[配置方案:86五笔极点码表 for 鼠须管(macOS)、小狼毫(Windows)、中州韵(Ubuntu) 、仓（iOS）、同文（Android）五笔输入方案，五笔输入法，Rime 方案。](https://github.com/KyleBing/rime-wubi86-jidian/tree/master)


[双拼在线练习](https://api.ihint.me/shuang)


#### 工具性功能
**以词定字** 
选中第一个词的第一个或者第二个字 通过[]

**日期** 
关键字: time date  输入日期

**快捷应用**

```lua
		["oav"] = { "[Rime 程序目录]" }, 
		["ocm"] = { "[终端]" },          
		["ofd"] = { "[访达]" },          
		["ola"] = { "[Lark]" },          
		["oob"] = { "[Obsidian]" },      
		["oar"] = { "[Arc]" },           
		["ovs"] = { "[vs]" },            
		["ogj"] = { "[Rime 用户目录]" }, 
		["ojf"] = { "[简繁切换]" },      
		["ojs"] = { "[计算器]" },        
		["owd"] = { "[Word]" },          

```

Ghttp://log-settings.byted.org/service/2/sdk_settings/"