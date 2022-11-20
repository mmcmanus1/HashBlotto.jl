using v1
using Documenter

DocMeta.setdocmeta!(v1, :DocTestSetup, :(using v1); recursive=true)

makedocs(;
    modules=[v1],
    authors="mmcmanus1 <mattmcmanus41@gmail.com> and contributors",
    repo="https://github.com/mmcmanus1/v1.jl/blob/{commit}{path}#{line}",
    sitename="v1.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://mmcmanus1.github.io/v1.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/mmcmanus1/v1.jl",
    devbranch="main",
)
