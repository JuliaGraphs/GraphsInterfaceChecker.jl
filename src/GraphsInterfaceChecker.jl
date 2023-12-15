module GraphsInterfaceChecker

## Imports

using Interfaces: @interface
using Graphs: Graphs

## Mandatory conditions

is_directed = (
    "`is_directed` outputs a boolean" =>
        g -> (
            Graphs.is_directed(g) isa Bool &&
            Graphs.is_directed(typeof(g)) isa Bool &&
            Graphs.is_directed(typeof(g)) == Graphs.is_directed(g)
        ),
)

edgetype = ("`edgetype` outputs a type" => g -> Graphs.edgetype(g) isa DataType,)

vertices = (
    "`vertices` is coherent with `eltype`" =>
        g -> if !isempty(Graphs.vertices(g))
            first(Graphs.vertices(g)) isa eltype(g)
        else
            true
        end,
    "every vertex in `vertices(g)` exists" => g -> all(Graphs.vertices(g)) do v
        Graphs.has_vertex(g, v)
    end,
    "vertices beyond `vertices(g)` don't exist" =>
        g -> (
            !Graphs.has_vertex(g, maximum(Graphs.vertices(g); init=0) + 1) &&
            !Graphs.has_vertex(g, minimum(Graphs.vertices(g); init=0) - 1)
        ),
)

edges = (
    "`edges` is coherent with `edgetype`" =>
        g -> if !isempty(Graphs.edges(g))
            first(Graphs.edges(g)) isa Graphs.edgetype(g)
        else
            true
        end,
    "every edge in `edges` exists" =>
        g -> all(e -> Graphs.has_edge(g, Graphs.src(e), Graphs.dst(e)), Graphs.edges(g)),
    "`edges` are symmetric for undirected graphs" =>
        g -> if !Graphs.is_directed(g)
            all(Graphs.edges(g)) do e
                Graphs.has_edge(g, Graphs.dst(e), Graphs.src(e))
            end
        else
            true
        end,
)

nv = (
    "`nv` outputs an integer`" => g -> Graphs.nv(g) isa Integer,
    "`nv` is coherent with `vertices`" => g -> Graphs.nv(g) == length(Graphs.vertices(g)),
)

ne = (
    "`ne` outputs an integer`" => g -> Graphs.ne(g) isa Integer,
    "`ne` is coherent with `edges`" => g -> Graphs.ne(g) == length(Graphs.edges(g)),
)

neighbors = (
    "`inneighbors` is coherent with `has_edge`" =>
        g -> all(Graphs.vertices(g)) do v
            all(Graphs.inneighbors(g, v)) do u
                Graphs.has_edge(g, u, v)
            end
        end,
    "`outneighbors` is coherent with `has_edge`" =>
        g -> all(Graphs.vertices(g)) do v
            all(Graphs.outneighbors(g, v)) do w
                Graphs.has_edge(g, v, w)
            end
        end,
    "`inneighbors` and `outneighbors` coincide for undirected graphs" =>
        g -> if !Graphs.is_directed(g)
            all(Graphs.vertices(g)) do v
                sort(collect(Graphs.outneighbors(g, v))) ==
                sort(collect(Graphs.inneighbors(g, v)))
            end
        else
            true
        end,
)

weights = (
    "`weights` outputs a matrix of real numbers" =>
        g -> Graphs.weights(g) isa AbstractMatrix{<:Real},
    "`weights` has the right size" =>
        g -> size(Graphs.weights(g)) == (Graphs.nv(g), Graphs.nv(g)),
    "`weights` are symmetric for undirected graphs" =>
        g -> if !Graphs.is_directed(g)
            W = Graphs.weights(g)
            all(Graphs.edges(g)) do e
                W[Graphs.src(e), Graphs.dst(e)] ≈ W[Graphs.dst(e), Graphs.src(e)]
            end
        else
            true
        end,
)

## Mutation

mutation = (
    "`add_vertex!` increases `nv` by one" =>
        g -> begin
            g2 = copy(g)
            if Graphs.add_vertex!(g2)
                Graphs.nv(g2) == Graphs.nv(g) + 1
            else
                true
            end
        end,
    "`rem_vertex!` decreases `nv` by one" =>
        g -> begin
            g2 = copy(g)
            if Graphs.rem_vertex!(g2, Graphs.nv(g2))
                Graphs.nv(g2) == Graphs.nv(g) - 1
            else
                true
            end
        end,
)

## Mandatory and optional

mandatory = (; edgetype, vertices, edges, nv, ne, neighbors, weights)
optional = (; mutation)

## Components

components = (; mandatory, optional)

## Description

concat_with_newline(s1, s2) = s1 * "\n" * s2
lines = readlines(joinpath(dirname(@__DIR__), "README.md"))
description = reduce(concat_with_newline, lines[5:end])

## Declaration

@interface AbstractGraphInterface Graphs.AbstractGraph components description

## Exports

export AbstractGraphInterface

end
