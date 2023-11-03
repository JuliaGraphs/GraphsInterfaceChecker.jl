using Graphs
using GraphsInterfaceChecker
using Interfaces
using Test

graphs = [SimpleGraph(10, 20)]
@test Interfaces.test(AbstractGraphInterface, SimpleGraph, graphs)
