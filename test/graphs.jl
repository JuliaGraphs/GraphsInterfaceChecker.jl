using Graphs
using GraphsInterfaceChecker
using Interfaces
using Test

graphs = [
    SimpleGraph(0, 0),
    SimpleGraph(10, 20),
    SimpleGraph(4, 6),
    SimpleGraph([0 1 0; 1 0 0; 0 0 0]),
]
@test Interfaces.test(AbstractGraphInterface, SimpleGraph, graphs)

digraphs = [SimpleDiGraph(5, 20), SimpleDiGraph([1 1 0; 1 0 1; 0 0 0])]
@test Interfaces.test(AbstractGraphInterface, SimpleDiGraph, digraphs)
