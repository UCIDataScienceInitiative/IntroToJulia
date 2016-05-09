# Script for producing an animation
# Requires Plots.jl, PyPlot (matplotlib~1.5), and Linux (Windows confirmed not to work as of 5/9/2016)

using Plots
pyplot(reuse=true)
sr() = sort(2rand(100)-1)
@gif for i=0:0.2:5
    x, y = sr(), sr()
    z = map((x,y) -> sin(x+i)+cos(y), x, y)
    surface(x, y, z)
end
