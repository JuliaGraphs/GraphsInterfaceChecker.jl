using Graphs
using GraphsInterfaceChecker
using Interfaces
import MetaGraphsNext as MGN
using Test

test_graphs = [SimpleGraph(0), path_graph(4), complete_graph(4)]
test_digraphs = [SimpleDiGraph(0), path_digraph(4), complete_digraph(4)]

function make_metagraph(g)
    return MGN.MetaGraph(
        g, vertices(g) .=> nothing, collect(zip(src.(edges(g)), dst.(edges(g))) .=> nothing)
    )
end

test_metagraphs = vcat(map(make_metagraph, test_graphs), map(make_metagraph, test_digraphs))

@implements AbstractGraphInterface MGN.MetaGraph test_metagraphs

@test Interfaces.test(AbstractGraphInterface, MGN.MetaGraph)
