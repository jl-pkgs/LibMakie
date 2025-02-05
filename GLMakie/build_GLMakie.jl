#!julia build_GLMakie.jl
# https://julialang.github.io/PackageCompiler.jl/dev/sysimages.html#What-is-a-sysimage
using PackageCompiler
using Pkg

Pkg.activate(@__DIR__)

# pkg = "RTableTools"
pkg = "GLMakie"
lib = "lib$(pkg)_v202502.dll"

# # 创建包含 Ipaper 的系统镜像
# create_sysimage(["Ipaper"]; sysimage_path="Ipaper.dll")

# script = """
# using $pkg
# """

# precompile_execution_file = script
# precompile_execution_file="./precompile.jl"
@time create_sysimage([pkg]; sysimage_path=lib) # about 10min
