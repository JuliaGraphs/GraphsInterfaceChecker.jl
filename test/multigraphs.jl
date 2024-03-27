using Graphs
using GraphsInterfaceChecker
using Interfaces
using Multigraphs
using Test

test_graphs = [Multigraph(0)]
test_digraphs = [DiMultigraph(0)]

@implements AbstractGraphInterface{(:mutation)} Multigraph test_graphs
@implements AbstractGraphInterface{(:mutation)} DiMultigraph test_digraphs

@test_broken Interfaces.test(AbstractGraphInterface, Multigraph)
@test_broken Interfaces.test(AbstractGraphInterface, DiMultigraph)
