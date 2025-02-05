#!julia build_GLMakie.jl
# https://julialang.github.io/PackageCompiler.jl/dev/sysimages.html#What-is-a-sysimage
using PackageCompiler
using Pkg

Pkg.activate(@__DIR__)

# pkg = "RTableTools"
pkg = "Makie"
lib = "lib$(pkg)_v202502.dll"

# precompile_execution_file = script
# precompile_execution_file="./precompile.jl"
@time create_sysimage([pkg]; sysimage_path=lib) # about 10min
