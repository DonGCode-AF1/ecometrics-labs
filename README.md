# 🎛️ 实证经济学交互式模拟实验室 (Empirical Econometrics Sandbox)

欢迎来到实证经济学与计量模拟的**交互式运行实验室**！本仓库旨在将抽象的经济学、统计学定理，通过**轻量级、交互式 Python 仿真**具象化。

---

## 🗺️ 项目物理架构与文件索引 (Project Directory Index)

```text
empirical-playground/
├── README.md                          # 本项目说明书与使用向导
├── requirements.txt                    # 仿真依赖库（numpy, pandas, scipy, matplotlib, ipywidgets等）
├── .gitignore                          # Git 忽略配置
├── ai-coding-skills.md                 # 🤖 AI 助手接手指南与规范（一键配置、去AI腔、文档更新流）
├── prompt-thoughts-log/                # 🧠 过程留档与操作追溯区
│   ├── prompt_thoughts_archive.md      # 历史 Prompt 指令与设计思路归档
│   └── operation_history.log           # 项目迭代与操作的 Commit 风格追踪日志
└── labs/                               # 🧪 交互式 Jupyter 仿真实验室
    ├── L1_BDM_Clustering_Sandbox.ipynb # [已上线] 面板自相关与 BDM 45% 过度拒绝率交互实验室
    └── lab_design_template.ipynb       # 实验室规范开发模板（供未来追加实验室使用）
```

---

## ⚡ 快速开始与一键运行 (Quick Start)

为确保“人机协同、一键克隆与秒级配置”，请按照以下步骤运行实验室：

### 1. 环境安装
打开终端，运行以下命令一键配置全部依赖：
```bash
pip install -r requirements.txt
```

### 2. 启动实验室
在终端启动 Jupyter Notebook：
```bash
jupyter notebook
```
在浏览器打开并进入 `labs/` 目录，即可点开具体的实验文件进行交互式调参！

---

## 🧪 实验室明细索引 (Lab Catalog)

| 实验室文件名 | 涵盖知识点与核心机制 | 核心交互点与参数滑块 |
| :--- | :--- | :--- |
| **[L1_BDM_Clustering_Sandbox.ipynb](labs/L1_BDM_Clustering_Sandbox.ipynb)** | **自相关与聚类稳健标准误**：复现 Bertrand et al. (2004) 面板序列自相关导致 OLS 实际假阳性率暴增至 35%-45% 的学术灾难。 | 🎚️ **自相关系数 $\rho$** (0.0 ~ 0.9)<br>🎚️ **模拟次数** (50 ~ 300)<br>🎚️ **省份组数 $G$** (10 ~ 100) |
| **[lab_design_template.ipynb](labs/lab_design_template.ipynb)** | **实验开发模板**：规范了未来新增学术概念（如内生性偏误、多期 DID 等）的实验设计架构。 | - |

---

## 🤝 开发者与 AI 助手协同开发规范 (For Successor AI Assistants)
后续接手本仓库的 AI 助手，**必须**严格遵循 [ai-coding-skills.md](ai-coding-skills.md) 指南：
1. 更新代码或添加实验后，**必须**在 `operation_history.log` 和 `prompt_thoughts_archive.md` 中进行归档。
2. 实验解读必须使用精炼、精准的学术语言，**严禁使用任何形式的 AI 常用套话与情绪词汇**。
