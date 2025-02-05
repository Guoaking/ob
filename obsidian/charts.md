,
> https://github.com/phibr0/obsidian-charts
> docs: https://charts.phib.ro/Meta/Charts/Charts+Documentation
> dataview 集成 : https://charts.phib.ro/Meta/Charts/Dataview+Integration#:~:text=Dataview%20Integration%20Dataview







```chart
type: line
labels: [Monday,Tuesday,Wednesday,Thursday,Friday]
series:
 - title: Title 1
   data: [1,2,3,4,5]
 - title: Title 2
   data: [5,4,3,2,1]
 - title: Title 3
   data: [8,2,5,-1,4]
```



```chart
type: pie
labels: [Monday,Tuesday,Wednesday,Thursday,Friday]
series:
 - title: Title 1
   data: [1,2,3,4,5]
 - title: Title 2
   data: [5,4,3,2,1]
width: 40%
labelColors: true
```





```chart
type: radar
labels: [云原生架构,复杂系统设计,工程效能,团队领导,技术前瞻]
series:
  - title: 能力
	data: [95,90,88,85,92]
width: 60%
fill: true
tension: 0.1
spanGaps: true
beginAtZero: true
legend: false
legendPosition: bottom
stacked: true
xReverse: true
rMax: 100
rMin: 60
rTickDisplay: false
rDisplay: false
transparency: 0.2
```