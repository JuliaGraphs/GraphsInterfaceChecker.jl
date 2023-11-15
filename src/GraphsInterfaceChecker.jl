module GraphsInterfaceChecker

## Imports

using Interfaces: @interface, Arguments
using Graphs: AbstractGraph, nv, ne, has_vertex, has_edge, is_directed, inneighbors, outneighbors,edges, vertices

## Individual conditions



conditions_nv = (
    "`nv` must output an integer`" => g -> nv(g) isa Integer,
    "`ne` must output an integer`" => g -> ne(g) isa Integer,
    "`is_directed` must output a bool" => g -> is_directed(g) isa Bool,
    
    "every vertex in `vertices(g)` must exist" => g -> all(v -> has_vertex(g, v), vertices(g)),
    "no vertex beyond `vertices(g)` should exist" =>
        g -> !has_vertex(g, maximum(vertices(g), init=0) + 1),
    "total number of outgoing edges should be equal to the total number of ingoing edges" =>
        g -> sum([length(outneighbors(g, v)) for v in 1:nv(g)]) == sum([length(outneighbors(g, v)) for v in 1:nv(g)]),
    "every edge in `edges(g)` must exist" => g -> all(e -> has_edge(g, e), edges(g)),
    "edges with non-present vertex indices should not exist" => g -> !has_edge(g, 1, maximum(vertices(g), init=0) + 1) && !has_edge(g, 0, maximum(vertices(g), init=0)),

)

## Mandatory and optional

mandatory = (conditions_nv=conditions_nv,)
optional = (;)

## Components

components = (mandatory=mandatory, optional=optional)

## Description

description = """
Defines the AbstractGraph interface.
"""

## Declaration

@interface AbstractGraphInterface AbstractGraph components description

## Exports

export AbstractGraphInterface

end
