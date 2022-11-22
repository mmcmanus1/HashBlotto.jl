using Aqua
using Documenter
using HashBlotto
using JuliaFormatter
using Test

DocMeta.setdocmeta!(
	MyJuliaPackage,
	:DocTestSetup,
	:(using HashBlotto);
	recursive=true
)

@testset verbose = true "HashBlotto.jl" begin
    @testset verbose = true "Code quality (Aqua.jl)" begin
        Aqua.test_all(HashBlotto; ambiguities=false)
    end
    @testset verbose = true "Code formatting (JuliaFormatter.jl)" begin
        @test format(HashBlotto; verbose=true, overwrite=true)
    end
    @testset verbose = true "Doctests (Documenter.jl)" begin
        doctest(HashBlotto)
    end
end
