#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import "const.typ": *

#let tile(
	pos, 
	label, 
	tint, 
	width: 15mm,
	height: 5mm,
	dash: "solid", 
	lighten: 25%, 
	alpha: 100%
) = {
	node(
		pos, align(center + horizon, label),
		width: width,
		height: height,
		fill: if alpha == 0% { none } else { tint.lighten(lighten) },
		stroke: (paint: black, thickness: tile-border-dim, dash: dash),
	)
}

#let tile-none(
	pos, 
	label,
	width: 15mm,
	height: 5mm,
) = {
	node(
		pos, align(center + horizon, label),
		width: width,
		height: height,
		fill: white,
		stroke: (paint: black, thickness: tile-border-dim, dash: "solid"),
	)
}

#let tile-others(
	pos, 
	label, 
	tint, 
	width: 15mm,
	height: 5mm,
	lighten: 60%, 
	alpha: 100%
) = {
	node(
		pos, align(center + horizon, label),
		width: width,
		height: height,
		fill: if alpha == 0% { none } else { tint.lighten(lighten) },
		stroke: (paint: black, thickness: tile-border-dim, dash: "solid"),
	)
}