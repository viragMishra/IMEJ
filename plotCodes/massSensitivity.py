import matplotlib.pyplot as plt
import pandas as pd
from pathlib import Path


plt.rcParams.update({"font.size": 16})

data = [
	(0.75, 5.5, 329.43, 330.25),
	(0.75, 7.5, 232.48, 231.96),
	(0.75, 9.5, 127.81, 127.11),
	(0.75, 11.5, 70.35, 69.79),
	(0.75, 13.5, 37.79, 37.36),
	(0.75, 15.5, 22.33, 22.18),
	(1.5, 7.5, 785.60, 783.68),
	(1.5, 9.5, 440.19, 437.38),
	(1.5, 11.5, 246.64, 244.12),
	(1.5, 13.5, 135.96, 134.23),
	(2.5, 7.5, 1778.81, 1772.85),
	(2.5, 9.5, 1047.29, 1038.09),
	(2.5, 11.5, 596.96, 587.95),
	(2.5, 13.5, 335.42, 328.48),
	(3.5, 7.5, 2875.87, 2864.94),
	(3.5, 9.5, 1765.79, 1746.42),
	(3.5, 11.5, 1058.41, 1036.09),
	(3.5, 13.5, 596.24, 579.90),
]

columns = ["Hs", "Tp", "DS (900 kg HP)", "DS (800 kg HP)"]
table = pd.DataFrame(data, columns=columns)

# Percentage reduction from the 900 kg HP case to the 800 kg HP case.
table["% Reduction"] = (
	(table["DS (900 kg HP)"] - table["DS (800 kg HP)"])
	/ table["DS (900 kg HP)"]
	* 100
)

hs_values = [3.5, 2.5, 1.5, 0.75]
tp_values = [5.5, 7.5, 9.5, 11.5, 13.5, 15.5]
output_directory = Path(__file__).resolve().parent


def make_heatmap(value_column, title, color_map, output_file, value_format):
	heatmap_data = table.pivot(index="Hs", columns="Tp", values=value_column)
	heatmap_data = heatmap_data.reindex(index=hs_values, columns=tp_values)
	values = heatmap_data.to_numpy(dtype=float)

	figure, axis = plt.subplots(figsize=(10, 5.5))
	image = axis.imshow(values, cmap=color_map, aspect="auto")
	legend_label = (
		"% reduction in Avg power"
		if value_column == "% Reduction"
		else value_column
	)
	figure.colorbar(
		image,
		ax=axis,
		orientation="horizontal",
		label=legend_label,
		pad=0.12,
	)
	axis.set_xticks(range(len(tp_values)), labels=tp_values)
	axis.set_yticks(range(len(hs_values)), labels=hs_values)
	axis.set_xlabel("Tp")
	axis.set_ylabel("Hs")
	# axis.set_title(title)

	for row_index in range(values.shape[0]):
		for column_index in range(values.shape[1]):
			value = values[row_index, column_index]
			if not pd.isna(value):
				annotation = (
					f"{value:.2f}%"
					if value_column == "% Reduction"
					else format(value, value_format)
				)
				axis.text(
					column_index,
					row_index,
					annotation,
					ha="center",
					va="center",
					color="black",
				)

	axis.set_xticks(
		[index - 0.5 for index in range(1, len(tp_values))], minor=True
	)
	axis.set_yticks(
		[index - 0.5 for index in range(1, len(hs_values))], minor=True
	)
	axis.grid(which="minor", color="white", linewidth=0.8)
	axis.tick_params(which="minor", bottom=False, left=False)
	figure.tight_layout()
	figure.savefig(output_file, dpi=300, bbox_inches="tight")
	plt.show()


make_heatmap(
	"DS (900 kg HP)",
	"DS for 900 kg HP",
	"YlGnBu",
	output_directory / "heatmap_ds_900kg.png",
	".2f",
)
make_heatmap(
	"DS (800 kg HP)",
	"DS for 800 kg HP",
	"YlGnBu",
	output_directory / "heatmap_ds_800kg.png",
	".2f",
)
make_heatmap(
	"% Reduction",
	"% Reduction in Average Power",
	"RdYlGn_r",
	output_directory / "heatmap_percent_change.png",
	".2f",
)

print(table.to_string(index=False, formatters={"% Reduction in Average Power": "{:.2f}%".format}))
