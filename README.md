# GraphsInterfaceChecker

[![Build Status](https://github.com/JuliaGraphs/GraphsInterfaceChecker.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/JuliaGraphs/GraphsInterfaceChecker.jl/actions/workflows/CI.yml?query=branch%3Amain)

Formalization of the [`AbstractGraph` interface](https://juliagraphs.org/Graphs.jl/stable/ecosystem/interface/) from [Graphs.jl](https://github.com/JuliaGraphs/Graphs.jl), specified using [Interfaces.jl](https://github.com/rafaqz/Interfaces.jl).

## Getting started

Install GraphsInterfaceChecker.jl using the GitHub URL, and install Interfaces.jl from the general registry:

```julia
using Pkg

Pkg.add(url="https://github.com/JuliaGraphs/GraphsInterfaceChecker.jl")
Pkg.add("Interfaces")

using GraphsInterfaceChecker
using Interfaces
```

## Creating a new graph type

The only name exported by this package is `AbstractGraphInterface`.

Suppose you define a new graph type `MyGraphType <: Graphs.AbstractGraph`.
To declare that you implement the interface, you need to provide a list of (small) `test_graphs`, then use the macro `Interfaces.@implements` like so:

```julia
Interfaces.@implements AbstractGraphInterface MyGraphType test_graphs
```

Then, you can validate your implementation as follows:

```julia
Interfaces.test(AbstractGraphInterface, MyGraphType)
```
