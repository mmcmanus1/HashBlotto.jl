using Aqua
using Documenter
using HashBlotto
using JuliaFormatter
using Test
using HashCode2014

DocMeta.setdocmeta!(HashBlotto, :DocTestSetup, :(using HashBlotto); recursive=true)

@testset verbose = true "HashBlotto.jl" begin
    # @testset verbose = true "Code quality (Aqua.jl)" begin
    #     Aqua.test_all(HashBlotto; ambiguities=false)
    # end
    # @testset verbose = true "Code formatting (JuliaFormatter.jl)" begin
    #     @test format(HashBlotto; verbose=true, overwrite=true)
    # end
    # @testset verbose = true "Doctests (Documenter.jl)" begin
    #     doctest(HashBlotto)
    # end
    @testset verbose = true "Graph structure tests" begin
        include("graph-structure-test.jl")
    end
    @testset verbose = true "Street structure tests" begin
        include("street-structure-test.jl")
    end
    @testset verbose = true "Final Solution test" begin
        include("greed-test.jl")
    end
    @testset verbose = true "get junction value test" begin
        include("get-junction-value-test.jl")
    end
    @testset verbose = true "get best street test" begin
        include("get-best-street-test.jl")
    end
end
