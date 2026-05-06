#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import "const.typ": *

#let router(
	pos, 
	label, 
	tint, 
	width: 5mm,
	height: 5mm,
	dash: "solid", 
	lighten: 25%, 
	alpha: 100%,
	offset-x: 0.5mm,
	offset-y: 0.5mm,
) = {
	let router-fill = if alpha == 0% { none } else { tint.lighten(lighten) }
	let router-stroke = (paint: black, thickness: tile-border-dim, dash: dash)
	let router-square(body) = box(width: width, height: height, fill: router-fill, stroke: router-stroke, body)

	node(
		pos,
		box(width: width, height: height)[
			#place(center, dx: -offset-x * 2, dy: -offset-y * 2, router-square([]))
			#place(center, dx: -offset-x, dy: -offset-y, router-square([]))
			#place(center, router-square(align(center + horizon, label)))
		],
		width: width,
		height: height,
	)
}