module GraphsInterfaceChecker

## Imports

using Interfaces: @interface
using Graphs: AbstractGraph, nv

## Individual conditions

conditions_nv = (
    "`nv` must output an integer`" => g -> nv(g) isa Integer,
)

## Mandatory and optional

mandatory = (
    conditions_nv = conditions_nv,
)
optional = (;)

## Components

components = (
    mandatory = mandatory,
    optional = optional
)

## Description

description = """
Defines the AbstractGraph interface.
"""

## Declaration

@interface AbstractGraphInterface AbstractGraph components description

## Exports

export AbstractGraphInterface

end
