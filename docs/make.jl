using COPIERTemplateExample
using Documenter

DocMeta.setdocmeta!(
  COPIERTemplateExample,
  :DocTestSetup,
  :(using COPIERTemplateExample);
  recursive = true,
)

const page_rename = Dict("developer.md" => "Developer docs") # Without the numbers

function nice_name(file)
  file = replace(file, r"^[0-9]*-" => "")
  if haskey(page_rename, file)
    return page_rename[file]
  end
  return splitext(file)[1] |> x -> replace(x, "-" => " ") |> titlecase
end

makedocs(;
  modules = [COPIERTemplateExample],
  doctest = true,
  linkcheck = false, # Rely on Lint.yml/lychee for the links
  authors = "Abel Soares Siqueira <abel.s.siqueira@gmail.com> and contributors",
  repo = "https://github.com/abelsiqueira/COPIERTemplateExample.jl/blob/{commit}{path}#{line}",
  sitename = "COPIERTemplateExample.jl",
  format = Documenter.HTML(;
    prettyurls = true,
    canonical = "https://abelsiqueira.github.io/COPIERTemplateExample.jl",
    assets = ["assets/style.css"],
  ),
  pages = [
    "Home" => "index.md"
    [
      nice_name(file) => file for
      file in readdir(joinpath(@__DIR__, "src")) if file != "index.md" && splitext(file)[2] == ".md"
    ]
  ],
)

deploydocs(; repo = "github.com/abelsiqueira/COPIERTemplateExample.jl", push_preview = true)
