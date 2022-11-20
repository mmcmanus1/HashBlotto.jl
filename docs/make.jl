using NewBlottoJulia
using Documenter

DocMeta.setdocmeta!(NewBlottoJulia, :DocTestSetup, :(using NewBlottoJulia); recursive=true)

makedocs(;
    modules=[NewBlottoJulia],
    authors="mattmcm <mattmcm@mit.edu> and contributors",
    repo="https://github.com/mmcmanus1/NewBlottoJulia.jl/blob/{commit}{path}#{line}",
    sitename="NewBlottoJulia.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://mmcmanus1.github.io/NewBlottoJulia.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/mmcmanus1/NewBlottoJulia.jl",
    devbranch="main",
)
