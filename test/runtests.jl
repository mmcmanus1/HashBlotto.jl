using Aqua
using Documenter
using MyJuliaPackage
using JuliaFormatter
using Test

DocMeta.setdocmeta!(
	MyJuliaPackage,
	:DocTestSetup,
	:(using MyJuliaPackage);
	recursive=true
)

@testset verbose = true "MyJuliaPackage.jl" begin

    @testset verbose = true "Doctests (Documenter.jl)" begin
        doctest(MyJuliaPackage)
    end

	@testset verbose = true "My own tests" begin
		@test 1 + 1 == 2
	end
end