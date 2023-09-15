using COPIERTemplateExample
using Documenter

DocMeta.setdocmeta!(COPIERTemplateExample, :DocTestSetup, :(using COPIERTemplateExample); recursive = true)

makedocs(;
  modules = [COPIERTemplateExample],
  doctest = true,
  linkcheck = false,
  strict = false,
  authors = "Abel Soares Siqueira <abel.s.siqueira@gmail.com> and contributors",
  repo = "https://github.com/abelsiqueira/COPIERTemplateExample.jl/blob/{commit}{path}#{line}",
  sitename = "COPIERTemplateExample.jl",
  format = Documenter.HTML(;
    prettyurls = get(ENV, "CI", "false") == "true",
    canonical = "https://abelsiqueira.github.io/COPIERTemplateExample.jl",
    assets = ["assets/style.css"],
  ),
  pages = [
    "Home" => "index.md",
    "Contributing" => "contributing.md",
    "Dev setup" => "developer.md",
    "Reference" => "reference.md",
  ],
)

deploydocs(; repo = "github.com/abelsiqueira/COPIERTemplateExample.jl", push_preview = true)
