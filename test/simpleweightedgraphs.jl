using Graphs
using GraphsInterfaceChecker
using Interfaces
import SimpleWeightedGraphs as SWG
using Test

test_graphs = [SimpleGraph(0), path_graph(4), complete_graph(4)]
test_digraphs = [SimpleDiGraph(0), path_digraph(4), complete_digraph(4)]

test_weightedgraphs = map(SWG.SimpleWeightedGraph, test_graphs)
test_weighteddigraphs = map(SWG.SimpleWeightedDiGraph, test_digraphs)

@test Interfaces.test(AbstractGraphInterface, SWG.SimpleWeightedGraph, test_weightedgraphs)
@test Interfaces.test(
    AbstractGraphInterface, SWG.SimpleWeightedDiGraph, test_weighteddigraphs
)
