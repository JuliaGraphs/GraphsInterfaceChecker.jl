using GraphsInterfaceChecker
using Test

@testset "GraphsInterfaceChecker.jl" begin
    @testset "Graphs.jl" begin
        include("graphs.jl")
    end
end
