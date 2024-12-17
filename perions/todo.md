



```dataviewjs
// 初始化一个数组来存储所有未完成的待办事项
let allTasks = [];

// 遍历所有文件，筛选出未完成的任务
for (let page of dv.pages()) {
    // 获取当前页面的任务
    let tasks = page.file.tasks;

    // 筛选未完成的任务并添加到 allTasks 数组中
    for (let task of tasks) {
        if (!task.completed) {
            allTasks.push({
                text: task.text,
                file: page.file.name, // 记录任务所在文件名
                path: page.file.path,  // 记录文件路径
                task: task             // 记录原始任务对象
            });
        }
    }
}

// 输出所有未完成的任务
if (allTasks.length > 0) {
    // 创建表格展示未完成的任务
    dv.table(["任务", "文件", "操作"], allTasks.map(task => [
        task.text,
        task.path,
        `` // 添加可勾选的复选框
    ]));

    // 添加事件监听器以处理复选框勾选事件
    allTasks.forEach((task, index) => {
        const checkbox = document.createElement('input');
        checkbox.type = 'checkbox';
        checkbox.id = `task-${index}`;
        const label = document.createElement('label');
        label.textContent = '完成'; // 这里可以修改为你想要的任务描述文本
       label.for = checkbox.id;
        // 确保在表格渲染后再添加复选框
        setTimeout(() => {
            const cell = dv.container.querySelector(`tr:nth-child(${index + 1}) td:last-child`);
            if (cell) { // 确保cell存在
                cell.appendChild(checkbox);
                cell.appendChild(label);
            }
        }, 0); // 使用setTimeout确保DOM已经更新
    
        // 添加事件监听器
        checkbox.addEventListener('change', async () => {
            if (checkbox.checked) {
                // 更新任务为已完成状态
                console.log(`任务 "${task.text}" 在 "${task.file}" 中已完成`);

                // 更新原文件中的任务状态
                const filePath = task.path;
                const fileContent = await app.vault.read(app.vault.getAbstractFileByPath(filePath));
                
                // 使用正则表达式更新任务状态为已完成
                const updatedContent = fileContent.replace(
                    new RegExp(`- \\[ ] ${task.text}`), 
                    `- [x] ${task.text}`
                );

                // 写回更新后的内容到文件
                await app.vault.modify(app.vault.getAbstractFileByPath(filePath), updatedContent);
                
                // 重新加载页面以反映更改（可选）
                //location.reload();
            }
        });


    });
} else {
    dv.paragraph("没有找到未完成的待办事项。");
}
```




- [x] 洗牙
- [ ] 对目标概念的归纳整理
- [ ] 学习入门级哲学
- [ ] ob整个日历
- [ ] 没有安全感? 钱能给你不少安全感
- [ ] 考驾照
- [ ] 英语考试
- [ ] 读书
- [ ] 附近附近附近附近
- [ ] 软考?
- [x] 收拾家里
	- [x] 先收拾和 w 相关的, 单独
- [x] 体检一次
- [ ] 锻炼:
- [ ] 体验:
- [ ] 人品研究
- [ ] 家里水路
- [ ] 报销药
- [ ] 微信: 
- [ ] 知乎: 人在什么情况下成长最快
- [ ] 荨麻疹, 哮喘, 免疫系统, 维生素
- [ ] 记账? 
- [ ] 学习理财
- [ ] 关注情绪
- [ ] 保险: 医疗险, 重疾险
- [ ] 今年最少尝试3次变现, 失败则总结经验复盘不足
	- [ ] 知乎爬虫
	- [ ] 租房通勤查询
		1. api 商用限制
		2. 市场? 
	- [ ] 驾照经验整理拿出去 解决别人的需求
- [ ] 做的多点
- [ ] 看病报销
- [ ] 
