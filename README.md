# NUPThesis

[![](https://img.shields.io/badge/Overleaf-NJUPT-blue.svg?style=flat-square)](https://www.overleaf.com/latex/templates/njupt-thesis-template/phdhtstygbyb)

南京邮电大学毕业论文LaTex模版

## 这是什么

NJUPThesis-Bachelor 是针对南京邮电大学本科理工艺教类本科生毕业设计、论文的 LaTeX 模版。本模版基于电子科技大学 [`ThesisUETSC`](https://github.com/wanygen/ThesisUESTC) 模版二次开发而成，同时，北京邮电大学 [`BUPTBachelorThesis`](https://github.com/sqyx008/BUPTBachelorThesis) 项目也对本模板的形成有较大的影响，在此向原作者们表示感谢！

## 系统环境

1. 使用 `OverLeaf` [在线编辑](https://www.overleaf.com/latex/templates/njupt-thesis-template/phdhtstygbyb)。
2. 在 `Windows` 系统中，直接安装 `TeX Live` （其中已包含需要的 `XeLaTeX` 和 `BibTeX` ）， 同时安装 `TeXworks`（安装过程中有勾选框，选中即可）。你也可以使用“TeX Live + 自己喜爱的编辑器 + 扩展”的方式，如使用`TeX Live` + `Visual Studio Code` + `LaTeX workshop`。
3. 在 `MacOS` 系统中，直接安装 `MacTeX`, 编辑器可用自带的 `TeXshop`, 也可使用 `Visual Studio Code` 进行编辑。

## 如何使用

### 编辑以下文件

- `main.tex`: 论文的主体、附录，目前填充的是示例，可以对照生成的 `main.pdf` 熟悉代码。
- `reference.bib`: 论文的参考文献库。

### 用素材填充以下文件夹

- `pic`: 将图片放入该文件夹，图片支持`eps`, `jpg`, `png` 等格式，但是若将图片格式事先转为 `pdf`, 即可获得更快的编译效果。

### 字数统计

1. `Overleaf`平台中可以直接在菜单中点击 `Word Count` 进行统计。
2. 在命令行中使用 `texcount your-tex-file-name.tex` 命令进行统计。
3. 对生成的 PDF 文件进行统计。

### 编译

为了正确生成带有参考文献的文档，请进行四次编译：

`XeLaTeX` -> `BibTeX` -> `XeLaTeX` -> `XeLaTeX`

## 如何贡献

由于本人水平所限，该项目肯定会有些许问题，欢迎大家提出issue，关于**模板的问题请使用Issue功能提出，其它途径无法得到答复保证**，当然，更欢迎自行解决后提pull request。

欢迎广而告之，欢迎在word调格式被折磨时投奔初期有一点学习（模仿）成本的LaTeX模板。

我不能保证一切都能过教务部门的关（虽然使用了Word的其它人也不能保证），不过我会在2019年使用这个模板提交论文，并在发现问题后及时更新。

如果你愿意，不妨在致谢部分留下**本论文采用基于 LaTeX 的南京邮电大学本科论文模版编写。**，如果你愿意附上本GitHub repo的链接，那是再好不过了。

## 软件许可证

本项目采用 [`Creative Commons — 署名4.0 国际— CC BY 4.0`](https://creativecommons.org/licenses/by/4.0/deed.zh) 协议。
