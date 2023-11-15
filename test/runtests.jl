using GraphsInterfaceChecker
using Test

@testset "GraphsInterfaceChecker.jl" begin
    @testset "Graphs.jl" begin
        include("graphs.jl")
    end
    @testset "MetaGraphs.jl" begin
        include("metagraphs.jl")
    end
    @testset "SimpleWeightedGraphs.jl" begin
        include("simpleweightedgraphs.jl")
    end
    @testset "MetaGraphsNext.jl" begin
        include("metagraphsnext.jl")
    end
end
