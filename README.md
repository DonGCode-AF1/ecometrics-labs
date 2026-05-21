# 🎛️ 实证经济学与计量模拟交互式实验室 (Empirical Econometrics Sandbox)

[![GitHub license](https://img.shields.io/github/license/mashape/apistore.svg?style=flat-square)](LICENSE)
[![Econometrics](https://img.shields.io/badge/Econometrics-Microeconometrics-blue.svg?style=flat-square)](#)
[![Python](https://img.shields.io/badge/Python-3.8%2B-green.svg?style=flat-square)](#)
[![Web-based](https://img.shields.io/badge/Interface-HTML5%20Offline-orange.svg?style=flat-square)](#)

欢迎来到实证经济学与计量模拟的**交互式运行实验室**！本仓库旨在将抽象晦涩的经济学、统计学与因果推断定理，通过**轻量级 Jupyter 仿真**与**零依赖的高保真前端交互式沙盒**具象化。

无论是时间序列自相关对推断的侵害、小样本偏误的崩溃过程，还是双重差分与工具变量的精妙边界，您都可以在这里通过“拖拉滑条、观察分布、对比宇宙”来直观领悟。

---

## 🗺️ 项目物理架构与文件索引 (Project Directory Index)

```text
empirical-playground/
├── README.md                          # 本项目说明书与多实验室全局向导
├── requirements.txt                    # 仿真依赖库（numpy, pandas, scipy, matplotlib 等）
├── .gitignore                          # Git 忽略配置
├── ai-coding-skills.md                 # 🤖 AI 助手接手开发规范与人机协同指南
└── labs/                               # 🧪 交互式计量经济学实验室 (Labs)
    ├── Clustering MonteCarlo/          # 【精选展台】BDM (2004) 聚类自相关蒙特卡洛模拟实验室
    │   ├── bdm_simulation_dashboard.html # 🚀 离线自旋式 HTML5 极美交互式沙盒 (零依赖)
    │   ├── L3_Clustering_MonteCarlo.ipynb# Python 蒙特卡洛底座与 Stata 复现脚本
    │   ├── bdm_academic_review.md      # 学术文献评述与理论内核梳理
    │   ├── run_dashboard.bat           # Windows 一键启动脚本
    │   └── run_dashboard.sh            # macOS/Linux 一键启动脚本
    ├── L1_BDM_Clustering_Sandbox.ipynb # 面板自相关与 BDM 45% 过度拒绝率基础实验室
    └── lab_design_template.ipynb       # 实验室规范开发模板（供未来追加实验室使用）
```

---

## ⚡ 快速开始与一键运行 (Quick Start)

### 1. 📊 极速体验离线交互沙盒（免环境配置）
进入 `labs/Clustering MonteCarlo/` 目录：
*   **Windows**：直接双击运行 `run_dashboard.bat`。
*   **macOS / Linux**：双击或在终端运行 `bash run_dashboard.sh`。
*   这会立即在您的默认浏览器中打开高保真的“蒙特卡洛平行宇宙实验室”，您可以调整自相关系数 $\rho$、聚类组数 $G$，在几毫秒内运算数百个宇宙！

### 2. 📓 运行 Jupyter 底层仿真
若要调试或探索底层的 Python 代码实现，请在终端执行：
```bash
# 1. 一键配置环境依赖
pip install -r requirements.txt

# 2. 启动 Jupyter 控制台
jupyter notebook
```
在浏览器中点进 `labs/` 文件夹，选择您感兴趣的实验进行交互式运行。

---

## 🧪 实验室明细索引 (Lab Catalog)

| 实验室目录 | 涵盖知识点与核心机制 | 核心交互与可视化亮点 |
| :--- | :--- | :--- |
| **[Clustering MonteCarlo](labs/Clustering%20MonteCarlo/)** | **组内自相关与聚类稳健标准误 (CRVE)**：复现 Bertrand et al. (2004) 面板自相关导致 OLS 假阳性率飙升至 45% 的学术灾难。 | 🎚️ **自相关系数 $\rho$** (-0.9 ~ 0.9)<br>🎚️ **省份组数 $G$ 与观测数 $N$**<br>📈 **KDE核密度曲线、SVG置信区间动态渲染** |
| **[lab_design_template.ipynb](labs/lab_design_template.ipynb)** | **实验开发模板**：规范了未来新增学术概念（如内生性偏误、多期 DID、工具变量强度等）的实验设计架构。 | 供未来追加 Lab 的通用组件模板 |

---


## 🤝 开发者与 AI 助手协同开发规范 (For Successor AI Assistants)
后续接手本仓库的 AI 助手，**必须**严格遵循 [ai-coding-skills.md](ai-coding-skills.md) 指南：
1. 更新代码或添加实验后，**必须**在 `prompt-thoughts-log/` 中进行日志与思路留档。
2. 实验解读必须使用精炼、精准的学术语言，**严禁使用任何形式的 AI 常用套话与情绪词汇**。
