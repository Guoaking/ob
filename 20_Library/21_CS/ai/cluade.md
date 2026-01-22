---

tags:
  - cb
创建时间: 2025-08-03 21:20:57
三观: null
title: "[[cluade]]"
---






```dataviewjs
dv.taskList(dv.current().file.tasks.where(t => t.text.includes("")))
```





## 评测

[GLM-4.7 - Intelligence, Performance & Price Analysis](https://artificialanalysis.ai/models/glm-4-7)





[cluade proxy](https://github.com/fuergaosi233/claude-code-proxy)



## mcp

### Browser Use

[浏览器访问](https://github.com/exa-labs/exa-mcp-server)


[claude-code-best-practice/reports/claude-in-chrome-v-chrome-devtools-mcp.md at main · shanraisshan/claude-code-best-practice · GitHub](https://github.com/shanraisshan/claude-code-best-practice/blob/main/reports/claude-in-chrome-v-chrome-devtools-mcp.md)


### Chrome DevTools MCP

[GitHub - ChromeDevTools/chrome-devtools-mcp: Chrome DevTools for coding agents](https://github.com/ChromeDevTools/chrome-devtools-mcp)


```bash
claude mcp add chrome-devtools npx chrome-devtools-mcp@latest
```



### Playwright MCP (Recommended)

>  Playwright 的选择器（CSS/XPath）

[GitHub - microsoft/playwright-mcp: Playwright MCP server](https://github.com/microsoft/playwright-mcp)
[GitHub - remorses/playwriter: The better playwright MCP: works as a browser extension. No context bloat. More capable.](https://github.com/remorses/playwriter)


skills

1. skill 调用没
2. skill 生成
3. skill 更新



[GitHub - lackeyjb/playwright-skill: Claude Code Skill for browser automation with Playwright. Model-invoked - Claude autonomously writes and executes custom automation for testing and validation.](https://github.com/lackeyjb/playwright-skill)



```shell
npx playwright install
claude mcp add playwright -s user -- npx @playwright/mcp@latest
```



```

npx add-skill vercel-labs/agent-skills
npx skills-installer search 
 
 
```

### dev-browser

> 使用 UID 映射可访问性树


[zread.ai \| 504: Gateway time-out](https://zread.ai/SawyerHood/dev-browser/3-choosing-your-mode-standalone-vs-extension)


[GitHub - SawyerHood/dev-browser: A Claude Skill to give your agent the ability to use a web browser](https://github.com/SawyerHood/dev-browser)



###  agent-browser


[GitHub - vercel-labs/agent-browser: Browser automation CLI for AI agents](https://github.com/vercel-labs/agent-browser)

## agent 

[agent all in one](https://github.com/wshobson/agents)


## skills

[skills官方仓库](https://github.com/anthropics/skills)

> /plugin marketplace add anthropics/skills

[GitHub - obra/superpowers: Claude Code superpowers: core skills library](https://github.com/obra/superpowers)

[GitHub - obra/superpowers-marketplace: Curated Claude Code plugin marketplace](https://github.com/obra/superpowers-marketplace)

```
/plugin marketplace add obra/superpowers-marketplac
/plugin install superpowers@superpowers-marketplace
```



OpenSpec/SpecKit 像是严谨的 **“建筑设计师” 和 “监理”** ，核心设计哲学是 “规范 / 契约驱动开发”，先出详细图纸和规范，再监督施工，通过严格的文档来保证 AI 生成代码的确定性和质量，是一种强大而专业的方法论；而 Superpowers 更像一个 拥有全栈技能的 “智能施工队” ，拿到大致想法后，能自己规划、分工、施工并质检，更侧重于 “代理驱动” 的自动化工作流。前者重设计和契约，后者重执行和自动化，没有绝对优劣，只是适配不同开发场景！





#### webdev

React & Next.js 的性能优化最佳实践 Skill

[GitHub - vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills)
* react-best-practices
* web-design-guidelines

 Web Design 相关的 Skills


- UI UX Pro Max：[GitHub - nextlevelbuilder/ui-ux-pro-max-skill: An AI SKILL that provide design intelligence for buil](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill)
- UI Skills：[GitHub - ibelick/ui-skills: Opinionated constraints for building better interfaces with agents.](https://github.com/ibelick/ui-skills)


## N8N

[【教程】n8n全网资讯热点捕捉器 - Xuan酱 0114 - 飞书云文档](https://ycnezwebj31p.feishu.cn/docx/Lb3fd4Pwro6c7Wx72Nwc6svwn9c)



[GitHub - jarrodwatts/claude-hud: A Claude Code plugin that shows what's happening - context usage, active tools, running agents, and todo progress](https://github.com/jarrodwatts/claude-hud)



### 执行状态判断

𝐀𝐜𝐜𝐨𝐦𝐩𝐥𝐢𝐬𝐡𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 完成中
𝐀𝐜𝐭𝐢𝐨𝐧𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 行動中
𝐀𝐜𝐭𝐮𝐚𝐥𝐢𝐳𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 實現中
𝐁𝐚𝐤𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 烘焙中
𝐁𝐫𝐞𝐰𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 醞釀中
𝐂𝐚𝐥𝐜𝐮𝐥𝐚𝐭𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 計算中
𝐂𝐞𝐫𝐞𝐛𝐫𝐚𝐭𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 大腦運轉中
𝐂𝐡𝐮𝐫𝐧𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 翻攪中
𝐂𝐥𝐚𝐮𝐝𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) Claude 作業中
𝐂𝐨𝐚𝐥𝐞𝐬𝐜𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 整合中
𝐂𝐨𝐠𝐢𝐭𝐚𝐭𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 思索中
𝐂𝐨𝐦𝐩𝐮𝐭𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 運算中
𝐂𝐨𝐧𝐣𝐮𝐫𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 施法中
𝐂𝐨𝐧𝐬𝐢𝐝𝐞𝐫𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 考慮中
𝐂𝐨𝐨𝐤𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 烹飪中
𝐂𝐫𝐚𝐟𝐭𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 精心打造中
𝐂𝐫𝐞𝐚𝐭𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 創造中
𝐂𝐫𝐮𝐧𝐜𝐡𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 處理數據中
𝐃𝐞𝐥𝐢𝐛𝐞𝐫𝐚𝐭𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 深思熟慮中
𝐃𝐞𝐭𝐞𝐫𝐦𝐢𝐧𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 判定中
𝐃𝐨𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 執行中
𝐄𝐟𝐟𝐞𝐜𝐭𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 實施中
𝐅𝐢𝐧𝐚𝐠𝐥𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 喬事情中
𝐅𝐨𝐫𝐠𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 鍛造中
𝐅𝐨𝐫𝐦𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 形成中
𝐆𝐞𝐧𝐞𝐫𝐚𝐭𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 生成中
𝐇𝐚𝐭𝐜𝐡𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 孵化中
𝐇𝐞𝐫𝐝𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 集中處理中
𝐇𝐨𝐧𝐤𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 鳴笛中
𝐇𝐮𝐬𝐭𝐥𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 拼命中
𝐈𝐝𝐞𝐚𝐭𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 發想中
𝐈𝐧𝐟𝐞𝐫𝐫𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 推斷中
𝐌𝐚𝐧𝐢𝐟𝐞𝐬𝐭𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 顯化中
𝐌𝐚𝐫𝐢𝐧𝐚𝐭𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 醃製中
𝐌𝐨𝐬𝐞𝐲𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 閒晃中
𝐌𝐮𝐥𝐥𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 反覆思考中
𝐌𝐮𝐬𝐭𝐞𝐫𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 召集中
𝐌𝐮𝐬𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 沉思中
𝐍𝐨𝐨𝐝𝐥𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 隨性發想中
𝐏𝐞𝐫𝐜𝐨𝐥𝐚𝐭𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 靈感湧現中
𝐏𝐨𝐧𝐝𝐞𝐫𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 琢磨中
𝐏𝐫𝐨𝐜𝐞𝐬𝐬𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 處理中
𝐏𝐮𝐭𝐭𝐞𝐫𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 閒忙中
𝐑𝐞𝐭𝐢𝐜𝐮𝐥𝐚𝐭𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 網格化中
𝐑𝐮𝐦𝐢𝐧𝐚𝐭𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 反芻思考中
𝐒𝐜𝐡𝐥𝐞𝐩𝐩𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 費力搬運中
𝐒𝐡𝐮𝐜𝐤𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 剝殼中
𝐒𝐢𝐦𝐦𝐞𝐫𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 慢燉中
𝐒𝐦𝐨𝐨𝐬𝐡𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 壓扁中
𝐒𝐩𝐢𝐧𝐧𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 旋轉中
𝐒𝐭𝐞𝐰𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 燜燒中
𝐒𝐲𝐧𝐭𝐡𝐞𝐬𝐢𝐳𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 合成中
𝐓𝐡𝐢𝐧𝐤𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 思考中
𝐓𝐫𝐚𝐧𝐬𝐦𝐮𝐭𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 轉化中
𝐕𝐢𝐛𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 感受氛圍中
𝐖𝐨𝐫𝐤𝐢𝐧𝐠 ![👉](https://static.xx.fbcdn.net/images/emoji.php/v9/tf0/2/16/1f449.png) 工作中