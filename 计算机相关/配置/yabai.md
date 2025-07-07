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

```

```


### space桌面相关

```bash


# 所有显示器
yabai -m query --displays  |  jq '.[] |  {id,index,spaces,"has-focus",label}'

# 所有桌面
yabai -m query --spaces | jq '.[] | {id,index,display,"has-focus",label}'

# 所有窗口

yabai -m query --windows  | jq '.[]|{id,app,title}'




```


display 
**--focus** _<DISPLAY_SEL>_: 聚焦给定的显示器。
**--space** _<SPACE_SEL>_: 给定的空间将在所选显示器上可见，而不会改变焦点。  
* 给定的空间必须属于选定的显示器。  
* 必须部分禁用系统完整性保护。
**--label**  < > : 为所选显示添加标签，从而允许将该标签用作采用 `DISPLAY_SEL` 参数的命令中的别名。 
* 如果调用该命令时没有参数，它将尝试删除以前分配的标签。


### window 窗口

```bash


{
  "id": 8338,
  "app": "Obsidian",
  "title": "yabai - obsidian - Obsidian v1.7.7"
}


## 将窗口移动到 指定的桌面 不填则是当前窗口
yabai -m window 1 --space  1

## 将窗口移动到 指定的显示器
yabai -m window 1  --display 1
 /opt/homebrew/bin/yabai -m window --display 2 --focus
## 所选窗口和给定窗口的交换位置
yabai -m window 1 --swap 1

## 设置所选窗口的不透明度。
yabai -m window 1 --opacity 0.5

--scratchpad [_<LABEL>|恢复_] 用于标识窗口暂存器的唯一标识符。


```



### space 桌面

```bash

{
  "index": 1,
  "label": "",
  "display": 1,
  "has-focus": false
}


--focus need disable sip

## 将窗口移动到 指定的桌面 不填则是当前窗口


yabai -m space 1 --space  1

## 将窗口移动到 指定的显示器
yabai -m space 1  --display 1

## 当前focus桌面和给定桌面的交换位置
yabai -m space  --switch 1

## 设置所选窗口的不透明度。
yabai -m space 1 --opacity 0.5

--scratchpad [_<LABEL>|恢复_] 用于标识窗口暂存器的唯一标识符。


```



### 标签相关

```bash


# 设置标签
yabai -m display 1  --label mac 
yabai -m display 2  --label homed
yabai -m display 2  --label workmain



## space 老是丢, 所以直接用id
yabai -m space  1  --label mac1
yabai -m space  2  --label mac2

yabai -m space  4  --label main1
yabai -m space  5  --label main2

```


### 事件
> 需要配合信号命令自动化处理


```bash

## 添加信号
yabai -m signal --add event=display_focused action="sh /path/to/move_chrome_to_new_display.sh"

event=<EVENT> action=<ACTION> [label=<LABEL>] [app[!]=<REGEX>] [title[!]=<REGEX>] [active=yes|no]

<ACTION>: 通过 /usr/bin/env sh -c 执行的任意命令


## 查看信号
yabai -m signal --list

## 移除信号
yabai -m signal --remove <SIGNAL_SEL>


yabai -m signal --add event=display_removed action="sh /Users/bytedance/Documents/project/script/yabai_display_add_and_remove.sh" active=yes

yabai -m signal --add event=display_added action="sh /Users/bytedance/Documents/project/script/yabai_display_add_and_remove.sh" active=yes


```


> **display_added**: 添加新显示时触发。  
> **display_removed**: 在删除显示器时触发。  
> **application_launched**: 启动新应用程序时触发。  
> **window_created**: 创建窗口时触发。  

#### 显示器 
**display_added**: 添加新显示时触发。  
Passes two arguments: $YABAI_DISPLAY_ID, $YABAI_DISPLAY_INDEX  
传递两个参数：YABAI_DISPLAY_ID, YABAI_DISPLAY_INDEX

**display_removed**: 在删除显示器时触发。  
Passes one argument: $YABAI_DISPLAY_ID  
传递一个参数：$YABAI_DISPLAY_ID

**display_moved**: 在对显示排列进行更改时触发。  
Passes two arguments: $YABAI_DISPLAY_ID, $YABAI_DISPLAY_INDEX  
传递两个参数：$YABAI_DISPLAY_ID、$YABAI_DISPLAY_INDEX

**display_resized**: 当显示器更改了分辨率时触发。  
Passes two arguments: $YABAI_DISPLAY_ID, $YABAI_DISPLAY_INDEX  
传递两个参数：$YABAI_DISPLAY_ID、$YABAI_DISPLAY_INDEX

**display_changed**: 当活动显示已更改时触发。  
Passes four arguments: $YABAI_DISPLAY_ID, $YABAI_DISPLAY_INDEX, $YABAI_RECENT_DISPLAY_ID, $YABAI_RECENT_DISPLAY_INDEX  
传递四个参数：YABAI_DISPLAY_ID、YABAI_DISPLAY_INDEX、YABAI_RECENT_DISPLAY_ID、YABAI_RECENT_DISPLAY_INDEX

#### 工作区桌面
**space_created**: 创建空间时触发。  
Passes two arguments: $YABAI_SPACE_ID, $YABAI_SPACE_INDEX  
传递两个参数：$YABAI_SPACE_ID、$YABAI_SPACE_INDEX

**space_destroyed**: 当空间被销毁时触发。  
Passes one argument: $YABAI_SPACE_ID  
传递一个参数：$YABAI_SPACE_ID

**space_changed**: 当活动空间发生更改时触发。  
Passes four arguments: $YABAI_SPACE_ID, $YABAI_SPACE_INDEX, $YABAI_RECENT_SPACE_ID, $YABAI_RECENT_SPACE_INDEX  
传递四个参数：$YABAI_SPACE_ID、$YABAI_SPACE_INDEX、$YABAI_RECENT_SPACE_ID、$YABAI_RECENT_SPACE_INDEX


#### 程序

**application_launched**: 启动新应用程序时触发。  

Eligible for **app** filter.  
符合**应用**筛选器的条件。  
Passes one argument: $YABAI_PROCESS_ID  
传递一个参数：$YABAI_PROCESS_ID

**application_terminated**: 应用程序终止时触发。  

Eligible for **app** and **active** filter.  
符合**应用程序和****活动**筛选器的条件。  
Passes one argument: $YABAI_PROCESS_ID  
传递一个参数：$YABAI_PROCESS_ID

**application_front_switched**: 当最前面的应用程序发生更改时触发。  

Passes two arguments: $YABAI_PROCESS_ID, $YABAI_RECENT_PROCESS_ID  
传递两个参数：$YABAI_PROCESS_ID、$YABAI_RECENT_PROCESS_ID

**application_activated**: 激活应用程序时触发。  
Eligible for **app** filter.  
符合**应用**筛选器的条件。  
Passes one argument: $YABAI_PROCESS_ID  
传递一个参数：$YABAI_PROCESS_ID

**application_deactivated**: 在应用程序停用时触发。  
Eligible for **app** filter.  
符合**应用**筛选器的条件。  
Passes one argument: $YABAI_PROCESS_ID  
传递一个参数：$YABAI_PROCESS_ID

**application_visible**: 在应用程序取消隐藏时触发。  
Eligible for **app** filter.  
符合**应用**筛选器的条件。  
Passes one argument: $YABAI_PROCESS_ID  
传递一个参数：$YABAI_PROCESS_ID

**application_hidden**: 当应用程序被隐藏时触发。  
Eligible for **app** and **active** filter.  
符合**应用程序和****活动**筛选器的条件。  
Passes one argument: $YABAI_PROCESS_ID  
传递一个参数：$YABAI_PROCESS_ID

#### 窗口

**window_created**: 创建窗口时触发。  
Also applies to windows that are implicitly created at application launch.  
也适用于在应用程序启动时隐式创建的窗口。  
Eligible for **app** and **title** filter.  
符合**应用程序和****标题**过滤器的条件。  
Passes one argument: $YABAI_WINDOW_ID  
传递一个参数：$YABAI_WINDOW_ID

**window_destroyed**: 当窗口被销毁时触发。  
Also applies to windows that are implicitly destroyed at application exit.  
也适用于在应用程序退出时隐式销毁的窗口。  
Eligible for **app** and **active** filter.  
符合**应用程序和****活动**筛选器的条件。  
Passes one argument: $YABAI_WINDOW_ID  
传递一个参数：$YABAI_WINDOW_ID

**window_focused** : 当 window 成为 key-window 时触发。  
Eligible for **app** and **title** filter.  
符合**应用程序和****标题**过滤器的条件。  
Passes one argument: $YABAI_WINDOW_ID  
传递一个参数：$YABAI_WINDOW_ID

**window_moved**: 当窗口更改位置时触发。  
Eligible for **app**, **title** and **active** filter.  
符合**应用程序**、**标题****和活动过滤器**的条件。  
Passes one argument: $YABAI_WINDOW_ID  
传递一个参数：$YABAI_WINDOW_ID

**window_resized**: 当窗口更改维度时触发。  
Eligible for **app**, **title** and **active** filter.  
符合**应用程序**、**标题****和活动过滤器**的条件。  
Passes one argument: $YABAI_WINDOW_ID  
传递一个参数：$YABAI_WINDOW_ID

**window_minimized**: 在窗口最小化时触发。  
Eligible for **app**, **title** and **active** filter.  
符合**应用程序**、**标题****和活动过滤器**的条件。  
Passes one argument: $YABAI_WINDOW_ID  
传递一个参数：$YABAI_WINDOW_ID

**window_deminimized**: 当窗口已最小化时触发。  
Eligible for **app** and **title** filter.  
符合**应用程序和****标题**过滤器的条件。  
Passes one argument: $YABAI_WINDOW_ID  
传递一个参数：$YABAI_WINDOW_ID

**window_title_changed**: 当窗口更改其标题时触发。  
Eligible for **app**, **title** and **active** filter.  
符合**应用程序**、**标题****和活动过滤器**的条件。  
Passes one argument: $YABAI_WINDOW_ID  
传递一个参数：$YABAI_WINDOW_ID

#### 其他

**mission_control_enter**: 当 mission-control 激活时触发。  
	Passes one argument: $YABAI_MISSION_CONTROL_MODE  
	传递一个参数：$YABAI_MISSION_CONTROL_MODE
**mission_control_exit**: 当 mission-control 停用时触发。  
	Passes one argument: $YABAI_MISSION_CONTROL_MODE  
	传递一个参数：$YABAI_MISSION_CONTROL_MODE
**dock_did_change_pref**: 当 macOS Dock 首选项更改时触发。
**dock_did_restart**: 当 Dock.app 重新启动时触发。
**menu_bar_hidden_changed**: 当 macOS 菜单栏_自动隐藏_设置发生更改时触发。
**system_woke**" 当 macOS 从睡眠状态唤醒时触发。





## 禁用sip
```bash
csrutil enable --without fs --without debug --without nvram
```


```bash 
csrutil status
System Integrity Protection status: enabled.
```




### 文件说明

```
/Users/bytedance/Documents/project/else/yabai/src/display_manager.c
display_manager_set_label_for_display 

标签应该是写在内存display_manager中, 会丢
```




### 小说


## [天才俱乐部](https://www.qidian.com/book/1037762892/ "天才俱乐部最新章节在线阅读")
## [这游戏也太真实了](https://www.qidian.com/book/1029391348/ "这游戏也太真实了最新章节在线阅读")
## [神秘复苏](https://www.qidian.com/book/1012584111/ "神秘复苏最新章节在线阅读")
## [黎明之剑](https://www.qidian.com/book/1010400217/ "黎明之剑最新章节在线阅读")
## [放开那个女巫](https://www.qidian.com/book/1003306811/ "放开那个女巫最新章节在线阅读")


## [末世：我的关键词比别人多一个](https://www.qidian.com/book/1036660859/ "末世：我的关键词比别人多一个在线阅读")


## [凡人修仙传](https://www.qidian.com/book/107580/ "凡人修仙传最新章节在线阅读")

