# Excalidraw 完美生成核心提示

## 文件格式规范

### 必需的前置格式
```markdown
---

excalidraw-plugin: parsed
tags: [excalidraw]

---
==⚠  Switch to EXCALIDRAW VIEW in the MORE OPTIONS menu of this document. ⚠== You can decompress Drawing data with the command palette: 'Decompress current Excalidraw file'. For more info check in plugin settings under 'Saving'


# Excalidraw Data
```

### 文本元素区域格式
```markdown
## Text Elements
文本内容 ^唯一标识符
更多文本 ^另一个标识符
```

### 绘图数据区域格式
```markdown
%%
## Drawing
```compressed-json
[这里放置压缩的JSON数据]
```
%%
```

## 核心生成规则

### 1. 标识符规范
- 每个文本元素必须以 `^` 结尾，后跟唯一标识符
- 标识符格式：建议使用字母数字组合，如 `^abc123`, `^mainTitle`
- 标识符长度：建议6-8个字符，确保唯一性
- 避免使用特殊字符和空格

### 2. 文本内容规范
- 每行一个文本元素
- 文本内容可以是中文、英文或混合
- 支持多行文本，但每行都需要独立标识符
- 避免过长的文本，建议控制在50字符以内

### 3. 结构层次
```
## Text Elements
主标题 ^mainTitle
一级标题1 ^section1
一级标题2 ^section2
  二级内容1 ^subsection1_1
  二级内容2 ^subsection1_2
详细说明 ^detail1
```

## 完整模板示例

### 思维导图模板
```markdown
---

excalidraw-plugin: parsed
tags: [excalidraw]

---
==⚠  Switch to EXCALIDRAW VIEW in the MORE OPTIONS menu of this document. ⚠== You can decompress Drawing data with the command palette: 'Decompress current Excalidraw file'. For more info check in plugin settings under 'Saving'


# Excalidraw Data
## Text Elements
核心主题 ^coreTheme
分支概念1 ^branch1
分支概念2 ^branch2
分支概念3 ^branch3
详细说明1 ^detail1
详细说明2 ^detail2
具体例子1 ^example1
具体例子2 ^example2

%%
## Drawing
```compressed-json
[压缩的JSON绘图数据]
```
%%
```

### 对比分析模板
```markdown
---

excalidraw-plugin: parsed
tags: [excalidraw]

---
==⚠  Switch to EXCALIDRAW VIEW in the MORE OPTIONS menu of this document. ⚠== You can decompress Drawing data with the command palette: 'Decompress current Excalidraw file'. For more info check in plugin settings under 'Saving'


# Excalidraw Data
## Text Elements
主题：对比分析 ^mainTitle
方案A：优势 ^optionA_pros
方案A：劣势 ^optionA_cons
方案B：优势 ^optionB_pros
方案B：劣势 ^optionB_cons
关键对比点1 ^comparison1
关键对比点2 ^comparison2
结论建议 ^conclusion

%%
## Drawing
```compressed-json
[压缩的JSON绘图数据]
```
%%
```

## 生成要点

### 成功关键要素
1. **格式完整性**：必须包含所有必需的头部信息和区域标记
2. **标识符唯一性**：每个文本元素的标识符都必须唯一
3. **结构清晰**：文本元素应该按照逻辑层次组织
4. **内容简洁**：使用关键词和短语，避免冗长描述

### 常见错误避免
- ❌ 缺少 `excalidraw-plugin: parsed` 声明
- ❌ 标识符重复或包含特殊字符
- ❌ 文本元素格式错误（缺少 `^` 或标识符）
- ❌ 缺少 `## Drawing` 区域或格式错误
- ❌ 压缩JSON数据格式不正确

### 最佳实践
1. **规划先行**：先确定图表类型和内容结构
2. **标识符命名**：使用有意义的前缀，如 `main_`, `sub_`, `detail_`
3. **内容组织**：按照从主到次、从概括到具体的顺序
4. **视觉层次**：通过文本内容和位置暗示视觉层次关系

## 调试和验证

### 验证清单
- [ ] 文件开头有正确的YAML前置格式
- [ ] 包含 `excalidraw-plugin: parsed` 声明
- [ ] 有 `tags: [excalidraw]` 标签
- [ ] 包含切换到Excalidraw视图的提示
- [ ] 有 `# Excalidraw Data` 标题
- [ ] 文本元素格式正确：`文本 ^标识符`
- [ ] 所有标识符都是唯一的
- [ ] 有正确的绘图数据区域格式
- [ ] 压缩JSON数据格式正确

### 导入测试
1. 将文件保存为 `.md` 格式
2. 在支持Excalidraw的编辑器中打开
3. 切换到Excalidraw视图
4. 验证文本元素和绘图数据是否正确显示

## 高级技巧

### 复杂图表设计
- 使用分组相关的标识符（如 `group1_item1`, `group1_item2`）
- 通过文本内容暗示连接关系和层次结构
- 预留空间用于后续的手动调整和美化

### 自动化生成
- 使用脚本批量生成标准格式的文件
- 建立标识符命名规范和自动化分配
- 创建常用的模板库快速生成不同类型的图表

### 版本控制
- 使用Git管理Excalidraw文件的版本
- 在提交信息中描述图表的内容变更
- 定期备份重要的图表文件

## 故障排除

### 常见问题
1. **文件无法解析**：检查前置格式和区域标记
2. **文本元素丢失**：验证标识符格式和唯一性
3. **绘图数据错误**：确认JSON数据压缩格式正确
4. **显示异常**：检查编辑器的Excalidraw插件版本

### 解决方案
1. 严格按照格式规范生成文件
2. 使用验证清单逐项检查
3. 参考成功案例的格式
4. 在简单环境中测试基本格式

---

这个核心提示涵盖了生成完美Excalidraw文件的所有必要要素，确保生成的文件能够被Excalidraw插件正确解析和显示。