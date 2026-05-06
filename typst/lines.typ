// Copyright 2026 University of Modena and Reggio Emilia.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Author: Gianluca Bellocchi <gianluca.bellocchi@unimore.it>

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