using Aqua
using GraphsInterfaceChecker
using JuliaFormatter
using Test

@testset verbose = true "GraphsInterfaceChecker.jl" begin
    @testset "Aqua" begin
        Aqua.test_all(GraphsInterfaceChecker)
    end
    @testset "JuliaFormatter" begin
        @test JuliaFormatter.format(GraphsInterfaceChecker; overwrite=false)
    end
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
    @testset "Multigraphs.jl" begin
        include("multigraphs.jl")
    end
end
