using Graphs
using GraphsInterfaceChecker
using Interfaces
using Test

test_graphs = [SimpleGraph(0), path_graph(4), complete_graph(4)]
test_digraphs = [SimpleDiGraph(0), path_digraph(4), complete_digraph(4)]

@implements AbstractGraphInterface{(:mutation)} SimpleGraph test_graphs
@implements AbstractGraphInterface{(:mutation)} SimpleDiGraph test_digraphs

@test Interfaces.test(AbstractGraphInterface, SimpleGraph)
@test Interfaces.test(AbstractGraphInterface, SimpleDiGraph)
