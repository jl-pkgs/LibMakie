# https://julialang.github.io/PackageCompiler.jl/dev/sysimages.html#What-is-a-sysimage
using PackageCompiler
using Pkg

pkg = "Makie"
lib = "$(pkg)_v2.dll"

Pkg.activate(pkg)
Pkg.update()

# precompile_execution_file = script
# precompile_execution_file="./precompile.jl"
@time create_sysimage([pkg]; sysimage_path=lib) # about 10min
