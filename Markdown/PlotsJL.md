
## An Introduction to Plots.jl

## Idea

Plots.jl is a non-traditional plotting library

- It does not implement a "plotting backend" itself, it's a plotting API
- The API is easily extendable via recipes


## Backends

Plots.jl uses other plotting libraries as backends

- PyPlot (matplotlib): Slow but dependable
- GR: Feature-rich and fast, but new
- Plotly/PlotlyJS: Interactive and good for web
- PGFPlots: Native LaTeX rendering
- UnicodePlots: Plots to unicode for no-display situations

## Using Backends

To switch backends, you simply use the name of the library: https://juliaplots.github.io/backends/


```julia
using Plots
pyplot() # Turns on the PyPlot backend
plot(rand(4,4))
```




![png](PlotsJL_files/PlotsJL_4_0.png)




```julia
gr()
plot(rand(4,4))
```




![svg](PlotsJL_files/PlotsJL_5_0.svg)




```julia
plotly()
plot(rand(4,4))
```




<script src="file:///home/chrisrackauckas/.julia/packages/Plots/EJpx2/src/backends/../../deps/plotly-latest.min.js"></script>    <div id="0d3ee4f0-fa17-4774-ae35-30e5b6a33c30" style="width:600px;height:400px;"></div>
    <script>
    PLOT = document.getElementById('0d3ee4f0-fa17-4774-ae35-30e5b6a33c30');
    Plotly.plot(PLOT, [{"xaxis":"x1","colorbar":{"title":""},"yaxis":"y1","text":[null,null,null,null],"x":[1,2,3,4],"showlegend":true,"mode":"lines","name":"y1","zmin":-0.1,"legendgroup":"y1","zmax":0.1,"line":{"color":"rgba(0, 154, 250, 1.000)","shape":"linear","dash":"solid","width":1},"y":[0.4751332311108285,0.20406353251738474,0.513943753426388,0.4462707828043293],"type":"scatter","hoverinfo":"text"},{"xaxis":"x1","colorbar":{"title":""},"yaxis":"y1","text":[null,null,null,null],"x":[1,2,3,4],"showlegend":true,"mode":"lines","name":"y2","zmin":-0.1,"legendgroup":"y2","zmax":0.1,"line":{"color":"rgba(227, 111, 71, 1.000)","shape":"linear","dash":"solid","width":1},"y":[0.6731255532703246,0.08938254908617815,0.9192029398272605,0.8113525084674296],"type":"scatter","hoverinfo":"text"},{"xaxis":"x1","colorbar":{"title":""},"yaxis":"y1","text":[null,null,null,null],"x":[1,2,3,4],"showlegend":true,"mode":"lines","name":"y3","zmin":-0.1,"legendgroup":"y3","zmax":0.1,"line":{"color":"rgba(62, 164, 78, 1.000)","shape":"linear","dash":"solid","width":1},"y":[0.030658873399396658,0.07247927513128594,0.9935637064688083,0.5478750118312208],"type":"scatter","hoverinfo":"text"},{"xaxis":"x1","colorbar":{"title":""},"yaxis":"y1","text":[null,null,null,null],"x":[1,2,3,4],"showlegend":true,"mode":"lines","name":"y4","zmin":-0.1,"legendgroup":"y4","zmax":0.1,"line":{"color":"rgba(195, 113, 210, 1.000)","shape":"linear","dash":"solid","width":1},"y":[0.1897273340993031,0.268661575258087,0.3347834270915251,0.8529302573635269],"type":"scatter","hoverinfo":"text"}], {"showlegend":true,"xaxis":{"showticklabels":true,"gridwidth":0.5,"tickvals":[1.0,2.0,3.0,4.0],"visible":true,"ticks":"inside","range":[0.91,4.09],"domain":[0.05100612423447069,0.9934383202099737],"tickmode":"array","linecolor":"rgba(0, 0, 0, 1.000)","showgrid":true,"title":"","mirror":false,"tickangle":0,"showline":true,"gridcolor":"rgba(0, 0, 0, 0.100)","titlefont":{"color":"rgba(0, 0, 0, 1.000)","family":"sans-serif","size":15},"tickcolor":"rgb(0, 0, 0)","ticktext":["1","2","3","4"],"zeroline":false,"type":"-","tickfont":{"color":"rgba(0, 0, 0, 1.000)","family":"sans-serif","size":11},"zerolinecolor":"rgba(0, 0, 0, 1.000)","anchor":"y1"},"paper_bgcolor":"rgba(255, 255, 255, 1.000)","annotations":[],"height":400,"margin":{"l":0,"b":20,"r":0,"t":20},"plot_bgcolor":"rgba(255, 255, 255, 1.000)","yaxis":{"showticklabels":true,"gridwidth":0.5,"tickvals":[0.2,0.4,0.6000000000000001,0.8,1.0],"visible":true,"ticks":"inside","range":[0.0017717284073143075,1.0224508514608908],"domain":[0.03762029746281716,0.9901574803149606],"tickmode":"array","linecolor":"rgba(0, 0, 0, 1.000)","showgrid":true,"title":"","mirror":false,"tickangle":0,"showline":true,"gridcolor":"rgba(0, 0, 0, 0.100)","titlefont":{"color":"rgba(0, 0, 0, 1.000)","family":"sans-serif","size":15},"tickcolor":"rgb(0, 0, 0)","ticktext":["0.2","0.4","0.6","0.8","1.0"],"zeroline":false,"type":"-","tickfont":{"color":"rgba(0, 0, 0, 1.000)","family":"sans-serif","size":11},"zerolinecolor":"rgba(0, 0, 0, 1.000)","anchor":"x1"},"legend":{"tracegroupgap":0,"bordercolor":"rgba(0, 0, 0, 1.000)","bgcolor":"rgba(255, 255, 255, 1.000)","font":{"color":"rgba(0, 0, 0, 1.000)","family":"sans-serif","size":11},"y":1.0,"x":1.0},"width":600});
    </script>




## Attributes

The attributes work with each of the backends: https://juliaplots.github.io/attributes/

Compatibility of attributes is found in this chart: https://juliaplots.github.io/supported/

I find it easiest to use this page to find the right attributes: https://juliaplots.github.io/examples/pyplot/


```julia
pyplot()
plot(rand(4,4),title="Test Title",label=["First" "Second" "Third" "Fourth"])
```




![png](PlotsJL_files/PlotsJL_8_0.png)




```julia
gr()
plot(rand(4,4),title="Test Title",label=["First" "Second" "Third" "Fourth"])
```




![svg](PlotsJL_files/PlotsJL_9_0.svg)




```julia
plotly()
plot(rand(4,4),title="Test Title",label=["First" "Second" "Third" "Fourth"])
```




<script src="file:///home/chrisrackauckas/.julia/packages/Plots/EJpx2/src/backends/../../deps/plotly-latest.min.js"></script>    <div id="2bf2d3f0-d54b-4866-b001-92b1e583f48f" style="width:600px;height:400px;"></div>
    <script>
    PLOT = document.getElementById('2bf2d3f0-d54b-4866-b001-92b1e583f48f');
    Plotly.plot(PLOT, [{"xaxis":"x1","colorbar":{"title":""},"yaxis":"y1","text":[null,null,null,null],"x":[1,2,3,4],"showlegend":true,"mode":"lines","name":"First","zmin":-0.1,"legendgroup":"First","zmax":0.1,"line":{"color":"rgba(0, 154, 250, 1.000)","shape":"linear","dash":"solid","width":1},"y":[0.3127275693683367,0.23776352537424472,0.7167579469971546,0.7013710259291803],"type":"scatter","hoverinfo":"text"},{"xaxis":"x1","colorbar":{"title":""},"yaxis":"y1","text":[null,null,null,null],"x":[1,2,3,4],"showlegend":true,"mode":"lines","name":"Second","zmin":-0.1,"legendgroup":"Second","zmax":0.1,"line":{"color":"rgba(227, 111, 71, 1.000)","shape":"linear","dash":"solid","width":1},"y":[0.4149196236374546,0.10659875991794432,0.2042616488780724,0.4864887913127496],"type":"scatter","hoverinfo":"text"},{"xaxis":"x1","colorbar":{"title":""},"yaxis":"y1","text":[null,null,null,null],"x":[1,2,3,4],"showlegend":true,"mode":"lines","name":"Third","zmin":-0.1,"legendgroup":"Third","zmax":0.1,"line":{"color":"rgba(62, 164, 78, 1.000)","shape":"linear","dash":"solid","width":1},"y":[0.18514597622398288,0.5775527951512993,0.7183094961553516,0.13952742650562233],"type":"scatter","hoverinfo":"text"},{"xaxis":"x1","colorbar":{"title":""},"yaxis":"y1","text":[null,null,null,null],"x":[1,2,3,4],"showlegend":true,"mode":"lines","name":"Fourth","zmin":-0.1,"legendgroup":"Fourth","zmax":0.1,"line":{"color":"rgba(195, 113, 210, 1.000)","shape":"linear","dash":"solid","width":1},"y":[0.7793470922411607,0.3690378221304127,0.18902855667902507,0.16630410344152113],"type":"scatter","hoverinfo":"text"}], {"showlegend":true,"xaxis":{"showticklabels":true,"gridwidth":0.5,"tickvals":[1.0,2.0,3.0,4.0],"visible":true,"ticks":"inside","range":[0.91,4.09],"domain":[0.05100612423447069,0.9934383202099737],"tickmode":"array","linecolor":"rgba(0, 0, 0, 1.000)","showgrid":true,"title":"","mirror":false,"tickangle":0,"showline":true,"gridcolor":"rgba(0, 0, 0, 0.100)","titlefont":{"color":"rgba(0, 0, 0, 1.000)","family":"sans-serif","size":15},"tickcolor":"rgb(0, 0, 0)","ticktext":["1","2","3","4"],"zeroline":false,"type":"-","tickfont":{"color":"rgba(0, 0, 0, 1.000)","family":"sans-serif","size":11},"zerolinecolor":"rgba(0, 0, 0, 1.000)","anchor":"y1"},"paper_bgcolor":"rgba(255, 255, 255, 1.000)","annotations":[{"yanchor":"top","xanchor":"center","rotation":-0.0,"y":1.0,"font":{"color":"rgba(0, 0, 0, 1.000)","family":"sans-serif","size":20},"yref":"paper","showarrow":false,"text":"Test Title","xref":"paper","x":0.5222222222222223}],"height":400,"margin":{"l":0,"b":20,"r":0,"t":20},"plot_bgcolor":"rgba(255, 255, 255, 1.000)","yaxis":{"showticklabels":true,"gridwidth":0.5,"tickvals":[0.1,0.2,0.30000000000000004,0.4,0.5,0.6000000000000001,0.7000000000000001],"visible":true,"ticks":"inside","range":[0.08641630994824782,0.7995295422108573],"domain":[0.03762029746281716,0.9415463692038496],"tickmode":"array","linecolor":"rgba(0, 0, 0, 1.000)","showgrid":true,"title":"","mirror":false,"tickangle":0,"showline":true,"gridcolor":"rgba(0, 0, 0, 0.100)","titlefont":{"color":"rgba(0, 0, 0, 1.000)","family":"sans-serif","size":15},"tickcolor":"rgb(0, 0, 0)","ticktext":["0.1","0.2","0.3","0.4","0.5","0.6","0.7"],"zeroline":false,"type":"-","tickfont":{"color":"rgba(0, 0, 0, 1.000)","family":"sans-serif","size":11},"zerolinecolor":"rgba(0, 0, 0, 1.000)","anchor":"x1"},"legend":{"tracegroupgap":0,"bordercolor":"rgba(0, 0, 0, 1.000)","bgcolor":"rgba(255, 255, 255, 1.000)","font":{"color":"rgba(0, 0, 0, 1.000)","family":"sans-serif","size":11},"y":1.0,"x":1.0},"width":600});
    </script>




## Animations

Any plot can be animated


```julia
# initialize the attractor
n = 1500
dt = 0.02
σ, ρ, β = 10., 28., 8/3
x, y, z = 1., 1., 1.

# initialize a 3D plot with 1 empty series
plt = path3d(1, xlim=(-25,25), ylim=(-25,25), zlim=(0,50),
                xlab = "x", ylab = "y", zlab = "z",
                title = "Lorenz Attractor", marker = 1)

# build an animated gif, saving every 10th frame
@gif for i=1:n
    global x,y,z,σ
    dx = σ*(y - x)     ; x += dt * dx
    dy = x*(ρ - z) - y ; y += dt * dy
    dz = x*y - β*z     ; z += dt * dz
    push!(plt, x, y, z)
end every 10
```

## Recipes

Recipes are abstract instructions for how to "build a plot" from data. There are multiple kinds of recipes. In execution order:

- User Recipes: Provides dispatches to plotting
- Type Recipes: Says how to interpret the data of an abstract type
- Plot Recipes: A pre-processing recipe which builds a set of series plots and defaults
- Series Recipes: What most would think of as a "type of plot", i.e. scatter, histogram, etc.

Since these extend Plots.jl itself, all of Plots.jl is accessible from the plotting commands that these make, and these recipes are accessible from each other.

[Series recipes are used to extend the compatibility of backends itself!]

[Check out of the Plots Ecosystem!](https://juliaplots.github.io/ecosystem/)

## Type Recipe Example


```julia
using DifferentialEquations
sol = solve(ODEProblem((u,p,t)->1.01u,0.5,(0.0,1.0)))
@show typeof(sol)
gr()
plot(sol,title="The Attributes Still Work")
```

    typeof(sol) = OrdinaryDiffEq.ODECompositeSolution{Float64,1,Array{Float64,1},Nothing,Nothing,Array{Float64,1},Array{Array{Float64,1},1},ODEProblem{Float64,Tuple{Float64,Float64},false,Nothing,ODEFunction{false,getfield(Main, Symbol("##7#8")),LinearAlgebra.UniformScaling{Bool},Nothing,Nothing,Nothing,Nothing,Nothing,Nothing,Nothing,Nothing},Nothing,DiffEqBase.StandardODEProblem},CompositeAlgorithm{Tuple{Tsit5,Rosenbrock23{0,false,LinSolveFactorize{typeof(LinearAlgebra.lu!)},DataType}},AutoSwitch{Tsit5,Rosenbrock23{0,false,LinSolveFactorize{typeof(LinearAlgebra.lu!)},DataType},Rational{Int64},Float64}},OrdinaryDiffEq.CompositeInterpolationData{ODEFunction{false,getfield(Main, Symbol("##7#8")),LinearAlgebra.UniformScaling{Bool},Nothing,Nothing,Nothing,Nothing,Nothing,Nothing,Nothing,Nothing},Array{Float64,1},Array{Float64,1},Array{Array{Float64,1},1},OrdinaryDiffEq.CompositeCache{Tuple{OrdinaryDiffEq.Tsit5ConstantCache{Float64,Float64},OrdinaryDiffEq.Rosenbrock23ConstantCache{Float64,DiffEqDiffTools.TimeDerivativeWrapper{ODEFunction{false,getfield(Main, Symbol("##7#8")),LinearAlgebra.UniformScaling{Bool},Nothing,Nothing,Nothing,Nothing,Nothing,Nothing,Nothing,Nothing},Float64,Nothing},DiffEqDiffTools.UDerivativeWrapper{ODEFunction{false,getfield(Main, Symbol("##7#8")),LinearAlgebra.UniformScaling{Bool},Nothing,Nothing,Nothing,Nothing,Nothing,Nothing,Nothing,Nothing},Float64,Nothing}}},AutoSwitch{Tsit5,Rosenbrock23{0,false,LinSolveFactorize{typeof(LinearAlgebra.lu!)},DataType},Rational{Int64},Float64}}}}





![svg](PlotsJL_files/PlotsJL_15_1.svg)



## Plot and Type Recipes Together

StatsPlots provides a type recipe for how to read DataFrames, and a series recipe `marginalhist` which puts together histograms into a cohesive larger plot


```julia
using RDatasets, StatPlots, Plots
iris = dataset("datasets","iris")
marginalhist(iris, :PetalLength, :PetalWidth)
```


```julia
M = randn(1000,4)
M[:,2] += 0.8sqrt(abs(M[:,1])) - 0.5M[:,3] + 5
M[:,3] -= 0.7M[:,1].^2 + 2
corrplot(M, label = ["x$i" for i=1:4])
```


```julia
import RDatasets
pyplot()
singers = RDatasets.dataset("lattice","singer")
violin(singers,:VoicePart,:Height,marker=(0.2,:blue,stroke(0)))
boxplot!(singers,:VoicePart,:Height,marker=(0.3,:orange,stroke(2)))
```

## Series Type

A series type allows you to define an entirely new way of visualizing data into backends.


```julia
groupedbar(rand(10,3), bar_position = :dodge, bar_width=0.7)
```




![png](PlotsJL_files/PlotsJL_21_0.png)




```julia
gr()
groupedbar(rand(10,3), bar_position = :dodge, bar_width=0.7)
```




![svg](PlotsJL_files/PlotsJL_22_0.svg)



## Project: Regression Plot

Make a beautiful plot of your regression:

- Plot the values as a scatter plot
- Use the mutating plot (`plot!`) to add the linear regression line over the scatter plot
- Use Loess.jl to build a smoothed line, and see how that plots vs your linear regression
- Add a title, label the two lines in a legend, and label the `x` and `y` axis
- Try some other backends: which one do you like the best?
