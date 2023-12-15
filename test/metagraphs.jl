using Graphs
using GraphsInterfaceChecker
using Interfaces
import MetaGraphs as MG
using Test

test_graphs = [SimpleGraph(0), path_graph(4), complete_graph(4)]
test_digraphs = [SimpleDiGraph(0), path_digraph(4), complete_digraph(4)]

test_metagraphs = map(MG.MetaGraph, test_graphs)
test_metadigraphs = map(MG.MetaDiGraph, test_digraphs)

@implements AbstractGraphInterface MG.MetaGraph test_metagraphs
@implements AbstractGraphInterface MG.MetaDiGraph test_metadigraphs

@test Interfaces.test(AbstractGraphInterface, MG.MetaGraph)
@test Interfaces.test(AbstractGraphInterface, MG.MetaDiGraph)
