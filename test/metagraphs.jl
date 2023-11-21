using GraphsInterfaceChecker
using Graphs
using MetaGraphs
using Test

graphs = [
    SimpleGraph(0, 0),
    SimpleGraph(10, 20),
    SimpleGraph(4, 6),
    SimpleDiGraph(5, 20),
    SimpleDiGraph([1 1 0; 1 0 1; 0 0 0]),
    SimpleGraph([0 1 0; 1 0 0; 0 0 0]),
]
mgs = map((g) -> MetaGraph(g, 2.0), graphs)

@test Interfaces.test(AbstractGraphInterface, MetaGraph, mgs)
