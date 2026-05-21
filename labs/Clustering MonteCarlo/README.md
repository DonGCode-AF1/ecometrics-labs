# 🧪 聚类标准误蒙特卡洛平行宇宙实验室
---
> **Clustering & Monte Carlo Simulation Sandbox**
> *实证经济学分析实验室 (Lab 3)*

本实验室提供了一个深度互动、零依赖的学术级沙盒，旨在复现 **Bertrand, Duflo, and Mullainathan (2004, QJE)** 的震撼结论：在时间序列自相关环境下，若忽略组内相关性，传统的 OLS 标准误会低估真实标准误差，导致假阳性率（拒绝率）暴增至 **35% - 45%**（谎报军情）。

---

## 📂 实验室资源结构

```text
Clustering MonteCarlo/
├── 📊 bdm_simulation_dashboard.html  # 核心：互动式单文件模拟仪表盘 (零依赖、开箱即用)
├── 📓 L3_Clustering_MonteCarlo.ipynb  # 拓展：Python 及 Stata 蒙特卡洛模拟复现脚本
├── 📝 bdm_academic_review.md          # 理论：计量经济学关于聚类推断的学术文献评述
├── 📄 requirements.txt                # 依赖：Python 运行环境所需依赖项列表
├── ⚡ run_dashboard.bat               # Windows：一键启动仪表盘脚本
└── ⚡ run_dashboard.sh                # macOS/Linux：一键启动仪表盘脚本
```

---

## 🚀 极速上手指南

### 1. 📊 互动式模拟仪表盘（零门槛，开箱即用）
该仪表盘采用 **纯前端 HTML5 / Vanilla JS 架构**，无任何外部库（零依赖，无需 Node.js 或 Python），只需使用任意现代浏览器打开即可。

*   **一键运行**：
    *   **Windows**：直接双击双击目录下的 `run_dashboard.bat`。
    *   **macOS / Linux**：双击运行 `run_dashboard.sh`（或在终端运行 `bash run_dashboard.sh`）。
    *   **手动启动**：直接双击 `bdm_simulation_dashboard.html` 文件，选择任意浏览器（Chrome / Edge / Safari / Firefox）打开。

### 2. 📓 动手实验室 Python Jupyter Notebook
如果您想深入底层探究蒙特卡洛模拟的 Python 代码实现，或者测试 AR(1) 自相关系数 $\rho$ 退化速度分析：

1.  **一键配置环境**（在命令行中运行）：
    ```bash
    pip install -r requirements.txt
    ```
2.  **启动 Jupyter 笔记本**：
    ```bash
    jupyter notebook L3_Clustering_MonteCarlo.ipynb
    ```

---

## 🔬 蒙特卡洛核心实验逻辑

*   **真实效应定死为 0 ($\beta = 0$)**：
    为了证明统计推断是否在“说谎”，我们生成观测数据 $Y_{it} = u_i + 0 \times D_{it} + \epsilon_{it}$。由于政策实际上完全是一剂“无效的生理盐水”，诚实的标准误差算法应当保持 **5%** 左右的名义假阳性率。
*   **残差 AR(1) 粘性传递 ($\epsilon_{it} = \rho \epsilon_{i,t-1} + \nu_{it}$)**：
    拖动左侧面板的自相关系数滑动条，即可在毫秒级时间内制造时序粘性的强弱，实时观察 IID 标准误和 HC1 稳健标准误在面对胖尾分布（Fat Tails）时如何彻底崩塌，以及省份级聚类标准误（One-way Cluster）如何力挽狂澜，将假阳性率完美拉回 5% 名义线。

---

## 🎓 计量黄金法则
> **“无论做面板回归还是 DID，永远在处理变量/政策实施的分组层级（如省份级 `province`）上聚类（`vce(cluster province)` / `cluster = ~province`）！”**
