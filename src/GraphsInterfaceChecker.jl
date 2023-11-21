module GraphsInterfaceChecker

## Imports

using Interfaces: @interface, Arguments
using Graphs:
    AbstractGraph,
    nv,
    ne,
    has_vertex,
    has_edge,
    is_directed,
    inneighbors,
    outneighbors,
    edges,
    vertices

## Individual conditions

conditions_directed = ("`is_directed` must output a bool" => g -> is_directed(g) isa Bool,)

conditions_vertices = (
    "`nv` must output an integer`" => g -> nv(g) isa Integer,
    "every vertex in `vertices(g)` must exist" =>
        g -> all(v -> has_vertex(g, v), vertices(g)),
    "no vertex beyond `vertices(g)` should exist" =>
        g -> !has_vertex(g, maximum(vertices(g); init=0) + 1),
)

conditions_edges = (
    "`ne` must output an integer`" => g -> ne(g) isa Integer,
    "total number of outgoing edges should be equal to the total number of ingoing edges" =>
        g ->
            sum(length(outneighbors(g, v)) for v in 1:nv(g); init=0) ==
            sum(length(inneighbors(g, v)) for v in 1:nv(g); init=0),
    "every edge in `edges(g)` must exist" => g -> all(e -> has_edge(g, e), edges(g)),
    "edges with non-present vertex indices should not exist" =>
        g ->
            !has_edge(g, 1, maximum(vertices(g); init=0) + 1) &&
                !has_edge(g, 0, maximum(vertices(g); init=0)),
)

## Mandatory and optional

mandatory = (; conditions_directed, conditions_vertices, conditions_edges)
optional = (;)

## Components

components = (; mandatory, optional)

## Description

description = """
Defines the AbstractGraph interface.
"""

## Declaration

@interface AbstractGraphInterface AbstractGraph components description

## Exports

export AbstractGraphInterface

end
