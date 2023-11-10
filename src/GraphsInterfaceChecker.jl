module GraphsInterfaceChecker

## Imports

using Interfaces: @interface, Arguments
using Graphs: AbstractGraph, nv

## Individual conditions

conditions_nv = ("`nv` must output an integer`" => g -> nv(g) isa Integer,)

conditions_has_vertex = (
    "`has_vertex` must output a bool`" => g -> has_vertex(g, 1) isa Bool,
    "everyone in `vertices(g)` must exist" => g -> all(v -> has_vertex(g, v), vertices(g)),
    "anyone beyond `vertices(g)` should not exist" =>
        g -> !has_vertex(g, maximum(vertices(g)) + 1),
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
