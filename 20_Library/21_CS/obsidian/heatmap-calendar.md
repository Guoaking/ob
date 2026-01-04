---

tags:
  - cb
创建时间: 2024-12-09 13:08:36
三观: Happy
title: "[[heatmap-calendar]]"
banner_icon: ✋
---

```dataviewjs
dv.taskList(dv.current().file.tasks.where(t => t.text.includes("")))
```


https://github.com/Richardsl/heatmap-calendar-obsidian

## 1. Heatmap Calendar (by Richardsl)

## 优点：

- **灵活性**：支持多种数据类型的跟踪，如锻炼、财务和项目进度等，可以根据用户需求自定义数据。
- **颜色自定义**：允许用户自定义颜色方案和强度范围，便于视觉化不同的数据。
- **集成 Dataview**：与 Obsidian 的 Dataview 插件紧密集成，能够利用 Dataview 的强大功能来处理数据。
- **全球颜色设置**：可以在设置中定义全局颜色方案，方便在多个热图中使用。

## 缺点：

- **学习曲线**：由于需要使用 JavaScript 和 DataviewJS，可能对初学者不太友好。
- **依赖性**：需要依赖 Dataview 插件，对于不使用 Dataview 的用户可能不太适用。

- **`intensity`**：每个条目的强度值，用于映射颜色深度。强度值越高，对应的颜色越深。
- **`defaultEntryIntensity`**：默认条目强度，影响未指定强度的条目的颜色。
- **`intensityScaleStart` 和 `intensityScaleEnd`**：这两个属性定义了强度值的范围。强度值在这个范围内会被映射到颜色渐变上。例如，如果设置为0-100，则1-20会映射到最浅的颜色，而80-100会映射到最深的颜色。



```dataviewjs

dv.span("**🎉 文件跟踪 🎉**");

// 获取当前文件夹下的所有文档
const files = dv.pages(); // 替换为你的文件夹路径

// 统计每天创建的文档数量
let dailyCounts = {};
files.forEach(file => {
    const date = moment(Number(file.file.cday)).format("yyyy-MM-DD"); // 假设文件名为YYYY-MM-DD格式
    dailyCounts[date] = (dailyCounts[date] || 0) + 1; // 统计数量
});

// 构建热图日历所需的数据格式
const calendarData = {
	year: 2024,  // (optional) defaults to current year
	colors: {    // (optional) defaults to green
		blue:        ["#8cb9ff", "#69a3ff", "#428bff", "#1872ff", "#0058e2"], // first entry is considered default if supplied
		green:       ["#c6e48b", "#7bc96f", "#49af5d", "#2e8840", "#196127"],
		red:         ["#ff9e82", "#ff7b55", "#ff4d1a", "#e73400", "#bd2a00"],
		orange:      ["#ffa244", "#fd7f00", "#dd6f00", "#bf6000", "#9b4e00"],
		pink:        ["#ff96cb", "#ff70b8", "#ff3a9d", "#ee0077", "#c30062"],
		orangeToRed: ["#ffdf04", "#ffbe04", "#ff9a03", "#ff6d02", "#ff2c01"],
		transparent: ["transparent"]
	},
	showCurrentDayBorder: true, // (optional) defaults to true
	defaultEntryIntensity: 4,   // (optional) defaults to 4
	intensityScaleStart: 1,    // (optional) defaults to lowest value passed to entries.intensity
	intensityScaleEnd: 10,     // (optional) defaults to highest value passed to entries.intensity
	entries: [],                // (required) populated in the DataviewJS loop below
};

// 填充entries数组
for (let date in dailyCounts) {
    calendarData.entries.push({
        date: date, // 日期（yyyy-mm-dd格式）
        intensity: dailyCounts[date], // 对应的文档数量
        content: `${dailyCounts[date]}`, // 显示在方块上的文档数量
        //content: await dv.span(`[](${page.file.name})`), //for hover preview
        color: "green"
    });
}

// 渲染Heatmap Calendar
renderHeatmapCalendar(this.container, calendarData);

```

```contributionGraph
title: "🎉 文件跟踪 🎉"
graphType: default
dateRangeValue: 1
dateRangeType: LATEST_YEAR
startOfWeek: 1
showCellRuleIndicators: false
titleStyle:
  textAlign: left
  fontSize: 15px
  fontWeight: weight
  backgroundColor: 'transparent'
dataSource:
  type: PAGE
  value: ""
  dateField: {}
fillTheScreen: true
enableMainContainerShadow: false
cellStyleRules: # personized your graph style
  - color: '#f1d0b4'
    min: 1
    max: 2
  - color: '#e6a875'
    min: 2
    max: 3
  - color: '#d97d31'
    min: 3
    max: 4
  - color: '#b75d13'
    min: 4
    max: 999
cellStyleRules: # personized your graph style
  - text: '✅'
    min: 1
    max: 2
  - text: '🌳'
    min: 2
    max: 3
  - text: '🚩'
    min: 3
    max: 4
  - text: '🚀'
    min: 4
    max: 999

```


```contributionGraph
title: Contributions
graphType: default
dateRangeValue: 180
dateRangeType: LATEST_DAYS
startOfWeek: 1
showCellRuleIndicators: true
titleStyle:
  textAlign: left
  fontSize: 15px
  fontWeight: normal
dataSource:
  type: ALL_TASK
  value: ""
  dateField: {}
fillTheScreen: false
enableMainContainerShadow: false
cellStyleRules: []

```


列出所有的有效todo 
根据当前情况分出优先级
处理or不处理

## 2. Heatmap Tracker (by Mokkiebear)

## 优点：

- **用户友好**：提供了简单明了的代码示例，易于上手，适合快速实现数据可视化。
- **动态交互**：支持年份之间的快速切换，增强了用户体验。
- **可视化分隔**：可以选择是否在热图中分隔不同月份，使得数据更易于阅读。
- **当前日期高亮**：可以突出显示当前日期，方便用户快速定位。

## 缺点：

- **功能相对简单**：虽然功能多样，但相比于其他插件，可能在自定义方面稍显不足。
- **依赖 Dataview**：同样需要依赖 Dataview 插件来获取数据。

## 3. Contribution Graph (by Vran-dev)

## 优点：

- **多用途**：不仅可以用于习惯跟踪，还能用于笔记创建和任务完成情况的统计，非常灵活。
- **交互性强**：生成的热图具有互动性，可以直观地查看活动历史和习惯变化。
- **简洁明了的用例**：提供了明确的用例，如习惯追踪和复习报告，使得用户能够快速理解如何使用。

## 缺点：

- **功能限制**：虽然功能多样，但在某些高级自定义方面可能不如其他插件灵活。
- **文档支持不足**：相较于其他插件，其文档可能不够详细，需要用户自行探索。

## 总结

选择哪个插件取决于您的具体需求：

- 如果您需要高度自定义和灵活的数据跟踪，**Heatmap Calendar** 可能是最佳选择。
- 如果您希望快速上手并实现基本的数据可视化，**Heatmap Tracker** 是一个不错的选择。
- 如果您想要一个多用途且互动性强的工具来追踪习惯和笔记，则可以考虑使用 **Contribution Graph**。

```contributionGraph
title: Contributions
graphType: month-track
dateRangeValue: 180
dateRangeType: LATEST_DAYS
startOfWeek: 1
showCellRuleIndicators: false
titleStyle:
  textAlign: left
  fontSize: 15px
  fontWeight: normal
dataSource:
  type: PAGE
  value: ""
  dateField: {}
fillTheScreen: false
enableMainContainerShadow: false
cellStyleRules: []

```
