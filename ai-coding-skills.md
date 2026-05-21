# 🤖 实验室 AI 协同开发与维护技能手册 (AI Coding Skills & Onboarding Guide)

本手册专为接手本仓库的后续 AI 助手设计。请在执行任何新增实验室、更新代码或优化结构的任务前，**务必全文阅读并严格执行本规范**。

---

## 🎯 核心使命与定位
本仓库（`empirical-playground`）的唯一目标是：**通过计算机模拟与交互式可视化，将抽象的计量经济学理论具象化，帮助使用者建立直观的经济学直觉。**
每个实验都应是一次完整的“数理逻辑展现 + 交互式参数调优 + 高启发性学术解读”。

---

## 1. 🚀 新助手一键接手与环境配置规范 (AI Quick Onboarding)

当你作为新的 AI 助手接手任务时，请遵循以下流程快速初始化你的环境与上下文：

### 第一步：依赖与环境检测
1. **检测 Python 环境**：运行 `python --version` 确保 Python 环境正常。
2. **一键安装依赖**：检测并引导用户或静默运行 `pip install -r requirements.txt`，确保 `numpy`、`pandas`、`scipy`、`matplotlib`、`seaborn` 以及 `ipywidgets` 全部正确安装。
3. **启用 Jupyter 交互插件**：对于 Jupyter Notebook 中的 `ipywidgets`，在现代 Jupyter 环境下（notebook >= 7.0）无需额外安装，但请确认插件处于可用状态。

### 第二步：操作日志与历史回溯
1. **读取操作日志**：首要动作是阅读 `prompt-thoughts-log/operation_history.log`，了解当前项目处于什么版本，前一个助手完成了哪些实验，遇到了哪些性能瓶颈或 Bug。
2. **检索 Prompt 档案**：阅读 `prompt-thoughts-log/prompt_thoughts_archive.md`，理解历史决策背后的核心思想、思考链路和实验设计初衷，确保开发方向不偏离。

---

## 2. 🎨 交互式实验室设计规范 (Interactive Lab Design Specification)

每个 Jupyter 实验室（`labs/*.ipynb`）必须严格遵循以下结构和原则进行构建：

### 一、 杜绝“AI 腔”解读 (Jargon-free Interpretation)
* **不要使用过度修饰的词汇**：如“不是……而是……”、“不仅如此”、“惊人地”、“震撼发现”等翻译腔或 AI 常用套话。
* **风格要求**：语言精炼、客观、精准。重点在于**启发性**，用数理和逻辑推断说话，避免无意义的赞叹。

### 二、 标准实验室结构 (Notebook Standard Layout)
每个实验室的 JSON/JSONL 结构必须清晰分块：
1. **理论背景与直觉**：
   - 简要写出数理公式（使用 LaTeX 渲染）。
   - 阐述其背后的经济学物理意义（如：序列相关为什么会导致 OLS 标准误低估？因为样本信息存在重叠）。
2. **交互式仿真引擎 (Simulation Engine with Widgets)**：
   - **参数滑块 (Sliders)**：使用 `ipywidgets` 绑定关键参数。例如，对于 AR(1) 误差项，允许拖动滑块调整自相关系数 $\rho \in [0, 1)$、样本容量 $N$、聚类数量 $G$ 等。
   - **动态渲染**：使用 `@widgets.interact` 或 `widgets.interactive` 装饰器，确保每次调整参数时，后台能在 0.5 秒内完成计算并利用 `matplotlib`/`seaborn` 输出更新后的实际假阳性率柱状图/折线图。
3. **数理本质透析 (The Core Insight)**：
   - 结合仿真结果，给出简明扼要的经济学透析，回答“发生了什么”以及“为什么会这样”。

---

## 3. ✍️ 协同日志与文档更新规范 (Traceability & Documentation Sync)

为了保证项目的可追溯性与持续协作，任何 AI 助手在**修改代码、新增实验或配置环境**后，**必须同步更新以下三个文件**：

### 1. 更新 `prompt-thoughts-log/operation_history.log`
* **格式**：追加一条符合 Git Commit 风格的操作记录。
* **内容**：包含操作时间、操作 AI 助手代号、操作类型（【初始化】/【新增实验】/【Bug修复】）以及核心修改点。
* **示例**：
  ```text
  [2026-05-21 12:00] BY Antigravity
  - TYPE: 【新增实验】
  - DETAILS: 在 labs/ 目录下创建 L1_BDM_Clustering_Sandbox.ipynb，集成 ipywidgets 交互式滑块，完美复现不聚类时 45% 的过度拒绝率。
  ```

### 2. 更新 `prompt-thoughts-log/prompt_thoughts_archive.md`
* **格式**：Markdown 归档文件。
* **内容**：详细记录本次修改中所采用的 **Core Prompts（用户核心指令）**、**AI 思考与设计链路 (Model Reasoning & Design Thoughts)** 以及后续开发建议。

### 3. 更新 `README.md`
* **格式**：如果新增了实验室或工具，必须在 `README.md` 的明细索引中追加对应的行，更新实验目录和核心体验点，保证全局索引永不过时。

---

## 🚀 启动验证检查清单 (Verification Checklist)

当有新任务接手时，执行以下自动及手动检查：
- [ ] 检查 `requirements.txt` 中所列库是否全部就位。
- [ ] 验证 `labs/` 下的 `.ipynb` 文件是否为合法的 JSON 格式。
- [ ] 确保 `operation_history.log` 已经成功追加了最新的步骤日志。
