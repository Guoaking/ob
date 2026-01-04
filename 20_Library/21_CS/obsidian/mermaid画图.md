
[Mermaid Tools](Mermaid%20Tools.md)


官方网站：​ ​<https://mermaid-js.github.io/​>

在线调试： Mermaidv10.9.0 Live Editor

[Obsidian 针对项目文件的自动任务甘特图](https://forum-zh.obsidian.md/t/topic/36500)

[流程图教程](https://pkmer.cn/Pkmer-Docs/02-%E7%9F%A5%E8%AF%86%E7%AE%A1%E7%90%86%E5%9F%BA%E7%A1%80/mermaid/mermaid%E8%AF%AD%E6%B3%95-%E6%B5%81%E7%A8%8B%E5%9B%BE/)
[时序图教程](https://pkmer.cn/Pkmer-Docs/02-%E7%9F%A5%E8%AF%86%E7%AE%A1%E7%90%86%E5%9F%BA%E7%A1%80/mermaid/mermaid%E8%AF%AD%E6%B3%95-%E6%97%B6%E5%BA%8F%E5%9B%BE/)





```mermaid
flowchart LR
a --> b

subgraph 标品演练  
标品演练独有节点 --> 加工白名单网络配置  & 创建测试用例 & 开启工单自动同步 & 制作oapi_doc工单  
制作oapi_doc工单 --> 通知apigw工单平台检查  
end

```



## 甘特图
甘特图是一种柱状图，说明了项目进度表以及任何一个项目完成所需的时间。
甘特图显示了项目的终端元素和摘要元素的开始日期和完成日期之间的天数。
最初由 Karol Adamiecki 于 1896 年开发，并由 Henry Gantt 在 1910 年代独立开发


[甘特图教程](https://pkmer.cn/Pkmer-Docs/30-%E7%9F%A5%E8%AF%86%E7%AE%A1%E7%90%86%E5%BA%94%E7%94%A8/%E9%A1%B9%E7%9B%AE%E7%AE%A1%E7%90%86/%E5%88%A9%E7%94%A8-mermaid-%E7%94%98%E7%89%B9%E5%9B%BE%E5%9C%A8-obsidian-%E4%B8%AD%E7%AE%A1%E7%90%86%E9%A1%B9%E7%9B%AE%E8%BF%9B%E5%BA%A6/)

[甘特图nodejs中文](https://mermaid.nodejs.cn/syntax/gantt.html)

```mermaid
gantt
        title A Gantt Diagram
        dateFormat  YYYY-MM-DD
        section Section
        A task           :a1, 2014-01-01, 30d
        Another task     :after a1  , 20d
        section Another
        Task in sec      :2014-01-12  , 12d
        another task      : 24d
```




```mermaid
gantt
        dateFormat  YYYY-MM-DD
        title       Adding GANTT diagram functionality to mermaid
        excludes    weekends
    
        section A section
        Completed task            :done,    des1, 2014-01-06,2014-01-08
        Active task               :active,  des2, 2014-01-09, 3d
        Future task               :         des3, after des2, 5d
        Future task2              :         des4, after des3, 5d
    
        section Critical tasks
        Completed task in the critical line :crit, done, 2014-01-06,24h
        Implement parser and jison          :crit, done, after des1, 2d
        Create tests for parser             :crit, active, 3d
        Future task in critical line        :crit, 5d
        Create tests for renderer           :2d
        Add to mermaid                      :1d
        Functionality added                 :milestone, 2014-01-25, 0d
    
        section Documentation
        Describe gantt syntax               :active, a1, after des1, 3d
        Add gantt diagram to demo page      :after a1  , 20h
        Add another diagram to demo page    :doc1, after a1  , 48h
    
        section Last section
        Describe gantt syntax               :after doc1, 3d
        Add gantt diagram to demo page      :20h
        Add another diagram to demo page    :48h
```


```mermaid
gantt
        dateFormat HH:mm
        axisFormat %H:%M
        Initial milestone : milestone, m1, 17:49,2min
        taska2 : 10min
        taska3 : 5min
        Final milestone : milestone, m2, 18:14, 2min
```



```mermaid
gantt

	title Mermaid 甘特图示例

	%% 起止日期语法格式
   	dateFormat  YYYY-MM-DD
   	%% 最下方时间轴日期格式
	axisFormat %Y-%m
	%% 最下方时间轴时间间隔
	tickInterval 1month
	%% 表示今天标记的显示样式
	todayMarker stroke-width:3px,stroke:#FBBC05,opacity:0.6

	%% 定义任务分类/区
	section 项目开始
	项目开始: done, a0, 2023-01-01, 1d
	
	section 工作包 1
	开会讨论项目工作计划: done, a1, after a0, 2023-01-05
	执行工作包 1: done, a2, after a1, 6M
	汇报及讨论工作包 1 成果: done, a3, after a2, 5d

    section 工作包 2
    执行工作包 2: active, a4, after a3, 5M
	汇报及讨论工作包 2 成果: active, a5, after a4, 5d
    
    section 里程碑
	M1 - 完成工作包 1: milestone, after a2, 0d
	M2 - 完成工作包 2: milestone, after a4, 0d
	M3 - 提交项目报告: crit, milestone, 2024-01-20, 0d
	
	section 项目结束
	项目结束: active, 2023-12-30, 1d
```


