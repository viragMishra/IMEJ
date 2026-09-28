import numpy as np
import matplotlib.pyplot as plt
from matplotlib.colors import Normalize

# ============================================================
# DATA
# ============================================================

Hs = np.array([0.75, 1.5, 2.5, 3.5])
Tp = np.array([7.5, 9.5, 11.5, 13.5])

# ------------------------------------------------------------
# Case 5: k = 7000, B = 5000
# ------------------------------------------------------------

# G = 15 m
P_Case5_G15 = np.array([
    [171.44,   93.56,  46.31,  24.15],
    [332.86,  167.99,  89.54,  49.89],
    [798.32,  420.21, 226.70, 128.64],
    [1358.82, 749.76, 414.21, 235.45]
])

# G = 25 m
P_Case5_G25 = np.array([
    [188.93, 108.50,  54.94,  29.04],
    [386.52, 200.18, 108.03,  60.75],
    [929.29, 505.42, 275.43, 157.15],
    [1583.37, 904.71, 511.52, 288.84]
])

# ------------------------------------------------------------
# Case 4_3: k = 5000, B = 4000
# ------------------------------------------------------------

# G = 15 m
P_Case43_G15 = np.array([
    [132.14,   87.99,  49.70,  27.25],
    [324.47,  175.81,  98.04,  56.04],
    [766.99,  427.81, 242.41, 141.64],
    [1286.22, 741.83, 431.56, 255.80]
])

# G = 25 m
P_Case43_G25 = np.array([
    [150.35, 113.86,  62.69,  34.98],
    [394.31, 221.38, 125.96,  72.90],
    [920.45, 536.42, 311.46, 184.08],
    [1529.98, 923.49, 555.38, 332.16]
])


# ============================================================
# PERCENTAGE DIFFERENCE
# Use the values reported in your table
# ============================================================

Diff_Case5 = np.array([
    [ 9.3, 13.8, 15.7, 16.8],
    [13.9, 16.1, 17.1, 17.9],
    [14.1, 16.9, 17.7, 18.1],
    [14.2, 17.1, 19.0, 18.5]
])

Diff_Case43 = np.array([
    [12.1, 22.7, 20.7, 22.1],
    [17.7, 20.6, 22.2, 23.1],
    [16.7, 20.2, 22.2, 23.1],
    [15.9, 19.7, 22.3, 23.0]
])


# ============================================================
# JOURNAL STYLE
# ============================================================
plt.rcParams.update({
    "font.family": "serif",
    "font.serif": ["Times New Roman"],

    # LaTeX-like mathematics
    "mathtext.fontset": "stix",

    # General
    "font.size": 8,

    # Axes
    "axes.labelsize": 9,
    "axes.titlesize": 9,

    # Ticks
    "xtick.labelsize": 8,
    "ytick.labelsize": 8,

    # Legend
    "legend.fontsize": 8,

    # Lines
    "lines.linewidth": 1.2,
    "lines.markersize": 4.5,

    # Figure
    "figure.dpi": 150,
    "savefig.dpi": 600,

    # PDF/EPS text handling
    "pdf.fonttype": 42,
    "ps.fonttype": 42
})

# ============================================================
# FIGURE 1
# Average Power — 2 x 2 Heatmap
# ============================================================

fig, axes = plt.subplots(
    2, 2,
    figsize=(6.8, 5.3),
    constrained_layout=True
)

power_data = [
    P_Case5_G15,
    P_Case5_G25,
    P_Case43_G15,
    P_Case43_G25
]

titles = [
    r"(a) Case 5: $k=7000$, $B=5000$, $G=15$ m",
    r"(b) Case 5: $k=7000$, $B=5000$, $G=25$ m",
    r"(c) Case 4_3: $k=5000$, $B=4000$, $G=15$ m",
    r"(d) Case 4_3: $k=5000$, $B=4000$, $G=25$ m"
]

# Common normalization across all four panels
vmin = min(P.min() for P in power_data)
vmax = max(P.max() for P in power_data)

norm = Normalize(vmin=vmin, vmax=vmax)

for ax, data, title in zip(axes.flat, power_data, titles):

    im = ax.imshow(
        data,
        origin="lower",
        aspect="auto",
        extent=[
            Tp[0] - 1,
            Tp[-1] + 1,
            Hs[0] - 0.375,
            Hs[-1] + 0.375
        ],
        cmap="viridis",
        norm=norm
    )

    ax.set_xticks(Tp)
    ax.set_yticks(Hs)

    ax.set_xlabel(r"$T_p$ (s)")
    ax.set_ylabel(r"$H_s$ (m)")
    ax.set_title(title)

    # Add numerical values
    for i, h in enumerate(Hs):
        for j, tp in enumerate(Tp):

            ax.text(
                tp,
                h,
                f"{data[i, j]:.1f}",
                ha="center",
                va="center",
                fontsize=7
            )

    ax.tick_params(direction="in", length=3)

    for spine in ax.spines.values():
        spine.set_linewidth(0.7)


# Common colorbar
cbar = fig.colorbar(
    im,
    ax=axes,
    shrink=0.95,
    pad=0.02
)

cbar.set_label("Average Power (W)")

fig.savefig(
    "Figure_1_Average_Power.png",
    dpi=600,
    bbox_inches="tight"
)

# fig.savefig(
#     "Figure_1_Average_Power.pdf",
#     bbox_inches="tight"
# )

# plt.show()


# ============================================================
# FIGURE 2
# Percentage Increase — 2 x 1 Line Plot
# ============================================================

fig, axes = plt.subplots(
    2, 1,
    figsize=(6.8, 5.3),
    sharey=True,
    constrained_layout=True
)

diff_data = [
    Diff_Case5,
    Diff_Case43
]

titles = [
    r"(a) $k=7000~\mathrm{N/m}$, $B=5000~\mathrm{N\cdot s/m}$",
    r"(b) $k=5000~\mathrm{N/m}$, $B=4000~\mathrm{N\cdot s/m}$"
]

markers = ["o", "s", "^", "D"]

for ax, data, title in zip(axes, diff_data, titles):

    for i, h in enumerate(Hs):

        ax.plot(
            Tp,
            data[i, :],
            marker=markers[i],
            linewidth=1.2,
            markersize=4.5,
            label=fr"$H_s={h}$ m"
        )

    ax.set_xlabel(r"$T_p$ (s)")
    ax.set_title(title)

    ax.set_xticks(Tp)

    ax.set_ylim(5, 25)

    ax.set_yticks(np.arange(5, 26, 5))

    ax.grid(
        True,
        linestyle="--",
        linewidth=0.5,
        alpha=0.5
    )

    ax.tick_params(direction="in", length=3)

    for spine in ax.spines.values():
        spine.set_linewidth(0.7)


axes[0].set_ylabel(
    r"Increase in Average Power ($\%$)"
)

axes[1].legend(
    loc="upper left",
    frameon=False
)

fig.savefig(
    "Figure_2_Gap_Percentage_Difference.png",
    dpi=600,
    bbox_inches="tight"
)

fig.savefig(
    "Figure_2_Gap_Percentage_Difference.png",
    dpi=600,
    bbox_inches="tight"
)

plt.show()