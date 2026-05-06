#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import "const.typ": *

#let shift-xy(point, dx, dy) = (point.at(0) + dx, point.at(1) + dy)

#let point-add(a, b) = (a.at(0) + b.at(0), a.at(1) + b.at(1))
#let point-sub(a, b) = (a.at(0) - b.at(0), a.at(1) - b.at(1))
#let point-scale(point, factor) = (point.at(0) * factor, point.at(1) * factor)
#let point-length(point) = calc.sqrt(point.at(0) * point.at(0) + point.at(1) * point.at(1))
#let point-unit(point) = {
  let length = point-length(point)

  if length == 0 {
    (0, 0)
  } else {
    (point.at(0) / length, point.at(1) / length)
  }
}

#let parallel-endpoints(from, to, offset, inset) = {
  let direction = point-unit(point-sub(to, from))
  let normal = (-direction.at(1), direction.at(0))
  let offset-vector = point-scale(normal, offset)
  let inset-vector = point-scale(direction, inset)
  (
    point-add(point-add(from, inset-vector), offset-vector),
    point-add(point-sub(to, inset-vector), offset-vector),
  )
}

#let trimmed-endpoints(from, to, from-trim, to-trim) = {
  let direction = point-unit(point-sub(to, from))
  (
    point-add(from, point-scale(direction, from-trim)),
    point-sub(to, point-scale(direction, to-trim)),
  )
}

#let noc-link(
  from,
  to,
  label: none,
  paint: black,
  thickness: 0.075mm,
  large-factor: 5,
  offsets: (0, 0.05, -0.05),
  inset: 0.12,
  from-shifts: ((0, 0), (0, 0), (0, 0)),
  to-shifts: ((0, 0), (0, 0), (0, 0)),
) = {
  let from-0 = point-add(from, from-shifts.at(0))
  let from-1 = point-add(from, from-shifts.at(1))
  let from-2 = point-add(from, from-shifts.at(2))
  let to-0 = point-add(to, to-shifts.at(0))
  let to-1 = point-add(to, to-shifts.at(1))
  let to-2 = point-add(to, to-shifts.at(2))

  (
  edge(
    parallel-endpoints(from-0, to-0, offsets.at(0), inset).at(0),
    parallel-endpoints(from-0, to-0, offsets.at(0), inset).at(1),
    marks: (none, none),
    stroke: (paint: paint, thickness: thickness, cap: "butt"),
    layer: 1,
  ),
  edge(
    parallel-endpoints(from-1, to-1, offsets.at(1), inset).at(0),
    parallel-endpoints(from-1, to-1, offsets.at(1), inset).at(1),
    marks: (none, none),
    stroke: (paint: paint, thickness: thickness, cap: "butt"),
    layer: 1,
  ),
  edge(
    parallel-endpoints(from-2, to-2, offsets.at(2), inset).at(0),
    parallel-endpoints(from-2, to-2, offsets.at(2), inset).at(1),
    marks: (none, none),
    stroke: (paint: paint, thickness: thickness * large-factor, cap: "butt"),
    layer: 1,
  ),
  )
}

#let traffic(
  from,
  to,
  label: none,
  paint: black,
  bend: 0deg,
  marks: (none, "stealth"),
) = {
  edge(
    from,
    to,
    if label == none { [] } else { label },
    marks: marks,
    stroke: (
      paint: paint,
      thickness: arrow-dim,
    ),
    layer: 1,
    bend: bend,
  )
}