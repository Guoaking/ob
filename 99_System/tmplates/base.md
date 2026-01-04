<%*
function q(v) {
	if (v === null || v === undefined) return "";
	return JSON.stringify(String(v));
}

function yamlList(key, items) {
	if (!items || items.length === 0) return `${key}: []`;
	return `${key}:\n` + items.map((x) => `  - ${q(x)}`).join("\n");
}

let title = tp.file.title;
if (!title || title.trim() === "" || title.startsWith("未命名")) {
	title = await tp.system.prompt("输入文件名");
	if (!title) return;
}
title = title.trim();
await tp.file.rename(title);

const type = await tp.system.suggester(
	[
		"note（普通笔记）",
		"concept（概念）",
		"method（方法）",
		"project（项目）",
		"area（领域/责任域）",
		"output（输出物）",
	],
	["note", "concept", "method", "project", "area", "output"],
);

// tags：基础 + 按 type 自动追加
const tags = [];
if (type === "project") tags.push("project");
if (type === "concept") tags.push("concept");

const created = tp.date.now("YYYY-MM-DD HH:mm:ss");
let status = "draft";
if (["project", "area"].includes(type)) status = "active";
if (type === "concept") status = "evergreen";

// 可选情绪：为了兼容你之前模板里的“三观”字段
const mood = await tp.system.suggester(
	["happy", "sad", "confused"],
	["happy", "sad", "confused"],
);

// type-specific fields
let goal = "";
let due = "";
let priority = "";
let nextActions = [];
let summary = "";
let confidence = "";
let audience = "";
let format = "";

if (["project", "area"].includes(type)) {
	goal = (await tp.system.prompt("目标（一句话，可空）"))?.trim() ?? "";
	priority =
		(await tp.system.suggester(["low", "medium", "high"], ["low", "medium", "high"])) ??
		"medium";
	due = (await tp.system.prompt("截止日期 due（YYYY-MM-DD，可空）"))?.trim() ?? "";
	const na = (await tp.system.prompt("下一步（用 ; 分隔，可空）"))?.trim() ?? "";
	if (na) nextActions = na.split(";").map((x) => x.trim()).filter(Boolean);
}

if (["concept", "method", "note"].includes(type)) {
	summary = (await tp.system.prompt("摘要/一句话定义（可空）"))?.trim() ?? "";
}

if (["concept", "method"].includes(type)) {
	confidence =
		(await tp.system.suggester(["low", "medium", "high"], ["low", "medium", "high"])) ??
		"medium";
}

if (type === "output") {
	audience = (await tp.system.prompt("受众（可空）"))?.trim() ?? "";
	format = (await tp.system.prompt("形式（文章/PPT/简历/论文…可空）"))?.trim() ?? "";
}

// YAML
const y = [];
y.push("---");
y.push(`type: ${type}`);
y.push(`status: ${status}`);
y.push(`created: ${q(created)}`);
y.push("tags:");
y.push(...tags.map((t) => `  - ${t}`));
y.push("aliases: []");
y.push("source:");
y.push("related: []");

// 兼容旧字段（历史笔记/旧查询用；如不需要可删除）
y.push(`创建时间: ${q(created)}`);
y.push(`三观: ${q(mood)}`);

if (summary) y.push(`summary: ${q(summary)}`);
if (confidence) y.push(`confidence: ${confidence}`);

if (goal) y.push(`goal: ${q(goal)}`);
if (priority) y.push(`priority: ${priority}`);
if (due) y.push(`due: ${q(due)}`);
if (nextActions.length > 0) y.push(yamlList("next_actions", nextActions));

if (audience) y.push(`audience: ${q(audience)}`);
if (format) y.push(`format: ${q(format)}`);

y.push("---");

// Body sections by type
let body = "";
if (type === "project") {
	body = [
		"# 目标",
		goal ? `- ${goal}` : "- ",
		"",
		"# 下一步",
		"- [ ] ",
		"",
		"# 里程碑",
		"- [ ] ",
		"",
		"# 记录",
		"",
		"# 关联",
		"",
	].join("\n");
} else if (type === "area") {
	body = [
		"# 目标/标准",
		goal ? `- ${goal}` : "- ",
		"",
		"# 维护清单",
		"- [ ] ",
		"",
		"# 例行回顾",
		"- ",
		"",
		"# 关联",
		"",
	].join("\n");
} else if (type === "output") {
	body = [
		"# 产出说明",
		audience ? `- 受众：${audience}` : "- 受众：",
		format ? `- 形式：${format}` : "- 形式：",
		"",
		"# 大纲",
		"- ",
		"",
		"# 正文",
		"",
		"# TODO",
		"- [ ] ",
		"",
		"# 关联",
		"",
	].join("\n");
} else if (type === "concept") {
	body = [
		"# 定义",
		summary ? `- ${summary}` : "- ",
		"",
		"# 要点",
		"- ",
		"",
		"# 反例/边界",
		"- ",
		"",
		"# 引用/来源",
		"- ",
		"",
		"# 关联",
		"",
	].join("\n");
} else if (type === "method") {
	body = [
		"# 方法一句话",
		summary ? `- ${summary}` : "- ",
		"",
		"# 适用场景",
		"- ",
		"",
		"# 步骤",
		"1. ",
		"",
		"# 注意事项",
		"- ",
		"",
		"# 例子",
		"- ",
		"",
		"# 关联",
		"",
	].join("\n");
} else {
	body = [
		"# 摘要",
		summary ? `- ${summary}` : "- ",
		"",
		"# 正文",
		"",
		"# 任务",
		"- [ ] ",
		"",
		"# 关联",
		"",
		"```dataviewjs",
		"dv.taskList(dv.current().file.tasks)",
		"```",
	].join("\n");
}

tR += y.join("\n") + "\n\n" + body + "\n";
-%>
