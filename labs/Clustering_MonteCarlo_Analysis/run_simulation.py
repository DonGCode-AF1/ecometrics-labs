import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from scipy import stats

print("="*60)
print("🚀 计量模拟实验室：面板自相关与五大计量推断方法蒙特卡洛仿真现场运行")
print("="*60)

def run_mc_simulation_full(rho=0.8, n_units=500, n_periods=10, n_sims=150, seed=42):
    rng = np.random.default_rng(seed)
    
    p_iid_list = []
    p_hc_list = []
    p_cl1_list = []
    p_cl2_list = []
    p_wild_list = []
    
    n_groups = 50
    group_ids = np.repeat(np.arange(n_groups), n_units // n_groups)
    time_ids = np.tile(np.arange(n_periods), n_units)
    
    for sim in range(n_sims):
        unit_fe = rng.normal(0, 1, n_units)
        time_fe = rng.normal(0, 1, n_periods)
        
        eps = np.zeros((n_units, n_periods))
        eps[:, 0] = rng.normal(0, 1, n_units)
        for t in range(1, n_periods):
            eps[:, t] = rho * eps[:, t - 1] + rng.normal(0, 1, n_units)
            
        treated_groups = rng.choice(n_groups, size=n_groups // 5, replace=False)
        is_treated = np.isin(group_ids, treated_groups)
        
        D = np.zeros((n_units, n_periods))
        D[is_treated, 5:] = 1
        
        Y = unit_fe[:, None] + time_fe[None, :] + 0 * D + eps
        
        Y_dm = Y - Y.mean(axis=1, keepdims=True) - Y.mean(axis=0) + Y.mean()
        D_dm = D - D.mean(axis=1, keepdims=True) - D.mean(axis=0) + D.mean()
        
        y_flat = Y_dm.flatten()
        x_flat = D_dm.flatten()
        
        beta_hat = (x_flat * y_flat).sum() / (x_flat ** 2).sum()
        resid = y_flat - beta_hat * x_flat
        
        M = n_units * n_periods
        df_adj = M - n_units - n_periods
        
        se_iid = np.sqrt((resid ** 2).sum() / df_adj / (x_flat ** 2).sum())
        t_iid = abs(beta_hat / se_iid)
        p_iid = 2 * (1 - stats.t.cdf(t_iid, df=df_adj))
        
        se_hc = np.sqrt(((x_flat * resid) ** 2).sum() / (x_flat ** 2).sum() ** 2 * M / df_adj)
        t_hc = abs(beta_hat / se_hc)
        p_hc = 2 * (1 - stats.t.cdf(t_hc, df=df_adj))
        
        x_reshaped = x_flat.reshape(n_groups, -1)
        r_reshaped = resid.reshape(n_groups, -1)
        group_scores = (x_reshaped * r_reshaped).sum(axis=1)
        finite_correction1 = (n_groups / (n_groups - 1)) * ((M - 1) / df_adj)
        se_cl1 = np.sqrt((group_scores ** 2).sum() / (x_flat ** 2).sum() ** 2 * finite_correction1)
        t_cl1 = abs(beta_hat / se_cl1)
        p_cl1 = 2 * (1 - stats.t.cdf(t_cl1, df=n_groups - 1))
        
        time_scores = np.zeros(n_periods)
        for t in range(n_periods):
            time_scores[t] = (x_flat[time_ids == t] * resid[time_ids == t]).sum()
        finite_correction2 = (n_periods / (n_periods - 1)) * ((M - 1) / df_adj)
        se_cl_time = np.sqrt((time_scores ** 2).sum() / (x_flat ** 2).sum() ** 2 * finite_correction2)
        
        v_2way = (se_cl1 ** 2) + (se_cl_time ** 2) - (se_hc ** 2)
        se_cl2 = np.sqrt(max(v_2way, 1e-10))
        t_cl2 = abs(beta_hat / se_cl2)
        p_cl2 = 2 * (1 - stats.t.cdf(t_cl2, df=min(n_groups, n_periods) - 1))
        
        u_tilde = y_flat.reshape(n_groups, -1)
        x_boot = x_flat.reshape(n_groups, -1)
        
        B = 99
        weights = rng.choice([-1, 1], size=(B, n_groups))
        t_boot_list = []
        for b in range(B):
            w_b = weights[b][:, None]
            u_b = u_tilde * w_b
            y_b_flat = u_b.flatten()
            
            beta_b = (x_flat * y_b_flat).sum() / (x_flat ** 2).sum()
            resid_b = y_b_flat - beta_b * x_flat
            
            r_b_reshaped = resid_b.reshape(n_groups, -1)
            group_scores_b = (x_boot * r_b_reshaped).sum(axis=1)
            se_b = np.sqrt((group_scores_b ** 2).sum() / (x_flat ** 2).sum() ** 2 * finite_correction1)
            t_b = abs(beta_b / max(se_b, 1e-10))
            t_boot_list.append(t_b)
            
        p_wild = (np.array(t_boot_list) >= t_cl1).mean()
        
        p_iid_list.append(p_iid)
        p_hc_list.append(p_hc)
        p_cl1_list.append(p_cl1)
        p_cl2_list.append(p_cl2)
        p_wild_list.append(p_wild)
        
    rej_iid = (np.array(p_iid_list) < 0.05).mean() * 100
    rej_hc = (np.array(p_hc_list) < 0.05).mean() * 100
    rej_cl1 = (np.array(p_cl1_list) < 0.05).mean() * 100
    rej_cl2 = (np.array(p_cl2_list) < 0.05).mean() * 100
    rej_wild = (np.array(p_wild_list) < 0.05).mean() * 100
    
    return rej_iid, rej_hc, rej_cl1, rej_cl2, rej_wild

rhos = [0.0, 0.4, 0.8]
results = {}

for r in rhos:
    print(f"⌛ 正在模拟自相关强度 rho = {r} 下的 150 个平行宇宙 ...")
    results[r] = run_mc_simulation_full(rho=r, n_sims=150, seed=42)

df_res = pd.DataFrame(results, index=[
    'IID 经典标准误', 
    'HC1 稳健标准误', 
    '一维省份级聚类', 
    '双向聚类 (省份与时间)', 
    'Wild Cluster Bootstrap'
]).T

print("\n📊 === 蒙特卡洛平行宇宙实验数据表格 (标称显著性水平为 5%) ===")
print(df_res)
print("="*60)

# Generate Matplotlib chart
plt.rcParams['font.sans-serif'] = ['SimHei', 'Arial Unicode MS', 'DejaVu Sans']
plt.rcParams['axes.unicode_minus'] = False

fig, ax = plt.subplots(figsize=(11, 6.5), dpi=120)
colors = ['#E63946', '#F4A261', '#457B9D', '#2A9D8F', '#1D3557']
df_res.plot(kind='bar', ax=ax, color=colors, edgecolor='black', zorder=3, width=0.85)

ax.axhline(5, color='#E76F51', linestyle='--', linewidth=2, label='名义 5% 显著水平基准线', zorder=4)

ax.set_title('自相关强度对五种经典计量推断方法实际假阳性率的侵害退化图', fontsize=13, fontweight='bold', pad=15)
ax.set_xlabel('序列自相关强度 (\\u03c1)', fontsize=11)
ax.set_ylabel('实际拒绝率 (%)', fontsize=11)
ax.set_ylim(0, 50)
ax.grid(axis='y', linestyle=':', alpha=0.5, zorder=0)
ax.legend(fontsize=9, frameon=True, facecolor='white')
ax.set_xticklabels(['\\u03c1 = 0.0 (无自相关)', '\\u03c1 = 0.4 (轻度时序粘性)', '\\u03c1 = 0.8 (严重序列自相关)'], rotation=0, fontsize=10)

for p in ax.patches:
    ax.annotate(f"{p.get_height():.1f}%", (p.get_x() + p.get_width() / 2., p.get_height() + 0.8),
                ha='center', va='center', xytext=(0, 2), textcoords='offset points', fontsize=9, fontweight='bold')

plt.tight_layout()
print("📈 正在弹出学术仿真柱状图窗口...")
plt.show()
