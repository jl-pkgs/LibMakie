#!julia build_GLMakie.jl
# https://julialang.github.io/PackageCompiler.jl/dev/sysimages.html#What-is-a-sysimage
using PackageCompiler
using Pkg

Pkg.activate(@__DIR__)

pkg = "OrdinaryDiffEq"
lib = "lib$(pkg)_v202502.dll"

@time create_sysimage([pkg]; sysimage_path=lib)
