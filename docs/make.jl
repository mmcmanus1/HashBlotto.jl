using new
using Documenter

DocMeta.setdocmeta!(new, :DocTestSetup, :(using new); recursive=true)

makedocs(;
    modules=[new],
    authors=".",
    repo="https://github.com/mattmcm/new.jl/blob/{commit}{path}#{line}",
    sitename="new.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://mattmcm.github.io/new.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/mattmcm/new.jl",
    devbranch="main",
)
