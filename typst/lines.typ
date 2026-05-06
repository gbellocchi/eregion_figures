#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import "const.typ": *

#let linegenda(a, b, label, paint, ..args) = {
  paint = paint.darken(25%)
  edge(
    a, 
    b, 
    text(paint, label), 
    marks: ("bar", "bar"), 
    stroke: (paint: black, thickness: arrow-dim), 
    layer: 1,
    label-side: center, ..args
  )
}