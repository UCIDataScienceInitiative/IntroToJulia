using Documenter, IntroToJulia

CI_FLG = get(ENV, "CI", nothing) == "true"

makedocs(
    modules = [IntroToJulia],
    format = Documenter.HTML(
        prettyurls = CI_FLG,
        canonical = "#",
    ),
    sitename = "Intro To Julia Documentation",
    pages = [

    ],
)

CI_FLG && include("make_examples.jl")

deploydocs(
    repo = "github.com/UCIDataScienceInitiative/IntroToJulia.git",
    push_preview = true,
)