# 🎛️ 实证经济学与计量模拟交互式实验室 (Empirical Econometrics Sandbox)

[![GitHub license](https://img.shields.io/github/license/mashape/apistore.svg?style=flat-square)](LICENSE)
[![Econometrics](https://img.shields.io/badge/Econometrics-Microeconometrics-blue.svg?style=flat-square)](#)
[![Python](https://img.shields.io/badge/Python-3.8%2B-green.svg?style=flat-square)](#)
[![Web-based](https://img.shields.io/badge/Interface-HTML5%20Offline-orange.svg?style=flat-square)](#)

欢迎来到实证经济学与计量模拟的**交互式运行实验室**！本仓库旨在将抽象晦涩的经济学、统计学与因果推断定理，通过**轻量级 Jupyter 仿真**与**零依赖的高保真前端交互式沙盒**具象化。

无论是时间序列自相关对推断的侵害、小样本偏误的崩溃过程，还是双重差分与工具变量的精妙边界，您都可以在这里通过“拖拉滑条、观察分布、对比宇宙”来直观领悟。

> [!TIP]
> 🚀 **【网页端直开通道（免配置，免 404）】**：我们已经搭建了极富艺术感的暗金拟物中央大厅！点击下方链接，即可直接在浏览器中实时运行所有交互实验室：
> 👉 **[【点击进入】计量经济学与统计仿真中央实验室 ➔](https://raw.githack.com/DonGCode-AF1/ecometrics-labs/master/index.html)**

---

## 🗺️ 项目物理架构与文件索引 (Project Directory Index)

```text
empirical-playground/
├── README.md                          # 本项目说明书与多实验室全局向导
├── requirements.txt                    # 仿真依赖库（numpy, pandas, scipy, matplotlib 等）
├── .gitignore                          # Git 忽略配置
├── ai-coding-skills.md                 # 🤖 AI 助手接手开发规范与人机协同指南
└── labs/                               # 🧪 交互式计量经济学实验室 (Labs)
    ├── clustering-montecarlo/          # 【精选展台】BDM (2004) 聚类自相关蒙特卡洛模拟实验室
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
进入 `labs/clustering-montecarlo/` 目录：
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
| **[clustering-montecarlo](labs/clustering-montecarlo/)**<br>🌐 [网页版直开](https://raw.githack.com/DonGCode-AF1/ecometrics-labs/master/labs/clustering-montecarlo/bdm_simulation_dashboard.html) | **组内自相关与聚类稳健标准误 (CRVE)**：复现 Bertrand et al. (2004) 面板自相关导致 OLS 假阳性率飙升至 45% 的学术灾难。 | 🎚️ **自相关系数 $\rho$** (-0.9 ~ 0.9)<br>🎚️ **省份组数 $G$ 与观测数 $N$**<br>📈 **KDE核密度曲线、SVG置信区间动态渲染** |
| **[Clustering_MonteCarlo_Analysis](labs/Clustering_MonteCarlo_Analysis/)** | **BDM 蒙特卡洛学术级复现与深度剖析**：系统性诊断老师代码中的自由度与大样本偏差修正因子，结合课件深度解析实验原理、双向去均值（Within）算法以及学术级 Bar Chart 可视化。 | 📈 **自相关侵害退化趋势图**<br>📓 **大样本纠偏系数 (G/(G-1) * (M-1)/(M-k)) 手动实现** |
| **[clt-demo](labs/clt-demo/)**<br>🌐 [网页版直开](https://raw.githack.com/DonGCode-AF1/ecometrics-labs/master/labs/clt-demo/clt_dashboard.html) | **中心极限定理 (CLT)**：展示任意母体分布的均值在样本容量 $N \to \infty$ 时服从正态分布。 | 📈 **母体分布自由设定**<br>🎚️ **样本容量 $N$** |
| **[coin-toss-demo](labs/coin-toss-demo/)**<br>🌐 [网页版直开](https://raw.githack.com/DonGCode-AF1/ecometrics-labs/master/labs/coin-toss-demo/coin_toss_dashboard.html) | **大数定律 (LLN)**：通过数万次掷硬币实验的频率收敛动态，展示概率的收敛视觉。 | 📈 **动态收敛曲线**<br>🎚️ **抛掷次数** |
| **[ols-properties-demo](labs/ols-properties-demo/)**<br>🌐 [网页版直开](https://raw.githack.com/DonGCode-AF1/ecometrics-labs/master/labs/ols-properties-demo/ols_validator_dashboard.html) | **OLS 估计量性质体检**：动态模拟与检验 Gauss-Markov 定理中的无偏性与 BLUE 性质。 | 📈 **抽样分布直方图**<br>🎚️ **样本量与扰动方差** |
| **[monte-carlo-demo](labs/monte-carlo-demo/)**<br>🌐 [网页版直开](https://raw.githack.com/DonGCode-AF1/ecometrics-labs/master/labs/monte-carlo-demo/mc_dashboard.html) | **遗漏变量偏差 (OVB)**：展示未控制共变混淆因子时，估计系数产生的系统性偏倚。 | 📈 **偏差动态轨迹**<br>🎚️ **变量间相关系数** |
| **[iv-simulation-demo](labs/iv-simulation-demo/)**<br>🌐 [网页版直开](https://raw.githack.com/DonGCode-AF1/ecometrics-labs/master/labs/iv-simulation-demo/iv_dashboard.html) | **工具变量与 2SLS**：动态调节工具变量强度，揭示弱工具变量偏误及排他性约束破缺。 | 📈 **弱工具估算漂移图**<br>🎚️ **工具强度与相关性系数** |
| **[neyman-orthogonality-dml](labs/neyman-orthogonality-dml/)**<br>🌐 [网页版直开](https://raw.githack.com/DonGCode-AF1/ecometrics-labs/master/labs/neyman-orthogonality-dml/neyman_dml_dashboard.html) | **Neyman 正交性与 Double Machine Learning**：用“培训影响工资”的最小案例解释双重残差化如何削弱第一阶段预测误差对因果参数的污染。 | 🎚️ **第一阶段预测误差滑块**<br>🔁 **重新模拟按钮**<br>📈 **普通回归 vs 正交残差回归双图对照** |
| **[dml-cross-fitting](labs/dml-cross-fitting/)**<br>🌐 [网页版直开](https://raw.githack.com/DonGCode-AF1/ecometrics-labs/master/labs/dml-cross-fitting/dml_cross_fitting_dashboard.html) | **DML 交叉拟合**：用 12 个观测、3 折训练/留出样板解释折外预测、折外残差与第二阶段 θ̂ 的关系。 | 🧩 **三折轮换示意图**<br>📊 **样本表与残差表**<br>📈 **折外残差回归图** |
| **[causal-forest](labs/causal-forest/)**<br>🌐 [网页版直开](https://raw.githack.com/DonGCode-AF1/ecometrics-labs/master/labs/causal-forest/causal_forest_dashboard.html) | **因果森林与异质性处理效应**：用职业培训模拟数据解释 CATE、局部叶内比较、森林汇总和“谁更受益”的政策含义。 | 🌳 **因果树示意图**<br>📊 **模拟数据表**<br>📈 **CATE 分组图与代码案例** |

| **[lab_design_template.ipynb](labs/lab_design_template.ipynb)** | **实验开发模板**：规范了未来新增学术概念（如内生性偏误、多期 DID、工具变量强度等）的实验设计架构。 | 供未来追加 Lab 的通用组件模板 |

---


## 🤝 开发者与 AI 助手协同开发规范 (For Successor AI Assistants)
后续接手本仓库的 AI 助手，**必须**严格遵循 [ai-coding-skills.md](ai-coding-skills.md) 指南：
1. 更新代码或添加实验后，**必须**在 `prompt-thoughts-log/` 中进行日志与思路留档。
2. 实验解读必须使用精炼、精准的学术语言，**严禁使用任何形式的 AI 常用套话与情绪词汇**。
