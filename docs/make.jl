using GraphsInterfaceChecker
using Documenter

DocMeta.setdocmeta!(GraphsInterfaceChecker, :DocTestSetup, :(using GraphsInterfaceChecker); recursive=true)

makedocs(;
    modules=[GraphsInterfaceChecker],
    authors="Guillaume Dalle <22795598+gdalle@users.noreply.github.com> and contributors",
    repo="https://github.com/gdalle/GraphsInterfaceChecker.jl/blob/{commit}{path}#{line}",
    sitename="GraphsInterfaceChecker.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://gdalle.github.io/GraphsInterfaceChecker.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/gdalle/GraphsInterfaceChecker.jl",
    devbranch="main",
)
