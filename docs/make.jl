using HashBlotto
using Documenter

DocMeta.setdocmeta!(HashBlotto, :DocTestSetup, :(using HashBlotto); recursive=true)

makedocs(;
    modules=[HashBlotto],
    authors="mmcmanus1 <mattmcmanus41@gmail.com> and contributors",
    repo="https://github.com/mmcmanus1/HashBlotto.jl/blob/{commit}{path}#{line}",
    sitename="HashBlotto.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://mmcmanus1.github.io/HashBlotto.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=["Home" => "index.md"],
)

deploydocs(; repo="github.com/mmcmanus1/HashBlotto.jl", devbranch="main")
