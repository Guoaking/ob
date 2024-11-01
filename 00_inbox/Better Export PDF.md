---

tags:
  - cb
创建时间: 2024-11-01 22:43:21
三观: Happy
title: "[[Better Export PDF]]"
---
## 说明
一个 Obsidian PDF 导出增强插件，与官方的 PDF 导出功能相比，增加了导出预览、导出书签大纲和给 PDF 添加页码等功能。
[中文说明](https://github.com/l1xnan/obsidian-better-export-pdf/blob/master/README.zh.md) ^d7375e

## 使用
1. 选择导出目标： -. 在当前 Markdown 视图的右上角，点击更多选项，选择 `Better Export PDF`； -. 打开命令面板，选择 `Better Export PDF: Export Current File to PDF`； -. 在文件树中，右键文件夹选择`Export folder to PDF`。 ^3e91eb
2. 在弹出对话框中，修改相关配置。
3. 点击`Export`，选择导出路径，如果不用修改配置，可以直接按 `Enter` 键，触发导出操作。

### 设置页眉/页脚

可以通过设置 `Header Template` and `Footer Template` 配置来设置页码, 例如:

```html
<div style="width: 100vw;font-size:10px;text-align:center;">
  <span class="pageNumber"></span> / <span class="totalPages"></span>
</div>
```

可以实现类似 `3 / 5` 页码效果。详见[`<webview>.printToPDF(options)`](https://www.electronjs.org/docs/latest/api/webview-tag#webviewprinttopdfoptions)。

可以是任何合法的 HTML 片段，例如添加`base64`格式的图片：

```html
<div style="width: 100vw;font-size:10px;text-align:center;">
  <img height="10px" width="10px" src="data:image/svg+xml;base64,xxx..." />
  <span class="title"></span>
</div>
```

可以在`frontMatter`中配置文档级别的页眉/页脚模板：

- `headerTemplate`
- `footerTemplate`


### 自定义导出样式

如果想进一步定制 PDF 导出样式，可以在`外观>CSS代码片段`中添加自定义的 CSS，例如自定义字体和字号：

```css
@media print {
  body {
    --font-interface-override: "霞鹜文楷" !important;
    --font-text-override: "霞鹜文楷" !important;
    --font-print-override: "霞鹜文楷" !important;
    --font-monospace-override: "霞鹜文楷等宽" !important;
    --font-text-size: 20px !important;
    font-family: "思源宋体" !important;
  }
}
```


### 选择未启用的 CSS 片段



首先，在插件配置中启用 `Select CSS snippets` 选项。这时候在导出 PDF 的弹窗中可以看到 `CSS snippets` 选项，然后你可以选择在 `外观 > CSS 片段` 中没有全局启用的 CSS。

### 导出背景

默认情况下，导出的 PDF 会删除主题所得带背景色，如果你需要这个背景色，可以`插件设置 > Print background` 配置中打开它。

### 添加 PDF 元数据


可以通过配置文档的 `frontMatter` 给 PDF 添加元数据，支持的字段项有：

- `title` `标题`
- `author` `作者`
- `keywords` `关键字`
- `created_at`
- `updated_at`
- `creator` `造物主`
- `producer` `制作人`

