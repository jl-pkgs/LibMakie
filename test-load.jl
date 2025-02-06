# julia -JOrdinaryDiffEq_v202502.dll -JMakie_v202502.dll
# @time using OrdinaryDiffEq
# @time
using TidierPlots
using Random, DataFrames
import Makie.IntervalsBetween, Makie.Attributes
import TidierPlots: theme

using WGLMakie
WGLMakie.activate!()

Random.seed!(123)

xs = 10 .^ (range(-1, stop=1, length=100))

df = DataFrame(x=xs,
  y=xs .^ 2 .+ abs.(2 * randn(length(xs))),
  size=(xs .^ 2/3)[end:-1:1] .+ 6)

beautiful_makie_theme = Attributes(
  fonts=(; regular="CMU Serif"),
)

p = ggplot(df) +
    geom_point(aes(x=:x, y=:y, size=:size, color=:x), alpha=0.8) +
    scale_x_log10() +
    scale_y_log10() +
    labs(x="x", y="y") +
    lims(y=c(0.1, 100)) +
    scale_color_continuous(palette="Hiroshige", name="") +
    theme(
      xminorticksvisible=true,
      xminorgridvisible=true,
      yminorticksvisible=true,
      yminorgridvisible=true,
      xminorticks=IntervalsBetween(9),
      yminorticks=IntervalsBetween(9),
      backgroundcolor=:transparent,
      xgridstyle=:dash,
      ygridstyle=:dash
    ) + beautiful_makie_theme
p
