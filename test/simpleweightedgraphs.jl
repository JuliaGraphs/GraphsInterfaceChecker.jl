using GraphsInterfaceChecker
using Graphs
using SimpleWeightedGraphs
using Test

sources = [1, 2, 1];
destinations = [2, 3, 3];
weights = [0.5, 0.8, 2.0];

g1 = SimpleWeightedGraph(sources, destinations, weights)

g2 = SimpleWeightedGraph(6)

g3 = SimpleWeightedGraph(SimpleGraph([0 1; 1 0]), 2)

gs = [g1, g2, g3]

@test Interfaces.test(AbstractGraphInterface, SimpleWeightedGraph, gs)
